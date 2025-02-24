locals {
  math       = 2 * 2
  euqlity    = 2 != 2
  comparison = 2 < 1
  logical    = true || false

}

output "operators" {
  value = {
    math       = local.math
    euqlity    = local.euqlity
    comparison = local.comparison
    logical    = local.logical
  }
}