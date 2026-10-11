resource "google_iam_deny_policy" "iam_deny_policies" {
  for_each = var.iam_deny_policies

  name            = each.value.name
  parent          = each.value.parent
  deletion_policy = each.value.deletion_policy
  display_name    = each.value.display_name

  dynamic "rules" {
    for_each = each.value.rules
    content {
      dynamic "deny_rule" {
        for_each = rules.value.deny_rule != null ? [rules.value.deny_rule] : []
        content {
          dynamic "denial_condition" {
            for_each = deny_rule.value.denial_condition != null ? [deny_rule.value.denial_condition] : []
            content {
              description = denial_condition.value.description
              expression  = denial_condition.value.expression
              location    = denial_condition.value.location
              title       = denial_condition.value.title
            }
          }
          denied_permissions    = deny_rule.value.denied_permissions
          denied_principals     = deny_rule.value.denied_principals
          exception_permissions = deny_rule.value.exception_permissions
          exception_principals  = deny_rule.value.exception_principals
        }
      }
      description = rules.value.description
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

