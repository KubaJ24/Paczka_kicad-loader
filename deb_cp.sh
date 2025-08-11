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
cp /home/sim/kicad_loader/kicad-loader-${VERSION}.deb pool/main/

# Tworzenie paczek
# dists/stable...
dpkg-scanpackages pool /dev/null > dists/noble/main/binary-amd64/Packages
gzip -f dists/noble/main/binary-amd64/Packages
dpkg-scanpackages pool /dev/null > dists/noble/main/binary-i386/Packages
gzip -f dists/noble/main/binary-i386/Packages

echo "Paczki skopiowane do repozytorium 'kicad_loader_repo'"
