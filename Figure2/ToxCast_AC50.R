TCS<-read.csv("ToxCast_Summary_AC50_2013_12_10_NO_BSK.csv", header=T)

write.table(TCS$CASRN, file="ToxCast_AC50_CASRN.txt")

#write.table(TCS$CODE, file="ToxCast_AC50_CODE.txt")

TCS<-sapply(TCS, as.numeric)

tcs_scaled<-as.matrix(scale(TCS))

tcs_scaled <-tcs_scaled[rowSums(!is.na(tcs_scaled))!=0, colSums(!is.na(tcs_scaled))!=0]

png(file="ToxCast_Summary_columnsort_false.png", width=2400, height=6800, units="px")

heatmap(tcs_scaled, Colv=F, scale='none')

##
dev.off()
