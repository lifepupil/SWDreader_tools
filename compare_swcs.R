
compare_swcs = function(mx, figNums) {
  dev.new()
  
  for(i in figNums) {
    plot(mx[i,], pch="*",col='red', type='o')
    par(new=T)
  }
}