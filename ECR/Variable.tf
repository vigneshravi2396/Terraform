variable "ecr_names" {
  description = "Create ECR with these names"
  type        = list(string)
}

variable "tags" {
  type        = map(string)
  description = "Tags to associate with the Jenkins instance and related resources"
}