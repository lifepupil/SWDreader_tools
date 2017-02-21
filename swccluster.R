library(amap)
# library(dtwclust)
# library(ape)
library(gplots)
library(fastcluster)
library(cluster)

data_file = paste("gabrg2_swcEEGs_ch2__ALLSESSIONS_30",".csv", sep='')
header_file = paste("gabrg2_swcIDs_ch2__ALLSESSIONS_30",".csv", sep='')

# this gives you a dendrogram with heatmap of each SWC
mx = t(read.csv(data_file, header=FALSE))
lbls = t(read.table(header_file, header=FALSE))
colnames(mx) = lbls
mx = t(mx)

hc_agg_fxn = function(x) {
  hc = hclust(dist(x, method='euclidean'), 'complete')
  return(hc)
}

hc_div_fxn = function(x) {
  hc = diana(x, metric='euclidean')
  return(hc)
}

# heatmap.2(mx, hclustfun = hc_div_fxn,
#           col = rev(rainbow(20*10, start = 0/6, end = 4/6)),
#           cexRow = 0.05,
#           trace = 'none',
#           dendrogram = 'row',
#           Colv = FALSE)

thc = hc_div_fxn(mx)
# tct = cutree(thc, k=7)
# cl = mx[tct == 1,]
# clrn = rownames(cl)
# clnums = c()
# for(x in clrn) {clnums = c(clnums,strtoi(substr(x,2,nchar(x))))}
# compare_swcs(mx,clnums)
# print(length(clnums))

# grp.7 = cutree(thc, k=7)
# swcnames.1 = rownames(mx)[grp.7==1]

