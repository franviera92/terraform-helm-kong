variable name {
  description = "Value for kong name in pods"
  type        = string
  default     = ""
}

variable namespace {
  description = "Namespace where resources are deployed"
  type        = string
  default     = "default"
}

variable chart_version {
  description = "Helm chart version"
  type        = string
  default     = "1.9.1"
}

variable kong_image {
  description = "Kong docker image name"
  type        = string
  default     = "kong"
}

variable kong_tag {
  description = "Kong docker image tag"
  type        = string
  default     = "2.1.4"
}

variable enable_autoscaling {
  description = "Define if autoscale option is enable for Kong's pods"
  type        = bool
  default     = false
}

variable autoscaling_max_replicas {
  description = "Number of maximum replicas of pods"
  type        = string
  default     = 2
}

variable autoscaling_min_replicas {
  description = "Number of minimum replicas of pods"
  type        = string
  default     = 1
}

variable autoscaling_cpu_average_usage {
  description = "Cpu average usage for autoscaling"
  type        = number
  default     = 70
}

variable autoscaling_mem_average_usage {
  description = "Memory average usage for autoscaling"
  type        = number
  default     = 75
}

variable replica_count {
  description = "Number of Kong pod replicas if autoscaling is not enable"
  type        = string
  default     = 1
}

variable database_engine {
  description = "Database engine for Kong"
  type        = string
  default     = "postgres"
}

variable db_host {
  description = "PostgreSQL database hostname"
  type        = string
}

variable db_port {
  description = "PostgreSQL database port"
  type        = string
  default     = "5432"
}

variable db_name {
  description = "PostgreSQL database name"
  type        = string
}

variable db_pass {
  description = "PostgreSQL database password"
  type        = string
}

variable db_user {
  description = "PostgreSQL database user"
  type        = string
}

variable enable_proxy_service {
  description = "Enable Kong proxy service"
  type        = bool
  default     = true
}

variable enable_proxy_https {
  description = "Enable TLS on Kong proxy service"
  type        = bool
  default     = false
}

variable proxy_service_type {
  description = "Kong proxy service type on Kubernetes"
  type        = string
  default     = "ClusterIP"
}

variable proxy_annotations {
  description = "Annotations for the Kong proxy service"
  type        = map
  default     = {}
}

variable enable_proxy_ingress {
  description = "Proxy exposure using another Ingress Controller"
  type        = bool
  default     = false
}

variable proxy_ingress_hosts {
  description = "Proxy Hosts on another Ingress Controller"
  type        = list
  default     = ["api.local"]
}
variable proxy_ingress_path {
  description = "Proxy path on another Ingress Controller"
  type        = string
  default     = "/"
}

variable proxy_ingress_annotations {
  description = "Annotations for proxy on another Ingress Controller"
  type        = map
  default     = {}
}

variable enable_admin_service {
  description = "Enable Kong admin service"
  type        = bool
  default     = true
}

variable admin_service_type {
  description = "Kong admin service type on Kubernetes"
  type        = string
  default     = "ClusterIP"
}

variable admin_annotations {
  description = "Annotations for the Kong admin service"
  type        = map
  default     = {}
}

variable enable_admin_ingress {
  description = "Admin exposure using another Ingress Controller"
  type        = bool
  default     = false
}

variable admin_ingress_hostname {
  description = "Kong admin hostname"
  type        = string
  default     = "admin.local"
}

variable admin_ingress_path {
  description = "Kong admin path on Ingress"
  type        = string
  default     = "/"
}

variable admin_ingress_annotations {
  description = "Annotations for Kong admin ingress"
  type        = map
  default     = {}
}

variable create_ingress_controller {
  description = "Create an Kong Ingress Controller"
  type        = bool
  default     = false
}

variable ingress_controller_install_crds {
  description = "Install CRDS for Kong ingress controller, ONLY if using HELM 2."
  type        = bool
  default     = false
}

variable cpu_limit {
  description = "CPU limit for pods in Kong deployment"
  type        = string
  default     = "600m"

  validation {
    condition     = regex("^\\d+", var.cpu_limit) >= 600
    error_message = "Minimum CPU limit should be 600m for Kong in Development environment."
  }
}

variable cpu_request {
  description = "CPU request for pods in Kong deployment"
  type        = string
  default     = "200m"

  validation {
    condition     = regex("^\\d+", var.cpu_request) >= 200
    error_message = "Minimum CPU request should be 200m for Kong in Development environment."
  }
}

variable memory_limit {
  description = "Memory limit for pods in Kong deployment"
  type        = string
  default     = "500Mi"

  validation {
    condition     = regex("^\\d+", var.memory_limit) >= 500
    error_message = "Minimum memory limit should be 500Mi for Kong in Development environment."
  }
}

variable memory_request {
  description = "Memory request for pods in Kong deployment"
  type        = string
  default     = "200Mi"

  validation {
    condition     = regex("^\\d+", var.memory_request) >= 200
    error_message = "Minimum memory request should be 200Mi for Kong in Development environment."
  }
}