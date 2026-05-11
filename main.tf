# 1. The Container
resource "google_dataplex_entry_group" "engine_group" {
  project          = var.hub_project
  location         = var.location
  entry_group_id   = "metadata-engine-group"
  description      = "Custom entry group for all metadata engine entries"
  display_name     = "Metadata Engine Group"
}

# 2. The Blueprint for the Tables
resource "google_dataplex_entry_type" "table_type" {
  project       = var.hub_project
  location      = var.location
  entry_type_id = "table"
  description   = "Custom Entry Type for BigQuery Tables"
  display_name  = "Table"
}

# 3. The Blueprint for the Business Rule Metadata (with the required schema!)
resource "google_dataplex_aspect_type" "business_rule_type" {
  project        = var.hub_project
  location       = var.location
  aspect_type_id = "business-rule-v1"
  description    = "Template for Data Quality Business Rules"
  display_name   = "Business Rule Template"

  metadata_template = <<EOF
{
  "type": "record",
  "name": "BusinessRule",
  "recordFields": [
    { "name": "rule_id", "type": "string" },
    { "name": "name", "type": "string" },
    { "name": "description", "type": "string" },
    { "name": "sql_formula", "type": "string" },
    { "name": "status", "type": "string" }
  ]
}
EOF
}