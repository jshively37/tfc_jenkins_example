terraform {
  cloud {
    organization = "jshively_hashi"

    workspaces {
      name = "jenkins_api"
    }
  }
}
