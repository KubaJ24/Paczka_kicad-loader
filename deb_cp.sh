#!/bin/bash

# Skrypt do przenoszenia paczek do repo

# Zmienne
PROG_NAME=".deb copier"
VERSION=$1

if [[ "$VERSION" == "--help" ]]; then
	echo "Użycie: ./deb_cp.sh <nowa_wersja paczki>"
	exit
fi

echo "${PROG_NAME}"

# Kopiowanie paczki .deb
rm -R pool/main/*
cp ~/Desktop/programs/kicad_loader/kicad-loader-${VERSION}.deb pool/main/

# Tworzenie paczek
# dists/stable...
dpkg-scanpackages pool /dev/null > dists/noble/main/binary-all/Packages
gzip -f dists/noble/main/binary-all/Packages

echo "Paczki skopiowane do repozytorium 'kicad_loader_repo'"
