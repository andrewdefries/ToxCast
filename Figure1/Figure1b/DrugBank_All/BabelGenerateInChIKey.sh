name=(`ls *.sdf`)
base=(`echo $name | sed 's/.sdf//g'`)

babel -isdf $name -oInChIKey $base.InChIKey

babel -isdf $name -osmi $base.smi

cat $base.smi | cut -d '	' -f2 | sed 's/[, ]/-/g' > $base.names

paste $base.InChIKey $base.names > $baseReady.InChIKey

