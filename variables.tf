variable "database_management_external_listener_services_lookup" {
  description = <<EOT
Map of database_management_external_listener_services_lookup, attributes below
Required:
    - external_listener_id
    - managed_database_id
Optional:
    - opc_named_credential_id
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    external_listener_id    = string
    managed_database_id     = string
    opc_named_credential_id = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

