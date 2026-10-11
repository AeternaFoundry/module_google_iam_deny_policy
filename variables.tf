variable "iam_deny_policies" {
  description = <<EOT
Map of iam_deny_policies, attributes below
Required:
    - name
    - parent
    - rules (block):
        - deny_rule (optional, block):
            - denial_condition (optional, block):
                - description (optional)
                - expression (required)
                - location (optional)
                - title (optional)
            - denied_permissions (optional)
            - denied_principals (optional)
            - exception_permissions (optional)
            - exception_principals (optional)
        - description (optional)
Optional:
    - deletion_policy
    - display_name
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name            = string
    parent          = string
    deletion_policy = optional(string)
    display_name    = optional(string)
    rules = list(object({
      deny_rule = optional(object({
        denial_condition = optional(object({
          description = optional(string)
          expression  = string
          location    = optional(string)
          title       = optional(string)
        }))
        denied_permissions    = optional(list(string))
        denied_principals     = optional(list(string))
        exception_permissions = optional(list(string))
        exception_principals  = optional(list(string))
      }))
      description = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.iam_deny_policies : (
        length(v.rules) >= 1
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
}

