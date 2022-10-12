#!/bin/bash

echo -en "\n"
    case $1 in
        "--help")
            echo "Para instalacao:"
            echo -en '\n'
            echo "firedevup 'caminho_arquivo_bz'"
            exit 1
    ;;
    esac

    if [[ $# -lt 1 ]];
        then
            echo "Atualizador automatico do firefox developer"
            echo -en '\n'
            echo "Comandos"
            echo "--help        Ajuda"
            exit 1    
    elif ! [[ -f $1 ]]
        then    
            echo "Arquivo não encontrado!!"
            exit 1
    fi

            
echo "Atualizando o firefox ...."

sudo rm -Rf /opt/firefox-developer*
sudo rm -Rf /usr/bin/firefox-developer
sudo rm -Rf /usr/share/applications/firefox-developer.desktop

echo "Apagado instalações anteriores ..."

sudo tar -jxvf  $1 -C /opt/
sudo mv /opt/firefox*/ /opt/firefox-developer
sudo ln -sf /opt/firefox-developer/firefox /usr/bin/firefox-developer
echo -e '[Desktop Entry]\n Version=yy.y.y\n Encoding=UTF-8\n Name=Mozilla Firefox\n Comment=Navegador Web\n Exec=/opt/firefox-developer/firefox\n Icon=/opt/firefox-developer/browser/chrome/icons/default/default128.png\n Type=Application\n Categories=Network' | sudo tee /usr/share/applications/firefox-developer.desktop

echo "Atualizado!!!"
