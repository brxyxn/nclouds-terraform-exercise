output "sg_group_id" {
  value       = aws_security_group.allow_trafic.id
  description = "Security group id"
}
