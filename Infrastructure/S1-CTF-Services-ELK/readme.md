# CTF Services: Easticsearch, Logstash, and Kibana (ELK)

## Purpose

"Elasticsearch is a search and analytics engine. Logstash is a server‑side data processing pipeline that ingests data from multiple sources simultaneously,      transforms it, and then sends it to a "stash" like Elasticsearch. Kibana lets users visualize data with charts and graphs in Elasticsearch." - Elastic


Elasticsearch, Logstash, and Kibana, better known as "The ELK Stack", allow the CTF Infrastructure Administrator to:
- Monitor scoreboard health (500 errors, bad requests, etc.)
- Monitor the scoreboard for evidence of crawling, scanning, and bruteforcing (login form, registration form). 
- Monitor player behaviour for evidence of cheating such as flag submission bruteforcing
- Visualize, aggregate, and report game statistics on the fly

This repository hosts five docker images: a 3-node Elasticsearch cluster, Logstash, and Kibana. These services are deployed using Ansible and docker-compose as part of the automated infrastructure build process. 


## Configuration

For a full configuration and administration guide, see Elastic Stack's [official documentation](https://www.elastic.co/guide/index.html). The remainder of this section will discuss important details relevant to the CTF infrastructure administrator.

### Configuration Files
Each service is configured using a YAML file in its config directory. The YAML file is named after the service. For example, es01 is configured using `es01/config/elasticsearch.yml`. Configuration parameters can also be set using environment variables under the `environment` key for each service in `docker-compose.yml`.

Some of these configuration parameters, such as `PERMANENT_ELASTIC_PASSWORD` and `LOGSTASH_INTERNAL_USER_PASS` are secrets that should never be committed to a git repository. These secrets are read from a `.env` file in the same directory as `docker-compose.yml`. This `.env` file has been gitignored (i.e. it is not present in this Github repository). It is created automatically during the initial deployment by Ansible.

Effectively, Ansible pulls passwords from a LastPass password vault, injects them into a template `.env` file, and then transfers this file over to the ELK host.
  
### Secure Cluster 

Security features are enabled in this Elasticsearch cluster. TLS is enabled at the transport layer securing communication between Elasticsearch nodes. TLS is also enabled at the HTTP REST interface securing communication between Elasticsearch nodes and HTTP clients using the Elasticsearch API. 

A server certificate is also generated for both Logstash, to secure communication with Filebeat agents, and Kibana to secure communication between the server and the user's browser.

Certificates for each service are generated by an Ansible playbook in the **Service Deployment Stage**: [1-generate-cert-bundles.yml](../4-Service-Deployment-Stage/1-generate-cert-bundles.yml).

Unfortunately, this property means that at this time, the services in this repository cannot be deployed in standalone mode out of the box (i.e. without Ansible) because each Dockerfile expects certificate bundles to be present. 

### Logstash Pipeline

In the interest of keeping this repository unopinionated, we do not make assumptions about the type or format of the data you choose to ingest from CTFd or how you choose to process this data. We do, however, provide the pipeline used in juego2022CTF2021 as an example [here](logstash/example-pipeline/ctf2021-logstash.conf).

The pipeline in logstash.conf, however, does process the access and error logs it receives from Nginx as the format of these logs is well-known.

### Kibana Dashboards

CTF monitoring dashboards are not provided out of the box at this time. 

## Deployment

See [elk-env-template.j2](../4-Service-Deployment-Stage/templates/elk-env-template.j2) and [3-deploy-elk.yml](../4-Service-Deployment-Stage/3-deploy-elk.yml). to understand how ELK is deployed. 

### Network Location

Internal Subnet.

### Important Accounts, Credentials, and Secrets

During service deployment, Ansible uses the `lpass` commandline utility to retrieve secrets from a LastPass password vault. The following tables catalog all secrets related to ELK that must be set up in lastpass prior to service deployment.

| LastPass ID                     | Secret Type | Username         | Description | 
|---------------------------------|-------------|------------------|-------------|
| ctf_elastic_user_bootstrap_pass | 16+ Character Password    | elastic          | The elastic user is the equivalent of root in Elasticsearch. It has two passwords. The bootstrap password is used to start the cluster and set the passwords of kibana_system and logstash_system. This password is then changed when the ELK cluster bootstrap process is completed and the logstash_system and kibana_system passwords have been set to ctf_elastic_user_permanent_pass |
| ctf_elastic_user_permanent_pass | 16+ Character Password    | elastic          | The elastic user is the equivalent of root in Elasticsearch. It has two passwords. The bootstrap password is used to start the cluster and set the passwords of kibana_system and logstash_system. This password is then changed when the ELK cluster bootstrap process is completed and the logstash_system and kibana_system passwords have been set to ctf_elastic_user_permanent_pass |
| ctf_logstash_system_user_pass   | 16+ Character Password    | logstash_system  | The logstash_system user is used for shipping logstash monitoring data to a secure Elasticsearch cluster (i.e. to monitor the logstash system)|                                                                                                  
| ctf_kibana_system_user_pass     | 16+ Character Password    | kibana_system    | The kibana_system user is used for shipping kibana monitoring data to a secure Elasticsearch cluster (i.e. to monitor the kibana system)|
| ctf_logstash_internal_user_pass | 16+ Character Password    | logstash_internal| The logstash_internal has the logstash_writr role and is responsible for writing data parsed by logstash to elasticsearch (like processed Nginx and CTFd logs)|

### Pre-Deployment Configuration Checklist

Before starting the automated infrastructue build process, please perform the following steps:
1. Generate secrets related to ELK and store them in a LastPass password vault (See "Important Accounts, Credentials, and Secrets" above.)
2. Review `docker-compose.yml` and verify all configuration parameters.
3. Review `elasticsearch.yml`, `logstash.yml`, and `kibana.yml` configuration files and verify all configuration parameters.

### Post-Deployment Configuration Checklist

Once the automated infrastructure build process is complete, there are a number of steps that need to be taken to prepare ELK for game day.
1. Once all containers are up and running, run the following script to set passwords for built-in ELK users (logstash_system, kibana_system, and elastic) and to create the logstash_internal user:
```
./configure-users.sh
```
2. Set up index patterns in Kibana using the GUI
3. Build security monitoring and game statistics dashboards