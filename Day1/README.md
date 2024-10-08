# Day 1

## Using your Azure pass

Assumption is, you already an active Azure account which isn't your corporate account.

http://www.microsoftazurepass.com/Home/HowTo?Length=5

### Points to note
1. Don't use your corporate azure account, if you do the Azure pass will be reported invalid and goes invalid. The azure pass share only works one time
2. If you are using your personal azure account that has a free credit, applying the azure pass on that account makes your Free credit invalid imediately.
3. If you have already an Azure pass on the Azure account, your new azure will become invalid

## How multiple Operating Systems were installed on the same machine?
- Boot Loaders [ is installed in Sector 0, Byte 0 of your Hard Disk - Master Boot Record(MBR) ]
  - LILO
  - GRUB 2
  - BootCamp (Mac OS-X)
- Only one OS can be active at a time, let's you have installed Windows 10 and Ubuntu 16.04 on your laptop using GRUB 2 Boot Loader, either Windows OS will active or your Ubuntu OS will be active at point of time.

## What is Virtualization?
- aka Hypervisors 
- Hypervisor refers virtualization software
- Hardware requirements
  - CPU Cores
  - RAM
  - Disk
- each Virtual Machine needs to allocated with its own dedicated
  - CPU Cores
  - RAM
  - Storage Disk
- What is the deciding factors to compute the max number of Virtual Machines(VM or Guest OS)
  Processor
  - AMD Processor
    - Virtualization Feature
      - AMD-V is the virtualization feature
  - Intel Processor
    - Virtualization Feature
      - VT-X is the virtualization feature
- Two types of Virtualization
  1. Type 1 Hypervisor
     - meant for Workstations/Servers 
     - Bare-metal Hypervisor
     - Host OS is not required
     - Examples
       - VMWare vSphere/vCenter ( requires License )
  2. Type 2 Hypervisor
     - they are suitable for Laptops/Desktops/Workstations
     - it can only be installed on top a Host OS ( Windows, Mac, Linux )
     - Examples
       - VMWare Workstation ( Windows Host OS, Linux Host OS ) - requires License
       - VMWare Fusion ( Mac OS-X Host OS ) - requires License
       - Oracle Virtual Box ( Free )
       - Parallels ( Mac OS-X ) - requires License
       - KVM - Opensource Hypervisor that can be installed on any Linux OS Distributions

## Processors
- these days supports multiple CPU Cores
- Intel Processor it supports Hyperthreading
  - each Physical core is seen as 2 Virtual cores by your Hypervisor software
  - modern Processors even support upto 8 virtual cores/physical core
