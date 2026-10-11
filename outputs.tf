output "iam_deny_policies_id" {
  description = "Map of id values across all iam_deny_policies, keyed the same as var.iam_deny_policies except keys with no id are omitted"
  value       = { for k, v in google_iam_deny_policy.iam_deny_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "iam_deny_policies_deletion_policy" {
  description = "Map of deletion_policy values across all iam_deny_policies, keyed the same as var.iam_deny_policies except keys with no deletion_policy are omitted"
  value       = { for k, v in google_iam_deny_policy.iam_deny_policies : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "iam_deny_policies_display_name" {
  description = "Map of display_name values across all iam_deny_policies, keyed the same as var.iam_deny_policies except keys with no display_name are omitted"
  value       = { for k, v in google_iam_deny_policy.iam_deny_policies : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "iam_deny_policies_etag" {
  description = "Map of etag values across all iam_deny_policies, keyed the same as var.iam_deny_policies except keys with no etag are omitted"
  value       = { for k, v in google_iam_deny_policy.iam_deny_policies : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "iam_deny_policies_name" {
  description = "Map of name values across all iam_deny_policies, keyed the same as var.iam_deny_policies except keys with no name are omitted"
  value       = { for k, v in google_iam_deny_policy.iam_deny_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "iam_deny_policies_parent" {
  description = "Map of parent values across all iam_deny_policies, keyed the same as var.iam_deny_policies except keys with no parent are omitted"
  value       = { for k, v in google_iam_deny_policy.iam_deny_policies : k => v.parent if v.parent != null && length(v.parent) > 0 }
}
output "iam_deny_policies_rules" {
  description = "Map of rules values across all iam_deny_policies, keyed the same as var.iam_deny_policies except keys with no rules are omitted"
  value       = { for k, v in google_iam_deny_policy.iam_deny_policies : k => v.rules if v.rules != null && length(v.rules) > 0 }
}

