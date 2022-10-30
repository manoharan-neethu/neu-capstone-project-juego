#!/usr/bin/env bash

# Public Domain
PUBLIC_DOMAIN="juego2022.com"
PUBLIC_CTF_SUBDOMAIN="ctf"

# Region & Zone
GCP_PROJECT_ID="juego-ctf-2022-cp"
GCP_REGION="northamerica-northeast1"
GCP_ZONE="northamerica-northeast1-a"

# VPC and Subnets
VPC_NETWORK="juego2022-ctf-vpc"
DMZ_SUBNET_ID="dmz-subnet"
DMZ_SUBNET_IP_RANGE="10.10.10.0/24"
INTERNAL_SUBNET_ID="internal-subnet"
INTERNAL_SUBNET_IP_RANGE="10.10.20.0/24"
INTERNAL_HOSTED_CHALLENGES_SUBNET_ID="hosted-challenges-cluster-subnet"
INTERNAL_HOSTED_CHALLENGES_SUBNET_IP_RANGE="10.10.30.0/24"

# Ansible Key Path
ANSIBLE_PUBLIC_KEY_PATH=~/.ssh/ansible.pub

# DNS Settings
INTERNAL_DNS_ZONE_ID="juego2022-ctf-private-dns-zone"
INTERNAL_DNS_ZONE_DOMAIN="int.ctf.juego2022.com"

# Wireguard Host Settings
WG_HOST_ID="wireguard-int-ctf-juego2022-com"
WG_INTERNAL_HOSTNAME="wireguard" # will be prepended to .$INTERNAL_DNS_ZONE_DOMAIN
WG_INTERNAL_IP="10.10.10.7"
WG_MACHINE_TYPE="e2-micro"
WG_MACHINE_IMAGE="ubuntu-2004-focal-v20221018"
WG_MACHINE_IMAGE_PROJECT="ubuntu-os-cloud"
WG_MACHINE_DISK_TYPE="pd-standard"
WG_MACHINE_DISK_SIZE="20GB"
WG_PROTOCOL="udp"
WG_PORT="51820"
WG_CLIENT_SUBNET="10.13.13.0/24"

# NGINX Host Settings
NGINX_HOST_ID="nginx-int-ctf-juego2022-com"
NGINX_INTERNAL_HOSTNAME="nginx" # will be prepended to .$INTERNAL_DNS_ZONE_DOMAIN to form FQDN
NGINX_INTERNAL_IP="10.10.10.8"
NGINX_MACHINE_TYPE="e2-micro"
NGINX_MACHINE_IMAGE="ubuntu-2004-focal-v20221018"
NGINX_MACHINE_IMAGE_PROJECT="ubuntu-os-cloud"
NGINX_MACHINE_DISK_TYPE="pd-standard"
NGINX_MACHINE_DISK_SIZE="20GB"

# HAProxy Host Settings
HAPROXY_HOST_ID="haproxy-int-ctf-juego2022-com"
HAPROXY_INTERNAL_HOSTNAME="haproxy" # will be prepended to .$INTERNAL_DNS_ZONE_DOMAIN to form FQDN
HAPROXY_INTERNAL_IP="10.10.10.9"
HAPROXY_MACHINE_TYPE="e2-micro"
HAPROXY_MACHINE_IMAGE="ubuntu-2004-focal-v20221018"
HAPROXY_MACHINE_IMAGE_PROJECT="ubuntu-os-cloud"
HAPROXY_MACHINE_DISK_TYPE="pd-standard"
HAPROXY_MACHINE_DISK_SIZE="20GB"

# CTFd Host Settings
CTFD_HOST_ID="ctfd-int-ctf-juego2022-com"
CTFD_INTERNAL_HOSTNAME="ctfd" # will be prepended to .$INTERNAL_DNS_ZONE_DOMAIN to form FQDN
CTFD_INTERNAL_IP="10.10.20.49"
CTFD_MACHINE_TYPE="e2-micro"
CTFD_MACHINE_IMAGE="ubuntu-2004-focal-v20221018"
CTFD_MACHINE_IMAGE_PROJECT="ubuntu-os-cloud"
CTFD_MACHINE_DISK_TYPE="pd-ssd"
CTFD_MACHINE_DISK_SIZE="20GB"

# ELK Host Settings
ELK_HOST_ID="elk-int-ctf-juego2022-com"
ELK_INTERNAL_HOSTNAME="elk" # will be prepended to .$INTERNAL_DNS_ZONE_DOMAIN to form FQDN
ELK_INTERNAL_IP="10.10.20.51"
ELK_MACHINE_TYPE="e2-micro"
ELK_MACHINE_IMAGE="ubuntu-2004-focal-v20221018"
ELK_MACHINE_IMAGE_PROJECT="ubuntu-os-cloud"
ELK_MACHINE_DISK_TYPE="pd-standard"
ELK_MACHINE_DISK_SIZE="200GB"
ES_PORT="9200"
LOGSTASH_BEATS_PORT="5044"
KIBANA_PORT="5601"

# Hosted Challenge Cluster Settings        
HOSTED_CHALLENGES_CLUSTER_ID="hosted-challenges-cluster"
HOSTED_CHALLENGES_CLUSTER_K8S_VERSION="1.22.12-gke.2300"
HOSTED_CHALLENGES_CLUSTER_RELEASE_CHANNEL="stable"
HOSTED_CHALLENGES_CLUSTER_NODE_NUM="3"
HOSTED_CHALLENGES_CLUSTER_MACHINE_TYPE="e2-small"
HOSTED_CHALLENGES_CLUSTER_IMAGE_TYPE="COS_CONTAINERD"
HOSTED_CHALLENGES_CLUSTER_DISK_TYPE="pd-standard"
HOSTED_CHALLENGES_CLUSTER_DISK_SIZE="20GB"
HOSTED_CHALLENGES_NAMESPACE="hosted-challenges"

