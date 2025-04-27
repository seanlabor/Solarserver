https://www.naturalborncoder.com/2023/07/creating-a-basic-vm-on-proxmox/

Proxmox Host IP: 192.168.178.10
docker-container
 host: docker-container
 domain: .net
 Login:
    root//12547852
    User: florian//12547852 


Proxmox


# docker-container

Log into Docker VM via SSH: 
    ´´´ssh florian@192.168.178.98´´´


Portainer

florian//portainer12547852


https://docker-domain:9443
https://192.168.178.98:9443



SSH

PS F:\Florian\python_projekte_Solar\solar-proxmox-server> ssh-keygen -t ed25519 -C "github-pipeline"
Generating public/private ed25519 key pair.
Enter file in which to save the key (C:\Users\Susanna/.ssh/id_ed25519): github-pipeline
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in github-pipeline
Your public key has been saved in github-pipeline.pub
The key fingerprint is:
SHA256:QSDI2n3eRM8QM3xOJKmVqJ+6qA7cYdr0n5cH+22M2VY github-pipeline
The key's randomart image is:
+--[ED25519 256]--+
| . .. .+*=.      |
|  o  ...B+o      |
| o . . +.B       |
|. . o o ..+      |
|   + + +S        |
|. * o + ..     E |
|.o o o    + = .  |
|.  .. . .+ +.=   |
|oo. .. o. o.o.   |
+----[SHA256]-----+
PS F:\Florian\python_projekte_Solar\solar-proxmox-server> 


ssh-copy-id -i C:\Users\Susanna/.ssh/id_ed25519.pub youruser@your-vm-ip

Trigger .