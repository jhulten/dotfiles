secrets.sh.asc: secrets.sh
	gpg -r jhulten@gmail.com --armor -e secrets.sh
	rm secrets.sh

secrets.sh:
	gpg -u jhulten@gmail.com -o secrets.sh -d secrets.sh.asc 

encrypt: secrets.sh.asc
decrypt: secrets.sh
