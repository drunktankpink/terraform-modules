resource "random_string" "string" {
    length  = var.length
    special = var.special 
}