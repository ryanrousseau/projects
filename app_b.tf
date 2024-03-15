resource "octopusdeploy_project" "app_b" {
  auto_create_release                  = false
  default_guided_failure_mode          = "EnvironmentDefault"
  default_to_skip_if_already_installed = false
  description                          = ""
  discrete_channel_release             = false
  is_disabled                          = false
  is_discrete_channel_release          = false
  is_version_controlled                = false
  lifecycle_id                         = data.octopusdeploy_lifecycles.default.lifecycles[0].id
  name                                 = "App B"
  project_group_id                     = data.octopusdeploy_project_groups.cloud-team.project_groups[0].id
  tenanted_deployment_participation    = "Tenanted"

  connectivity_policy {
    allow_deployments_to_no_targets = false
    exclude_unhealthy_targets       = false
    skip_machine_behavior           = "SkipUnavailableMachines"
  }

  template {
    default_value = "example-default-value"
    help_text     = "example-help-test"
    label         = "example-label"
    name          = "example-template-value"
    display_settings = {
      "Octopus.ControlType" : "SingleLineText"
    }
  }
}