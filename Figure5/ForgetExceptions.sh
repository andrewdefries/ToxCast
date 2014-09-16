rm RunLog
rm *.Rout

touch RunLog

input=(`cat ToxCast_PCIDs_N_Stereo`) 

for i in "${input[@]}"

do

cat GetMeReports.R | sed "s/query\[a\]/\"$i\"/g" > GetMeReportSerial.R

#for testing
##cat GetMeReportSerial.R

R CMD BATCH GetMeReportSerial.R

cat *.Rout >> RunLog

echo "https://pubchem.ncbi.nlm.nih.gov/summary/summary.cgi?cid=$i" > PCID_$i.html

done

./QuckFix.sh

R CMD BATCH PlotAllPhylograms.R


