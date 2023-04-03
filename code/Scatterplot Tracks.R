library(ggrepel)

font_add(family = "bodoni", "/Users/andres/Library/Fonts/BodoniFLF-Bold.ttf", bold = "/Users/andres/Library/Fonts/BodoniFLF-BoldItalic.ttf",italic = "/Users/andres/Library/Fonts/BodoniFLF-Italic.ttf")
font_add_google(family = "roboto", "Roboto")

showtext_opts(dpi = 300)
showtext_auto()

smiths %>%
  filter(album_name %in% c("The Smiths","Meat Is Murder", "The Queen Is Dead", "Strangeways, Here We Come")) %>%
  ggplot(aes(x = valence, y = energy, label = track_name, color = album_name)) +
  geom_point() +
  geom_text_repel(size = 2, max.overlaps = 100, nudge_x = 0.02, nudge_y = 0.02, family = "roboto") +
  geom_hline(yintercept = 0.5) +
  geom_vline(xintercept = 0.5) +
  annotate("text", x = 0.01, y = 0.97, label = "Intense/Energetic", alpha = 0.5, size = 3, hjust = 0, vjust = 1) +
  annotate("text", x = 1.17, y = 0.97, label = "Uplifting/Energetic", alpha = 0.5, size = 3, hjust = 1, vjust = 1) +
  annotate("text", x = 0.01, y = 0.03, label = "Melancholic/Calm", alpha = 0.5, size = 3, hjust = 0, vjust = 0) +
  annotate("text", x = 1.17, y = 0.03, label = "Soothing/Positive", alpha = 0.5, size = 3, hjust = 1, vjust = 0) +
  scale_x_continuous(limits = c(0,1.2),
                     breaks = seq(0,1, by = 0.25)) +
  scale_y_continuous(limits = c(0,1)) +
  paletteer::scale_color_paletteer_d("ggthemes::gdoc") +
  labs(title = "<span style= 'font-family:bodoni; color:#EE2E34;'>THE SMITHS</span>",
       x = "Valence",
       y = "Energy") +
  theme_minimal() +
  theme(
    plot.title = element_markdown(size = 32),
    axis.title = element_text(family = "bodoni", face = "bold"),
    legend.title = element_blank(),
    legend.position = "bottom"
  )
