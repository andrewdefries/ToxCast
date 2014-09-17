list=(`ls *drugTargetSpecies`)

for j in "${list[@]}"

do

cat $j | sed 's/^/,/' | tr -d '\n' | cut -c 2-1000 | sed 's/^/(/' | sed 's/$/);/' > $j.txt

done

