#!/bin/bash
#criar diretorio /data e enviado e novo diretorio para converter arquivo
echo "Digite o caminho do diretorio: "
read v_dir

cd $v_dir

while true
do
  	if [ -f *.7z* ]; then
       		
		for zip in *.7z
	 	 do
			echo 'Extracting '$zip
			7z x $zip > 7z.log
			rm -rf $zip
			echo 'Aguardando arquivo para extrair'
	
		done

	else
		sleep 1

	fi

	if [ -f *.txt* ]; then
       		
		for file in *.txt
	 	 do
			echo 'Enviando para master o: '$file
			sshpass -p "select" scp $file select@10.20.53.05:/data
			mv $file /data/enviado
			echo 'Aguardando arquivo para enviar'
	
		done

	else
		sleep 5

	fi
	
done