- AMD Processor it supports SMT (Simultaneous Multi Threading - equivalent to Intel's Hyperthreading )
  - each Physical core is seen as 2 Virtual cores by your Hypervisor software
  - modern Processors even support upto 8 virtual cores/physical core
- supports two types of Packing
  1. SCM
     - Single Chip Module ( one IC will contain 1 Processor )
  2. MCM
    - Multiple Chip Module ( one IC will contain multiple Processors )
    - Certain AMD Processors supports even 8 Processors in a single IC
    - each Processor could support 8,16,32,48,64,128,256,512 cores, etc.,
  Just image a Motherboad with Dual Processor sockets, each with MCM Processor with 2 Processor on each IC with 256 Physical core
  How many total virtual cores  256 x 2 x 2 x 2= 2 Sockets = 256 x 8 = 2048 virtual cores  

## RAM 
- Types of RAM
  UDIMM - used in desktops
  SODIMM - used in laptops
  RDIMM - used in servers
 
 ## What is cloud computing?
 - Types of cloud
   1. Public cloud ( AWS, Azure, GCP, Digital Ocean, etc., )
   2. Private cloud 
      - Datacenter owned by your organization
      - compute resources of different configurations can be provisioned over Internet
      - storage resources of different capacity and type can be provisioned over Internet
   3. Hybrid cloud
      combination of Private cloud and Public cloud
      
 ### Different types of Cloud services
 1. Infrastructure as a Service (IaaS)
 - You can rent the compute resources(hardware), storage and Internet from the public cloud vendor (AWS,Azure, etc.,)
 - Cloud vendors provides 
   - Just the Hardware, Storage, Network and Internet provided by Cloud vendor
 - OS has to be managed by us
 
 2. Platform as a Service (PaaS)
 - Provided by vendor
   - Virtual machine - Hardware, storage, network and Internet
   - OS is managed by Cloud vendor
   - Examples
     Red Hat OpenShift ( ROSA )
     Google Kubernetes ( AWS - EKS, Azure - AKS )
     
 3. Software as a Service (SaaS)
 - Microsot Office 365
 - Gmail
 - Netflix
 - Intuit QuickBooks ( Inventory software available over Internet )
 - Database Services
 - Application Servers
 - Cloud Vendor
   - manages the Virtual machine, storage, network and Internet
   - OS 
   - Software

## Different types of IP
Two types
- IPv4 and IPv6

IPv4 - 32 bits ( 4 bytes )
256 x 256 x 256 x 256 = Total unique IPs possible on Internet

another classification
- Private IP and Public IP
  - scope of this kind of IP address is limited to the local machine where the VM is running
yet another classification
- Static and Dynamic IP

## Container Technology
- is an application virtualization technology
- Linux Technology
  - Linux Kernel supports
    1. Namespace ( isolation of containers are taken care )
    2. Control Groups (CGroups)
       - allows applying resource quota restrication on containers
       - for instance, 
         - we can restrict how many cpu cores a container access at the max.
         - how much maximum RAM a container can access
 - Some examples of Container softwares
   - LXC
   - Rkt
   - Containerd
   - Docker
   - Podman

## What is Container Engine ?
- a user-friendly high-level tool
- provides easy commands to manage container images and containers
- internally it depends on Container Runtimes to manage containers
- internally it depends on other container image management tools to manage images
- Examples
  1. Docker 
  2. Podman 
- Docker depends on Containerd to manage dockers
- Containerd depends on runC container runtime to manage containers

## What is Container Runtime ?
- is a software that manages containers
  - it can create, list, rename, edit, delete a container
- low-level tool with not so user-friendly commands
- normally end-users almost never the Container Runtimes directly, only Container Engines use Container Runtimes to manage containers
- Examples
  - CRI-O
  - Rkt
  - runC

## What is Docker Image?
- is a specification of container
- docker image is similar to VMWare OS images
- similar to OS ISO images

## What is Docker container ?
- container is a running instance of Container image
- with one container image, you could create many containers
- container represents one application
- container from OS point of view it is a normal application process that runs in a separate namespace

## Installing Microsoft Visual Studio Code Editor in Ubuntu
```
sudo apt-get install wget gpg

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders
```

## Installing Docker Community Edition in Ubuntu (Issue the below commands one by on on RPS Ubuntu Terminal )
```
sudo apt-get update

sudo apt-get install ca-certificates curl gnupg lsb-release -y

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo usermod -aG docker $USER

sudo su $USER

docker --version

docker images
```

Expected output
<pre>
jegan@ubuntu:~/Desktop$ <b>docker --version</b>
Docker version 20.10.21, build baeda1f

jegan@ubuntu:~/Desktop$ <b>docker images</b>
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
</pre>

## Installing the below tools ( RPS Ubuntu Terminal )
```
sudo apt update && sudo apt install -y vim git tree
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
sudo snap install terraform --classic

git --version
az --version
terraform --version
```

Expected output
<pre>
jegan@ubuntu:~/Desktop$ <b>git version</b>
git version 2.25.1

jegan@ubuntu:~/Desktop$ <b>terraform version</b>
Terraform v1.3.5
on linux_amd64

Your version of Terraform is out of date! The latest version
is 1.3.6. You can update by downloading from https://www.terraform.io/downloads.html

jegan@ubuntu:~/Desktop$ <b>az version</b>
{
  "azure-cli": "2.42.0",
  "azure-cli-core": "2.42.0",
  "azure-cli-telemetry": "1.0.8",
  "extensions": {}
}
</pre>

## Docker Containers vs Virtual Machines
1. Containers shares the Host OS kernel
2. Virtual Machines has their own dedicated OS Kernel
3. Virtual Machine is an fully functional OS, whereas container is an application process
4. Every container has its own file system just like Virtual Machines
5. Every container has its own Network stack(OSI Layers) just like Virtual Machines
6. Every container has its own Network Card(s) just like Virtual Machines
7. Every container get its own IP address just like Virtual Machines
9. Containers appears like a Virtual machines in many ways but it is just a lightweight application process
10. Containers is a complementing technolgoy to virtualization, hence Containers will not be able to replaces a Virtual Machine or an OS.


## What is a Container Orchestration Tool
1. Docker SWARM
2. Google Kubernetes
   - supports CLI
   - opensource
3. Red Hat OpenShift 
   - Red Hat's distribution of Kubernetes
   - Developed on top Google Kubernetes
   - requires license
   - supports WebConsole
   - Supports many additional features on top of Kubernetes

4. Azure Red Hat OpenShift (ARO) - Managed Red Hat OpenShift - PaaS from Azure
5. AWS Red Hat OpenShift (ROSA) - Managed Red Hat OpenShift - PaaS from AWS

#### What are the features supported by Container Orchestration Tools
- you can deploy any containerized application like Microservices into these Orchestration Tools
- provides an environment where you can make your application Highly Available (HA)
- supports inbuilt monitoring features
- it can repair your faulty application by restarting or by replacing with another good instance
- it can help in scaling up/down your application instances based user traffic on demand
- it can help upgrading/downgrading your application version from one to other without any down time aka Rolling update
- it supports service discovery
- it also supports deploying traditional application(non-microservices) which are containerized


## Terraform overview
- is a infrastructure as a code tool
- precisely it is a provisional tool
- it can automate provisioning infrastructure in on-prem & all types of cloud environments

![Terraform](terraform.png)


## Cloning this repository
```
cd ~
git clone https://github.com/tektutor/terraform-dec-2022.git
cd terraform-dec-2022
```

## ⛹️‍♂️ Lab - Running your first terraform script 
```
cd ~/terraform-dec-2022
git pull

cd Day1/create-docker-container-using-terraform
terraform init
terraform apply
```

Expected output
<pre>

jegan@ubuntu:~/terraform-dec-2022/Day1/create-docker-container-using-terraform$ <b>terraform init</b>

Initializing the backend...

Initializing provider plugins...
- Finding kreuzwerker/docker versions matching "2.23.1"...
- Installing kreuzwerker/docker v2.23.1...
- Installed kreuzwerker/docker v2.23.1 (self-signed, key ID BD080C4571C6104C)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
jegan@ubuntu:~/terraform-dec-2022/Day1/create-docker-container

jegan@ubuntu:~/terraform-dec-2022/Day1/create-docker-container-using-terraform$ <b>terraform apply</b>
docker_image.ubuntu_image: Refreshing state... [id=sha256:a8780b506fa4eeb1d0779a3c92c8d5d3e6a656c758135f62826768da458b5235ubuntu:22.04]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.ubuntu-container will be created
  + resource "docker_container" "ubuntu-container" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = [
          + "/bin/bash",
          + "-c",
          + "sleep 99999999",
        ]
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + gateway                                     = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = "sha256:a8780b506fa4eeb1d0779a3c92c8d5d3e6a656c758135f62826768da458b5235"
      + init                                        = (known after apply)
      + ip_address                                  = (known after apply)
      + ip_prefix_length                            = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "c1"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck {
          + interval     = (known after apply)
          + retries      = (known after apply)
          + start_period = (known after apply)
          + test         = (known after apply)
          + timeout      = (known after apply)
        }

      + labels {
          + label = (known after apply)
          + value = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

docker_container.ubuntu-container: Creating...
docker_container.ubuntu-container: Creation complete after 1s [id=a8ae039361614d36e8ebf897063e7ba9749143a6ed695bd5b74ad7ae6a25a7ca]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
</pre>

## ⛹️‍♂️ Lab - Terraform plan
Terraform plan will dry-run the terraform automation script and prints the plan.  You may optionally save the plan and run the plan.  This is a best practice as you know upfront what Terraform is about to do as opposed to directly performing apply.

#### Print the plan
```
cd ~/terraform-dec-2022
git pull

cd Day1/create-docker-container-using-terraform
terraform plan
```

Expected output
<pre>
jegan@ubuntu:~/terraform-dec-2022/Day1/create-docker-container-using-terraform$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.ubuntu-container will be created
  + resource "docker_container" "ubuntu-container" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = [
          + "/bin/bash",
          + "-c",
          + "sleep 99999999",
        ]
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + gateway                                     = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ip_address                                  = (known after apply)
      + ip_prefix_length                            = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "c1"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck {
          + interval     = (known after apply)
          + retries      = (known after apply)
          + start_period = (known after apply)
          + test         = (known after apply)
          + timeout      = (known after apply)
        }

      + labels {
          + label = (known after apply)
          + value = (known after apply)
        }
    }

  # docker_image.ubuntu_image will be created
  + resource "docker_image" "ubuntu_image" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + latest       = (known after apply)
      + name         = "ubuntu:22.04"
      + output       = (known after apply)
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions
if you run "terraform apply" now.
</pre>

#### Saving the plan to a file
```
cd ~/terraform-dec-2022
git pull

cd Day1/create-docker-container-using-terraform
terraform plan -out main.tfplan
```
Expected output
<pre>
jegan@ubuntu:~/terraform-dec-2022/Day1/create-docker-container-using-terraform$ terraform plan -out main.tfplan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # docker_container.ubuntu-container will be created
  + resource "docker_container" "ubuntu-container" {
      + attach                                      = false
      + bridge                                      = (known after apply)
      + command                                     = [
          + "/bin/bash",
          + "-c",
          + "sleep 99999999",
        ]
      + container_logs                              = (known after apply)
      + container_read_refresh_timeout_milliseconds = 15000
      + entrypoint                                  = (known after apply)
      + env                                         = (known after apply)
      + exit_code                                   = (known after apply)
      + gateway                                     = (known after apply)
      + hostname                                    = (known after apply)
      + id                                          = (known after apply)
      + image                                       = (known after apply)
      + init                                        = (known after apply)
      + ip_address                                  = (known after apply)
      + ip_prefix_length                            = (known after apply)
      + ipc_mode                                    = (known after apply)
      + log_driver                                  = (known after apply)
      + logs                                        = false
      + must_run                                    = true
      + name                                        = "c1"
      + network_data                                = (known after apply)
      + read_only                                   = false
      + remove_volumes                              = true
      + restart                                     = "no"
      + rm                                          = false
      + runtime                                     = (known after apply)
      + security_opts                               = (known after apply)
      + shm_size                                    = (known after apply)
      + start                                       = true
      + stdin_open                                  = false
      + stop_signal                                 = (known after apply)
      + stop_timeout                                = (known after apply)
      + tty                                         = false
      + wait                                        = false
      + wait_timeout                                = 60

      + healthcheck {
          + interval     = (known after apply)
          + retries      = (known after apply)
          + start_period = (known after apply)
          + test         = (known after apply)
          + timeout      = (known after apply)
        }

      + labels {
          + label = (known after apply)
          + value = (known after apply)
        }
    }

  # docker_image.ubuntu_image will be created
  + resource "docker_image" "ubuntu_image" {
      + id           = (known after apply)
      + image_id     = (known after apply)
      + keep_locally = false
      + latest       = (known after apply)
      + name         = "ubuntu:22.04"
      + output       = (known after apply)
      + repo_digest  = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: main.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "main.tfplan"
</pre>

#### Delete the docker image and container before you apply the plan
```
cd ~/terraform-dec-2022
git pull

cd Day1/create-docker-container-using-terraform
terraform destroy --auto-approve

docker images
docker ps
```
Expected output
<pre>
jegan@ubuntu:~/terraform-dec-2022/Day1/create-docker-container-using-terraform$ <b>terraform destroy --auto-approve</b>
docker_image.ubuntu_image: Refreshing state... [id=sha256:a8780b506fa4eeb1d0779a3c92c8d5d3e6a656c758135f62826768da458b5235ubuntu:22.04]
docker_container.ubuntu-container: Refreshing state... [id=3202c9c5882cfce40c076d4b201c61c959efe90a678e6c32fa1872ea1de83ec2]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  - destroy

Terraform will perform the following actions:

  # docker_container.ubuntu-container will be destroyed
  - resource "docker_container" "ubuntu-container" {
      - attach                                      = false -> null
      - command                                     = [
          - "/bin/bash",
          - "-c",
          - "sleep 9999999",
        ] -> null
      - container_read_refresh_timeout_milliseconds = 15000 -> null
      - cpu_shares                                  = 0 -> null
      - dns                                         = [] -> null
      - dns_opts                                    = [] -> null
      - dns_search                                  = [] -> null
      - entrypoint                                  = [] -> null
      - env                                         = [] -> null
      - gateway                                     = "172.17.0.1" -> null
      - group_add                                   = [] -> null
      - hostname                                    = "3202c9c5882c" -> null
      - id                                          = "3202c9c5882cfce40c076d4b201c61c959efe90a678e6c32fa1872ea1de83ec2" -> null
      - image                                       = "sha256:a8780b506fa4eeb1d0779a3c92c8d5d3e6a656c758135f62826768da458b5235" -> null
      - init                                        = false -> null
      - ip_address                                  = "172.17.0.2" -> null
      - ip_prefix_length                            = 16 -> null
      - ipc_mode                                    = "private" -> null
      - links                                       = [] -> null
      - log_driver                                  = "json-file" -> null
      - log_opts                                    = {} -> null
      - logs                                        = false -> null
      - max_retry_count                             = 0 -> null
      - memory                                      = 0 -> null
      - memory_swap                                 = 0 -> null
      - must_run                                    = true -> null
      - name                                        = "c1" -> null
      - network_data                                = [
          - {
              - gateway                   = "172.17.0.1"
              - global_ipv6_address       = ""
              - global_ipv6_prefix_length = 0
              - ip_address                = "172.17.0.2"
              - ip_prefix_length          = 16
              - ipv6_gateway              = ""
              - network_name              = "bridge"
            },
        ] -> null
      - network_mode                                = "default" -> null
      - privileged                                  = false -> null
      - publish_all_ports                           = false -> null
      - read_only                                   = false -> null
      - remove_volumes                              = true -> null
      - restart                                     = "no" -> null
      - rm                                          = false -> null
      - runtime                                     = "runc" -> null
      - security_opts                               = [] -> null
      - shm_size                                    = 64 -> null
      - start                                       = true -> null
      - stdin_open                                  = false -> null
      - stop_timeout                                = 0 -> null
      - storage_opts                                = {} -> null
      - sysctls                                     = {} -> null
      - tmpfs                                       = {} -> null
      - tty                                         = false -> null
      - wait                                        = false -> null
      - wait_timeout                                = 60 -> null
    }

  # docker_image.ubuntu_image will be destroyed
  - resource "docker_image" "ubuntu_image" {
      - id           = "sha256:a8780b506fa4eeb1d0779a3c92c8d5d3e6a656c758135f62826768da458b5235ubuntu:22.04" -> null
      - image_id     = "sha256:a8780b506fa4eeb1d0779a3c92c8d5d3e6a656c758135f62826768da458b5235" -> null
      - keep_locally = false -> null
      - latest       = "sha256:a8780b506fa4eeb1d0779a3c92c8d5d3e6a656c758135f62826768da458b5235" -> null
      - name         = "ubuntu:22.04" -> null
      - repo_digest  = "ubuntu@sha256:4b1d0c4a2d2aaf63b37111f34eb9fa89fa1bf53dd6e4ca954d47caebca4005c2" -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.
docker_container.ubuntu-container: Destroying... [id=3202c9c5882cfce40c076d4b201c61c959efe90a678e6c32fa1872ea1de83ec2]
docker_container.ubuntu-container: Destruction complete after 0s
docker_image.ubuntu_image: Destroying... [id=sha256:a8780b506fa4eeb1d0779a3c92c8d5d3e6a656c758135f62826768da458b5235ubuntu:22.04]
docker_image.ubuntu_image: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.

jegan@ubuntu:~/terraform-dec-2022/Day1/create-docker-container-using-terraform$ <b>docker images</b>
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE

jegan@ubuntu:~/terraform-dec-2022/Day1/create-docker-container-using-terraform$ <b>docker ps</b>
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
</pre>


#### Executing the plan file
```
cd ~/terraform-dec-2022
git pull

cd Day1/create-docker-container-using-terraform
terraform apply main.tfplan
docker images
docker ps
```
Expected output
<pre>
jegan@ubuntu:~/terraform-dec-2022/Day1/create-docker-container-using-terraform$ terraform apply "main.tfplan"
docker_image.ubuntu_image: Creating...
docker_image.ubuntu_image: Creation complete after 10s [id=sha256:a8780b506fa4eeb1d0779a3c92c8d5d3e6a656c758135f62826768da458b5235ubuntu:22.04]
docker_container.ubuntu-container: Creating...
docker_container.ubuntu-container: Creation complete after 1s [id=3202c9c5882cfce40c076d4b201c61c959efe90a678e6c32fa1872ea1de83ec2]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
jegan@ubuntu:~/terraform-dec-2022/Day1/create-docker-container-using-terraform$ docker images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
ubuntu       22.04     a8780b506fa4   4 weeks ago   77.8MB

jegan@ubuntu:~/terraform-dec-2022/Day1/create-docker-container-using-terraform$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS     NAMES
3202c9c5882c   a8780b506fa4   "/bin/bash -c 'sleep…"   16 seconds ago   Up 15 seconds             c1
</pre>
