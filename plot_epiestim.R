epidem_R <- function(location){
  location_R <- estimate_R(location, 
             method = "parametric_si",
             config = make_config(list(mean_si = 3.96, 
                                       std_si = 4.75)))
  incid <- plot(location_R, "incid")
  print(incid)
  
  plot_R <- plot(location_R, "R") 
  print(plot_R)
  
}

epidem_R(mys2)

mys_parametric_si_du
