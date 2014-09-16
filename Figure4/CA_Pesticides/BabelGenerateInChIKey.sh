babel -isdf CA_Pesticides.sdf -oInChIKey CA_Pesticides.InChIKey

babel -isdf CA_Pesticides.sdf -osmi CA_Pesticides.smi

cat CA_Pesticides.smi | cut -d '	' -f2 | sed 's/[, ]/-/g' > CA_Pesticides.names

paste CA_Pesticides.InChIKey CA_Pesticides.names > CA_PesticidesReady.InChIKey

