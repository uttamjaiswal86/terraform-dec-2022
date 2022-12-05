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

## What is Docker container ?
- container is a running instance of Container image
- container represents one application
- container from OS point of view it is a normal application process that runs in a separate namespace
- 

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
