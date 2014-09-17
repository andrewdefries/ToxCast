##################
library(bioassayR)
library(ChemmineR)
library(RSQLite)
library(ape)
library(parallel)
##################

#FiveWay <-read.table("5Way_PCIDs_fromChris")
#DrugBank4Now <-read.table("DrugBank_PCID_fromChrisFinal")
#DrugBank4Now <-read.table("LATCA_PCIDs_fromJan")

#OverLap<-FiveWay[,1]%in%DrugBank4Now[,1]

db <-dbConnect(SQLite(), dbname="bioassayDatabaseWithSpecies.sqlite")

sampleDatabasePath <- file.path(getwd(), "bioassayDatabaseWithSpecies.sqlite")

pubChemDatabase <- connectBioassayDB(sampleDatabasePath)

############
##query<-DrugBank4Now[,1]
#query<-"2244"
#query<-"132970"
############
############
DoTheQuery<-function(a){
drugTargets <- activeTargets(pubChemDatabase, "813")
targetSequences <- read.GenBank(row.names(drugTargets), species.names = TRUE)
drugTargetSpecies<-cbind(attr(targetSequences, "species"), names(targetSequences))
############
write.table(drugTargets, file=paste("PCID_", "813", "_drugTargets", sep=""), col.names=F, row.names=F, quote=F)
write.table(unique(drugTargetSpecies[,1]), file=paste("PCID_", "813", "_drugTargetSpecies", sep=""), col.names=F, row.names=F, quote=F)
write.table(targetSequences, file=paste("PCID_", "813", "_drugTargetSequences", sep=""), col.names=F, row.names=F, quote=F)
############
}
############
a<-1#:length(query)
#mclapply(a,DoTheQuery, mc.cores=1)
lapply(a,DoTheQuery) ##, mc.cores=1)
############

#tryCatch(lapply(a, DoTheQuery), finally=print("OK")) #silent=TRUE)

#while(a < length(query)){
#a <- a + 1
#apply(a, DoTheQuery)
#}

#for (i in a){
#sapply(a, DoTheQuery)
#}
############
############
#
#
#
#
#
dbDisconnect(db)
