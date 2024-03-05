#For loop technically not necessary as the outputs aren't being manipulated. Can just use module.container for simplicity
output "application_access" {
  value       = [for x in module.container[*] : x]
  description = "The name and socket for each application."
}