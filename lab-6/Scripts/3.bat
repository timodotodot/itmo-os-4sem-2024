cd E:\
sc queryex | find "Имя_службы" > E:\GitHub_Repositories\itmo-os-4sem-2024\lab-6\Temp\services_DNS-ON.txt
sc stop Dnscache
TIMEOUT /t 10
sc queryex | find "Имя_службы" > E:\GitHub_Repositories\itmo-os-4sem-2024\lab-6\Temp\services_DNS-OFF.txt
sc start Dnscache
fc /A services_DNS-ON.txt services_DNS-OFF.txt > services.txts