##################
library(ChemmineR)
##################

sdfset<-read.SDFset("TOX21S_v4a_8599_11Dec2013_clean.sdf")

ToxCastList<-read.table("ToxCast_AC50_CASRN.txt")

toxcast_sdfset<-sdfset[gsub(" " ,"", as.character(ToxCastList[,1]))%in%datablocktag(sdfset, tag="TS_CASRN")]

