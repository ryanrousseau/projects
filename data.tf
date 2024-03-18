data "octopusdeploy_environments" "development" {
  name         = "Development"
}

data "octopusdeploy_environments" "test" {
  name         = "Test"
}

data "octopusdeploy_environments" "production" {
  name         = "Production"
}

data "octopusdeploy_lifecycles" "default" {
  partial_name = "Default Lifecycle (Development > Test > Production)"
}

data "octopusdeploy_project_groups" "cloud-team" {
  partial_name = "-Cloud Team-"
}

data "octopusdeploy_project_groups" "templates" {
  partial_name = "-Templates-"
}

data "octopusdeploy_git_credentials" "cac" {
  name = "CaC"
}