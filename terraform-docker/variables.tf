variable "image" {
  type        = map(any)
  description = "Image to container"
  default = {
    nodered = {
      dev  = "nodered/node-red:latest"
      prod = "nodered/node-red:latest-minimal"
    }
    influxdb = {
      dev  = "influxdb:latest"
      prod = "influxdb:latest"
    }
    grafana = {
      dev  = "grafana/grafana-enterprise"
      prod = "grafana/grafana-enterprise"
    }
  }
}

variable "ext_port" {
  type = map(any)

  #  validation {
  #    condition = max(var.ext_port["dev"]...) <= 65535 && min(var.ext_port["dev"]...) >= 1980
  #    error_message = "The external port must be between 0 and 65535"
  #  }
  #
  #  validation {
  #    condition = max(var.ext_port["prod"]...) <= 1980 && min(var.ext_port["prod"]...) >= 1880
  #    error_message = "The external port must be between 0 and 65535"
  #  }
}

