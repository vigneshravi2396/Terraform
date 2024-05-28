variable "length" {
  type        = number
  description = "The length of a value"
}

variable "special" {
  type        = bool
  description = "A flag indicating if a value has special characteristics"
}

variable "name" {
  type        = string
  description = "A name or label for a value"
}

variable "tags" {
  type        = map(string)
  description = "Tags to associate with the resources or values"
}
