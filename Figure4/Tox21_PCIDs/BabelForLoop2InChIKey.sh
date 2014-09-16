name=(`ls *.sdf`)

for i in "${name[@]}"
do
#######
rm -r $i.temp
mkdir $i.temp

cp $i $i.temp

cd $i.temp

base=(`echo $name | sed 's/.sdf//g'`)

babel $i frag.sdf -m 

rm $i

for j in frag*
do

base=(`echo $j | sed 's/.sdf//g'`)

babel -isdf $j -oInChIKey $base.InChIKey

babel -isdf $j -osmi $base.smi

cat $base.smi | cut -d '	' -f2 | sed 's/[, ]/-/g' > $base.names

paste $base.InChIKey $base.names > $base.Ready.InChIKey


rm $j


done

touch FinalList.InChIKey

cat frag*.Ready.InChIKey > Ready.InChIKey
 
cd ..

cp $i.temp/Ready.InChIKey .

done


R CMD BATCH InChIKey2PCID.R
