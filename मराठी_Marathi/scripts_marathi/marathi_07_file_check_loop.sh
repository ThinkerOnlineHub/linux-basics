#!/bin/bash

# DevOps madhe aaplyala ekya folder madhil saglya files check karavyat lagtat.
# समजा, `~/1st-script/` madhe khup saarya `.txt` files ahet ani tula tyanchi naave print karaychi ahet:


# folder madhil pratyek file check karnyasathi loop firva mhanje
# tya folder madhil saglya file check karu shakato
# tasech tya folder madhe kontya file ahet he check karnaysathi tya sagly files chin nave print karun gheu
# shopt -s nullglob काय करतं?
# 👉 जर .txt files नसतील:
# loop skip होईल
# "*.txt" print होणार नाही
# ✔️ clean output

shopt -s nullglob

for file in ~/bash-scripts/*.txt  ~/bash-scripts/*.sh

do
	echo "Hya file che naav ahe: $file"

done
