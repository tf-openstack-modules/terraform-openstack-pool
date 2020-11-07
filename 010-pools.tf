resource "openstack_lb_pool_v2" "pools" {
  name           = var.name
  description    = var.description
  protocol       = var.protocol
  lb_method      = var.lb_method
  listener_id    = var.listener_id
  persistence    = var.persistence
  admin_state_up = var.admin_state_up
}

resource "openstack_lb_member_v2" "members" {
  count = length(var.members)

  address       = var.members[count.index].address
  protocol_port = var.members[count.index].protocol_port
  pool_id       = openstack_lb_pool_v2.pools.id
  subnet_id     = var.members[count.index].subnet_id
}