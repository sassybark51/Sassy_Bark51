#!/usr/bin/bash 



## COLORS ###############
white="\e[1;37m" 
red="\e[1;31m" 
green="\e[1;32m" 
yallow="\e[1;33m" 
cayn="\e[1;36m"
blue="\e[1;34m"
wrde="\e[1;35m"
nocolor="\e[0m"
#########################
git clone https://github.com/la-deep-web/Phoneinfoga.git
clear

banner() {
echo -e "$cayn


                0101001010      0101010010
              10          01    10       10                0011
                01              01       01              10  10
                  10            01      10                   01
                   01           1001010011                   10
                    10          10      01       01   10     10
                     10         01       01      10   01     01
           01         01        10       10       01 10      10
             010010010          01100101011        10     010101001



$nocolor
        [$yallow coded by Sassy_Bark51 $nocolor]
"
}
banner

tools() {
    echo -e "
    $yallow 1) Website Informations $nocolor                  $red 2) Show devices are connected to your network $nocolor
    $white 3) Phone Number Information $nocolor              $cayn 4) your IP $nocolor
    $blue 5) TCP Port Scan $nocolor                        $red  6) DNS Look $nocolor
    $green 7) Whois Lookup $nocolor                          $white 8) GeoIP Lookup $nocolor
    $yallow 9) Subnet Lookup $nocolor                        $blue 10) Connect port $nocolor
                               $cayn 11) Domin to Host $nocolor
    
"
}
tools


    read -p "	$(echo -e $red[$green+$red]$nocolor)$(echo -e $white choice $nocolor) $(echo -e $red[$green$yallow$nocolor$white[1..12] $green$n$red]$nocolor) : " choice


    if [[ $choice == 1 ]]; then
        read -p "   $(echo -e $yallow [+] website  :: ex[ google.com $oncolor]) : " web
        sleep 3.5
        whois $web
        sleep 100

    elif [[ $choice == 2 ]]; then
        echo -e '\e[1;36m
    These devices are connected to your network
                                  [☯]coded by ANtqAmE
                                  wait...!
    '
        read -p "       $(echo -e $red[$green+$red]$white Enter your Address /1{192.168.0.0}) /2\{10.0.0.0}) /3\{172.16.0.0}\ : )" IP
        if [[ $IP == 1 ]]; then
        echo "Address thase: " | nmap -sn 192.168.0.0/16 | grep "Nmap scan" | cut -d " " -f 5

        elif [[ $IP == 2 ]]; then
        echo "Address thase: " | nmap -sn 10.0.0.0/8 | grep "Nmap scan" | cut -d " " -f 5

        elif [[$IP == 3 ]]; then
        echo "Address thase: " | nmap -sn 172.16.0.0/16 | grep "Nmap scan" | cut -d " " -f 5
        fi

        sleep 50
    elif [[ $choice == 3  ]]; then
        read -p "	$(echo -e $red[$green+$red]$white Enter Country Code [ex : 97338296445 {BAHRAIN}] : $nocolor)" code
        cd ~/PhoneInfoga
        python3 -m pip install -r requirements.txt | grep -v "already"
        chmod 777 phoneinfoga.py
        read -p "   $(echo -e $red[$green+$red]$nocolor)$(echo -e $white Enter$green scan numper /1/what is num /2/scan num OVH /3/all scan num : $nocolor)" pon
        if [[ $pon == 1 ]]; then
            ./phoneinfoga.py -n +$code 
        elif [[ $pon == 2 ]]; then
            ./phoneinfoga.py -n +$code -s ovh 
        elif [[ $pon == 3 ]]; then
            ./phoneinfoga.py -n +$code -s all 
        fi

        sleep 100

    elif [[ $choice == 4 ]]; then
        sleep 3.5

        ip a s | grep "inet" | cut -d "/" -f 1 | grep -v "inet6" | grep -v "127.0.0.1" | cut -d " " -f 6

        sleep 20
    elif [[ $choice == 5 ]]; then
        echo -e "	$green Port Scanner $nocolor"
        read -p "	 $(echo -e $red[$green+$red]$nocolor)$(echo -e $white Enter$green HOST$white  Or Ip To Scan : $nocolor)" host
        nmap $host -sV | grep "open"
        nmap $host -sV  |grep "Service Info:"


        sleep 20
    elif [[ $choice == 6 ]]; then
        echo " "
        read -p "   $(echo -e $red[$green+$red]$nocolor)$(echo -e $white Enter$green Ip OR Domin : $nocolor)" dns

        if [[ $dns ]]; then
        read -p "$(echo -e $yallow 1-IF YOU WANT VERISON AND SCRIPT  OR  2-IF YOU WANT ONLY VERSION  OR  3_IF YOU WANT ONLY SCRIPT:  )" VS   
        if [[ $VS == 1 ]]; then
        nmap $dns -sV -sC | grep -v "nmap" | grep -v "Nmap" |grep -v "stats"

        elif [[ $VS == 2 ]]; then
        nmap $dns -sV | grep -v "nmap" | grep -v "Nmap" |grep -v "stats"
 
        elif [[ $VS == 3 ]]; then
        nmap $dns -sC | grep -v "nmap" | grep -v "Nmap" |grep -v "stats"

        fi
        fi
        sleep 80

    elif [[ $choice == 7 ]]; then
        echo " "
        read -p "    $(echo -e $red[$green+$red]$nocolor)$(echo -e $white Enter$green Ip oR DoMain : $nocolor)" whois
        whois $whois

        sleep 100

    elif [[ $choice == 8 ]]; then
        echo " "
        read -p "      $(echo -e $red[$green+$red]$nocolor)$(echo -e $white Enter$green Ip oR hoSt : $nocolor)" geolo
        curl "https://api.hackertarget.com/geoip/?q=$geolo"

        sleep 20

    elif [[ $choice == 9 ]]; then
        echo " "
        read -p "      $(echo -e $red[$green+$red]$nocolor)$(echo -e $white Enter$green hoSt : $nocolor)" subnet
        HosT=$( host $subnet | cut -d " " -f 5 )

        if [[ $HosT == "3(NXDOMAIN)" ]]; then
        echo "Thes Not domin"

        else

        echo "
...............IP: $subnet"
        for hosT in $(echo $HosT ); do
            echo "
...............Domin or IPv6: $hosT"
        done
        fi

        sleep 20

    elif [[ $choice == 10 ]]; then
        echo " "
        read -p "      $(echo -e $red[$green+$red]$nocolor)$(echo -e $white Enter$green hoSt : $nocolor)" hoost
        read -p "      $(echo -e $red[$green+$red]$nocolor)$(echo -e $white Enter$green port : $nocolor)" PORT


        nc -nvv $hoost $PORT


        sleep 20

    elif [[ $choice == 11 ]]; then
        #eof check
        read -p "	$(echo -e $red[$green+$red]$nocolor) $(echo -e $white Enter site [ex : www.facebook.com ]: $nocolor)" site
        curl -sf $site > /dev/null
        if [ $? -eq 0 ]; then > /dev/null
        echo -e "$wrde Site is Up"
        sleep 0.25
        echo "-----------------"
        echo -e "$yallow Site IP Addr : "
        ping $site -c 1 | grep "ttl" | cut -d " " -f 5 | cut -d ":" -f 1 
        echo "------:>-----------"
        else
        echo -e "$red SIte is down $nocolor or $yallow no connect WI-FI $nocolor"
        fi

        sleep 20

else
clear
echo -e "$red





                     not found please write 1 to 11 $nocolor"
sleep 10
fi
