data "oci_database_management_external_listener_services" "database_management_external_listener_services_lookup" {
  for_each = var.database_management_external_listener_services_lookup

  external_listener_id    = each.value.external_listener_id
  managed_database_id     = each.value.managed_database_id
  opc_named_credential_id = each.value.opc_named_credential_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

