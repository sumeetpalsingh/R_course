library(dplyr)
library(coronavirus)
library(ggplot2)

# library(ggrepel)
# library(ggforce)
# library(directlabels)

coronavirus %>%
  filter(type == "confirmed") %>%
  filter(Province.State == "") %>%
  group_by(Country.Region) %>%
  mutate(TotalCases = cumsum(cases)) %>%
  select(Country.Region, TotalCases, date) -> 
  corona.Timeline

# View(corona.Timeline)

# countries = c("Italy", "Spain", "United Kingdom", "US", "Korea, South", "Japan", "Singapore", "India", "Belgium")


countries = c("Italy", "Spain")


corona.Timeline %>% 
  filter(Country.Region %in% countries) %>%
  ggplot(mapping = aes(x = date, 
                       y = TotalCases, 
                       color = Country.Region)) ->
  p

p + geom_line() + geom_point() + theme_classic()

library(gganimate)

p + geom_line() + geom_point() + theme_classic() + transition_reveal(date)


library(ggforce)

p + geom_line() + geom_point() + theme_classic() +
  facet_zoom(x = date > "2020-03-01" & date < "2020-03-20", horizontal = FALSE)


## END
################
