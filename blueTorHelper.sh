#!/bin/bash
header() {
	echo "================================= Blue Tor Helper  ======================================="
    echo "+++++++++++++++++++++++++++++++++                  +++++++++++++++++++++++++++++++++++++++"
	echo "=========================================================================================="

	echo "Tool ini akan memperm0dah pengunaan jaringan TOR!!!"
	echo "Created by: Gebby Wandikbo"
	echo ""
}
border(){
	echo "=========================================================================================="
}
cek_root(){
	if [ "$EUID" -ne 0 ]; then
		echo "Jalankan tool ini sebagai root(sudo XXXXXXX.sh)"
		exit 1
	fi
}
spinner(){
    local pid=$!
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}
#
#
#
#
#
cek_tor(){
    border
    sys=$(sudo systemctl status tor)
    #
    #
    read -p "Apakah anda ingin segera mengaktifkan TOR!!!? (Y/Iya : N/Tidak): " asking
    #
    #
    if [[ $asking == "Y"  ||  $asking == "Iya" ]]; then
        border
        (sleep 3) & spinner
        #
        #
        if echo "$sys" | grep "inactive"; then
            border
            echo "[i] Layanan TOR belum aktif"
            read -p "Apakah anda ingin mengaktifkan Layanan TOR!!!? (Y/Iya : N/Tidak): " asking2
            if [[ $asking2 == "Y"  ||  $asking2 == "Iya" ]] ; then
                border
                sudo systemctl start tor
                (sleep 3) & spinner
                #
                #
                border
                confirm=$(sudo systemctl status tor)
                echo "$confirm"
                border
                echo "Layanan TOR sudah aktif!!! Selamat menggunakannya."
            elif [[ $asking2 == "N"  ||  $asking2 == "Tidak" ]]; then
                border
                echo "Baik!!! Terima kasih telah menggunakan Blue Tor Helper"
            else
                border
                echo "Jawaban anda tidak sesuai      ---> $asking2"
                echo "Jawaban yang seharusnya adalah  ---> (Y/Iya : N/Tidak)"
            fi
        else
            border
            echo "[i] Layanan TOR sudah aktif!!!"
            border
            confirm2=$(sudo systemctl status tor)
            echo "$confirm2"
        fi
    elif [[ $asking == "N"  ||  $asking == "Tidak" ]] ; then
        border
        echo "Baik!!! Terima kasih telah menggunakan Blue Tor Helper"
    else
            border
            echo "Jawaban anda tidak sesuai      ---> [ $asking ] "
            echo "Jawaban yang seharusnya adalah  ---> (Y/Iya : N/Tidak)"
    fi
}

cek_installan_tor() {
    aptcheck=$(which tor 2>/dev/null)

    if [[ -n "$aptcheck" ]]; then
        border
        echo "[i] Layanan TOR sudah terinstall!"
        cek_tor
    else
        border
        echo "[i] Layanan TOR anda belum terinstall."
        read -p "Apakah anda ingin menginstallnya? (Y/Iya : N/Tidak): " asking3

        if [[ "$asking3" == "Y" || "$asking3" == "Iya" ]]; then
            border
            echo "[i] Tunggu... Layanan TOR sedang diinstall..."
            sudo apt-get install tor -y
            cek_tor
        elif [[ "$asking3" == "N" || "$asking3" == "Tidak" ]]; then
            border
            echo "[i] Baik! Terima kasih telah menggunakan Blue Tor Helper."
        else
            border
            echo "Jawaban anda tidak sesuai      ---> [ $asking3 ]"
            echo "Jawaban yang seharusnya adalah ---> (Y/Iya : N/Tidak)"
        fi
    fi
}

header
cek_root
cek_installan_tor