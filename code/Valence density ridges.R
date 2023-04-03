library(ggridges)
library(ggtext)

smiths %>%
  filter(album_name %in% c("The Smiths","Meat Is Murder", "The Queen Is Dead", "Strangeways, Here We Come")) %>%
  group_by(album_name) %>%
  ggplot(aes(x = valence, y = fct_reorder(album_name, album_release_year, .desc = TRUE), fill = album_name)) +
  geom_density_ridges(color = "snow") +
  paletteer::scale_fill_paletteer_d("yarrr::eternal") +
  labs(title = "<span style= 'font-family:bodoni; color:#EE2E34;'>THE SMITHS</span>",
       y = "Album",
       x = "Valence") +
  theme_minimal() +
  theme(
    plot.title = element_markdown(size = 36),
    plot.title.position = "plot",
    axis.text = element_text(family = "bodoni", face = "italic", size = 12),
    axis.title = element_text(family = "bodoni", face = "bold"),
    legend.position = "top",
    legend.text = element_text(family = "bodoni", face = "italic"),
    legend.title = element_blank()
  )

ggsave("The Smiths Valence.png",width = 10, height = 6, units = "in", bg = "white")
