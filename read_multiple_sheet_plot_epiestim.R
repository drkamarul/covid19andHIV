library(glue)
library(tidyverse)
library(purrr)
library(rio)
library(here)

# sheets_list <- excel_sheets('covid19_mph.xlsx')
# sheets_list
# 
# sample_sheets <- sheets_list[grepl("P", sheets_list)]
# sample_sheets
# 
# sheet_df <- map_dfr(sample_sheets, 
#                     ~read_excel(path = 'covid19_mph.xlsx',
#                                 sheet = .x,
#                                 id = .x))
# 
# 
# 'covid19_mph.xlsx' %>% 
#   excel_sheets() %>% 
#   set_names() %>% 
#   map_dfr(read_excel, path = 'covid19_mph.xlsx')

# using rio
data_list <- import_list('covid19_mph.xlsx')

# using tidyverser
data_list2 <- import_list("covid19_mph.xlsx", setclass = "tbl")

# using tidyverse (THIS IS VERY GOOD)
path <- here("covid19_mph.xlsx")
all_data <- path %>% 
  excel_sheets() %>% 
  set_names() %>% 
  map_dfr(read_excel, path = path, .id = "Sheet")

mys <- read_excel('covid19_mph.xlsx',
                  sheet = 1)

epidem_R <- function(location){
  location_R <- estimate_R(location, 
             method = "parametric_si",
             config = make_config(list(mean_si = 3.96, 
                                       std_si = 4.75)))
  incid <- plot(location_R, "incid")
  print(incid)
  
  plot_R <- plot(location_R, "R") 
  print(plot_R)
  
  # write_csv(location_R$R, 'R_Malaysia.csv')
  # write_csv(location_R$R, file = as.character(glue::glue("R_{location}.csv")))
  # location2 <- enquo(glue::glue({location}))
  write.csv(location_R$R, file = as.character(glue::glue("file_{location}.csv")))
  # write_csv(location_R$R, file = "test.csv")
}

epidem_R(mys2)

mys_parametric_si_du

loc <- enquo(air2)
loc2 <- air
loc2 <- as.character({loc2})
loc2
glue::glue({loc}, {".csv"})


location_R$R
