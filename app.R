source("dependencies.R")

library(shiny)
library(leaflet)

ui <- fluidPage(
  dateInput(inputId = "selected_date", label = "Imagery Date", value = Sys.Date() -1, min = "1999-01-01", max = Sys.Date()),
  leafletOutput("map"),
  a("Click here to learn about this app",
    href="https://cyberhelp.sesync.org/blog/browse-wms-with-shiny.html")
)

server <- function(input, output) {
  
  output$map <- renderLeaflet({
    leaflet() %>%
      addMarkers(lng = -76.505206, lat = 38.9767231) %>%
      setView(lng = -76.505206, lat = 38.9767231, zoom = 5) %>%
      addProviderTiles(providers$NASAGIBS.ModisTerraTrueColorCR,
                       options = providerTileOptions(time = input$selected_date)) 
  })
  
}

shinyApp(ui, server)

shinyApp(ui, server)