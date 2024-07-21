variable "geczone" {
    default = "us-central1-c"
  
}

variable "projectid" {
    default = "chromatic-craft-424811-h4"
  
}

variable "instances" {
    default = {
        "jenkins-master" = "e2-medium"
        "jenkins-slave" = "e2-medium"
        "ansible" = "e2-medium"
        "sonar" = "e2-medium"
        "docker" = "e2-medium"
    }
  
}
variable "ports" {
    default = [80,8080,8081,9000]
  
}
variable "node_count" {
    default = 1
  
}