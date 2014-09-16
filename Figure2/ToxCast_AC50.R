#read in our data from csv
TCS<-read.csv("ToxCast_Summary_AC50_2013_12_10_NO_BSK.csv", header=T)

#save the CAS numbers for later
write.table(TCS$CASRN, file="ToxCast_AC50_CASRN.txt")

#write.table(TCS$CODE, file="ToxCast_AC50_CODE.txt")

#convert mode to numeric
TCS<-sapply(TCS, as.numeric)

#inspiration from http://www.r-bloggers.com/drawing-heatmaps-in-r/
#center the data and produce scaled matrix
tcs_scaled<-as.matrix(scale(TCS))

#remove NA values
tcs_scaled <-tcs_scaled[rowSums(!is.na(tcs_scaled))!=0, colSums(!is.na(tcs_scaled))!=0]

#test output cladogram

png(file="ToxCast_Summary_columnsort_false.png", width=9600, height=9600, units="px")

heatmap(tcs_scaled, Colv=F, scale='none')

##
dev.off()


#cluster rows
png(file="ToxCast_Summary_clusterrows_true.png", width=9600, height=9600, units="px")

hc.rows<-hclust(dist(tcs_scaled))
plot(hc.rows)

dev.off()

#transpose matrix and cluster columns
png(file="ToxCast_Summary_clustercols_true.png", width=9600, height=9600, units="px")

hc.col<-hclust(dist(t(tcs_scaled)))
plot(hc.col)

dev.off()
