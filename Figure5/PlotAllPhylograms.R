library(ape)
library(parallel)

files<-list.files(pattern="drugTargetSpecies.txt")


ploTrees<-function(u){
png(gsub(".txt", ".png", files[u]))
tree<-read.tree(files[u])
plot(tree,main=files[u])
dev.off()
}
u<-1:length(files)
lapply(u, ploTrees) ##, mc.cores=4)

