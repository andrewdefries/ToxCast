babel -isdf Clean.chemicalize_PESTGLOS_pdf.sdf -oInChIKey FDA_Pesticides.InChIKey

babel -isdf Clean.chemicalize_PESTGLOS_pdf.sdf -osmi FDA_Pesticides.smi

cat FDA_Pesticides.smi | cut -d '	' -f2 | sed 's/[, ]/-/g' > FDA_Pesticides.names

paste FDA_Pesticides.InChIKey FDA_Pesticides.names > FDA_PesticidesReady.InChIKey

