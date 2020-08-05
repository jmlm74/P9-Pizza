import psutil
import requests
import os

def send_simple_message(mountpoint,percent):
	text = f"Attention ! l'espace disque {mountpoint} du serveur web OC-Pizza est plein à {percent}% !"
	api_key = os.getenv("MAILGUN_APIKEY")
	return requests.post(
		"https://api.mailgun.net/v3/sandbox1f42285ff9e446fa9e90d34287cd8fee.mailgun.org/messages",
		auth=("api", api_key),
		data={"from": "Serveur OC_PIZZA <webmaster@oc-pizza.fr>",
			"to": ["webmaster@oc-pizza.fr"],
			"subject": "Espace disk server OC-Pizza",
			"text": text})
	

disks = psutil.disk_partitions()
for disk in disks:
    freespace = psutil.disk_usage(disk.mountpoint).percent
    if freespace > 80:
        send_simple_message(disk.mountpoint,freespace)

