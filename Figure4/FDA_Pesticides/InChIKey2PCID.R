################
library(RSQLite)
################

files<-list.files(pattern="Ready.InChIKey")

query_name<-read.table(files[1])

query_alias<-substring(1,20,as.vector(query_name[,2]))
query_name<-as.vector(query_name[,1])

###############
con <- dbConnect(SQLite(), dbname="PubChemInChIKey.sqlite")
###############
#query_pcid<-dbGetQuery(con,"SELECT * FROM PubChemInCHIKey WHERE PubchemIUPAC_InChIKey='RDHQFKQIGNGIED-UHFFFAOYSA-O'")
###

system("rm Result.txt")
######
Query4PCID<-function(u){
########################
#querykey<-"IJHNSHDBIRRJRN-HNNXBMFYSA-N"
querykey<-query_name[u]


sql <- paste("SELECT * FROM PubChemInChIKey WHERE PubchemIUPAC_InChIKey = $KEY")

dbBeginTransaction(con)

result <- dbGetPreparedQuery(con, sql, bind.data = data.frame(KEY=querykey))

write.table(result, file="Result.txt", col.names=FALSE, append=TRUE)
#################
}
###############
u<-1:length(query_name)
lapply(u, Query4PCID)

###############
dbDisconnect(con)

system("cat *.Rout > RRunLog")
system("paste Result.txt FDA_PesticidesReady.InChIKey > RunLog")
