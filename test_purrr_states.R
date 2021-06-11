test <- read_excel('test_purrr.xlsx')
test2 <- test %>% 
  rename(Time = Tarikh, I = Total)
test_nested <- test2 %>%
  group_by(Loc) %>%
  nest()
test_nested
est_R <- test_nested %>%
  mutate(R_val = map(data, ~ estimate_R(.x, 
                                        method = "parametric_si", 
                                        config = make_config(list(mean_si = 3.96, 
                                                                  std_si = 4.75))))) %>%
  pluck()

est_R$R_val$R


get_R <- function(data1) {
  estim <- estimate_R(data1, 
             method = "parametric_si", 
             config = make_config(list(mean_si = 3.96, 
                                       std_si = 4.75)))
  estim$R
}

plot_R <- function(data1) {
  estim <- estimate_R(data1, 
                      method = "parametric_si", 
                      config = make_config(list(mean_si = 3.96, 
                                                std_si = 4.75)))
  plot(estim, "R")
}

get_R(test2)
plot_R(test2)

est_R2 <- test_nested %>%
  mutate(R_val = map(data, ~ get_R(.x)))
est_R2$R_val[1]

est_R3 <- test_nested %>%
  mutate(R_val = map(data, ~ get_R(.x))) %>%
  unnest(cols = c(R_val))
est_R3


plot_R2 <- test_nested %>%
  mutate(R_plot = map(data, ~ plot_R(.x)))
plot_R2$R_plot
plot_R2$R_plot[1]

plot_R2 %>%
  unnest(data) 

plot_R2 %>%
  unnest(cols = c(data)) 

# plot_R2 %>%
#   unnest() 

plot_R2$R_plot

