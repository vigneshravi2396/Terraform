
# Secret Manager Output
output "SECRETARN" {
  value       = module.secret-manager.SECRETARN
}

output "vpc_id" {
  value = module.customvpc.vpcid
  description = "value"
  
}


