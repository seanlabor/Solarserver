https://www.naturalborncoder.com/2023/07/creating-a-basic-vm-on-proxmox/

Proxmox Host IP: 192.168.178.10


docker-container
 ip: 192.168.178.98
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
|. * o + .    E |
|.o o o    + = .  |
|.  .. . .+ +.=   |
|oo. .. o. o.o.   |
+----[SHA256]-----+
PS F:\Florian\python_projekte_Solar\solar-proxmox-server> 


ssh-copy-id -i C:\Users\Susanna/.ssh/id_ed25519.pub youruser@your-vm-ip


# Runner Registration

Enter the name of the runner group to add this runner to: [press Enter for Default] 

Enter the name of runner: [press Enter for docker-container]

This runner will have the following labels: 'self-hosted', 'Linux', 'X64'
Enter any additional labels (ex. label-1,label-2): [press Enter to skip]

# Homeassistant
http://192.168.178.98:8123/

solar//sesam


# Connect VSC via SSH to directory

Open the Command Palette (Ctrl Shift P).

Type “Remote-SSH: Connect to Host…” and select it.

Choose docker-container (the alias you just added).

VS Code will open a new window and SSH you into that VM.


# Config Files location

in Proxmox VM Container:
~/actions-runner/_work/Solarserver/Solarserver/homeassistant$


# Influx

Test

needs Influx CLI - installed on docker-container

influx write -b Sungather -o Solar -t Y5gQT9kCm8R7pX2jwFEbV6uNHMqLd4zA3PyGK0oUztsb --precision s "test,host=vm value=1.0"

http://192.168.178.98:8086/signin

Bucket Sungather_SG12RG has to be created manually after a new init of Influx


# Elfin Smartmeter TCP Gateway


http://192.168.178.67/socket.html
login: admin//admin

# Github Runner 

name: docker-container
laeuft als service: /etc/systemd/system/actions.runner.seanlabor-Solarserver.docker-container.service



{"model": "SG4.0RS", "serial_number": "A21C221162", "level": 1, "scan_interval": 30, "use_local_time": false, "smart_meter": false, "connection": "modbus", "slave": 1, "start_time": "", "host": "192.168.178.61", "port": 502, "timeout": 10, "retries": 3, "RetryOnEmpty": false, "device_type_code": "SG4.0RS", "run_state": "ON", "last_reset": "2025-5-4 0:00:09", "daily_export_to_grid": 0.0, "daily_import_from_grid": 0.0, "daily_power_yields": 9.0, "total_power_yields": 4618.1, "total_running_time": 6016, "internal_temperature": 45.1, "total_apparent_power": 706, "phase_a_voltage": 233.4, "total_active_power": 706, "work_state_1": "Run", "daily_running_time": 465, "monthly_power_yields": 48.9, "start_stop": "Start", "timestamp": "2025-5-4 14:34:39", "export_to_grid": 0, "import_from_grid": 0}


# Troubleshooting

mqtt_1                 | 1595765174: Saving in-memory database to /mosquitto/data/mosquitto.db.
mqtt_1                 | 1595765174: Error saving in-memory database, unable to open /mosquitto/data/mosquitto.db.new for writing.
mqtt_1                 | 1595765174: Error: Permission denied.

sudo chown -R 1883:1883 mosquitto-data