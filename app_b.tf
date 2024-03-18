resource "octopusdeploy_project" "app_b" {
  name                                 = "App B"
  auto_create_release                  = false
  default_guided_failure_mode          = "EnvironmentDefault"
  default_to_skip_if_already_installed = false
  description                          = ""
  discrete_channel_release             = false
  is_disabled                          = false
  is_discrete_channel_release          = false
  is_version_controlled                = false
  lifecycle_id                         = data.octopusdeploy_lifecycles.default.lifecycles[0].id
  project_group_id                     = data.octopusdeploy_project_groups.cloud-team.project_groups[0].id
  tenanted_deployment_participation    = "Tenanted"

  connectivity_policy {
    allow_deployments_to_no_targets = false
    exclude_unhealthy_targets       = false
    skip_machine_behavior           = "SkipUnavailableMachines"
  }

  git_library_persistence_settings {
    git_credential_id = data.octopusdeploy_git_credentials.cac.git_credentials[0].id
    url = "https://github.com/ryanrousseau/app_b.git"
    default_branch = "main"
  }

  template {
    default_value = "Accounts-2923"
    help_text     = "The AWS account used by this account, cluster, application combination."
    label         = "AWS Account"
    name          = "Project.Tenant.AWS.Account"
    display_settings = {
      "Octopus.ControlType" : "AmazonWebServicesAccount"
    }
  }

  template {
    default_value = "us-east-2"
    help_text     = "The region code for AWS resources used by this account and cluster."
    label         = "AWS Region Code"
    name          = "Project.Tenant.AWS.RegionCode"
    display_settings = {
      "Octopus.ControlType" : "SingleLineText"
    }
  }
  
  template {
    default_value = "##{Octopus.Deployment.Tenant.Name | ToLower | Replace \" \" \"-\" }-##{Octopus.Project.Name  | ToLower | Replace \" \" \"-\" }-stack"
    help_text     = "The name of the CloudFOrmation stackt used by this account, cluster, application combination."
    label         = "AWS CloudFormation Stack Name"
    name          = "Project.Tenant.CloudFormation.StackName"
    display_settings = {
      "Octopus.ControlType" : "SingleLineText"
    }
  }

  template {
    default_value = "##{Octopus.Deployment.Tenant.Name | ToLower | Replace \" \" \"-\" }-##{Octopus.Project.Name  | ToLower | Replace \" \" \"-\" }-bucket"
    help_text     = "The name of the S3 bucket used by this account, cluster, application combination."
    label         = "AWS S3 Bucket Name"
    name          = "Project.Tenant.CloudFormation.AppBucketName"
    display_settings = {
      "Octopus.ControlType" : "SingleLineText"
    }
  }
}