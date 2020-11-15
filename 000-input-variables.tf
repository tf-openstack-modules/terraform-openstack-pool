variable "name" {
  type=string
  description="Human-readable name for the pool."
  default=""
}

variable "description" {
  type=string
  description="uman-readable description for the pool."
  default=""
}

variable "protocol" {
  type=string
  description="The protocol - can either be TCP, HTTP, HTTPS, PROXY or UDP (supported only in Octavia). Changing this creates a new pool."
}

variable "lb_method" {
  type=string
  description="The load balancing algorithm to distribute traffic to the pool's members. Must be one of ROUND_ROBIN, LEAST_CONNECTIONS, SOURCE_IP, or SOURCE_IP_PORT (supported only in Octavia)."
}

variable "persistence" {
  type=object({type=string, cookie_name=string})
  description="Omit this field to prevent session persistence. Indicates whether connections in the same session will be processed by the same Pool member or not. Type is the type of persistence mode. The current specification supports SOURCE_IP, HTTP_COOKIE, and APP_COOKIE. The cookie name uses when type equal APP_COOKIE"
  default={}
}

variable "admin_state_up" {
  type=bool
  description="The administrative state of the pool. A valid value is true (UP) or false (DOWN)."
  default=true
}

variable "listener_id" {
  type=string
  description="The Listener on which the members of the pool will be associated with. Changing this creates a new pool. Note: One of LoadbalancerID or ListenerID must be provided."
  default=""
}

variable "members" {
  type = list(object({address=string, protocol_port=number, subnet_id=string}))
  description="The member of this new pool"
}
