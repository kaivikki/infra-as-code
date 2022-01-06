resource "aws_msk_cluster" "team6-kafka-cluster" {
  cluster_name           = var.kafka-cluster-name
  kafka_version          = "2.6.2"
  number_of_broker_nodes = var.number_of_broker_nodes

  broker_node_group_info {
    instance_type   = "kafka.t3.small"
    ebs_volume_size = 10
    client_subnets  = data.aws_subnet_ids.team6-vpc-subnet.ids
    security_groups = [data.aws_security_group.team6-security-group.id]
  }
}

output "zookeeper_connect_string" {
  value = aws_msk_cluster.team6-kafka-cluster.zookeeper_connect_string
}

output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = aws_msk_cluster.team6-kafka-cluster.bootstrap_brokers_tls
}
