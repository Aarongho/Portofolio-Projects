library(shiny)
library(bslib)
library(ggplot2)
library(plotly)
library(dplyr)
library(readxl)


data = read.table(file.choose(), sep=",", header = T)
data2 = read.table(file.choose(), sep=",", header = T)
data3 = read.table(file.choose(), sep=",", header = T)
data4 = read.table(file.choose(), sep=",", header = T)
dataPartisipasi = read_excel(file.choose())

dataPartisipasi
ui <- navbarPage(
  title = "Kualitas pendidikan di Indonesia tahun 2022",
  theme = bs_theme(bootswatch = "morph"),
  navbarMenu(
    title = "Plots",
    tabPanel(
      title = " Persebaran guru di Indonesia tahun 2022",
      fluidPage(
        fluidRow(
          titlePanel("Persebaran Guru di Indonesia Tahun 2022"),
          column(
            width = 6,
            selectInput(
              inputId = "x",
              label = "Choice of Option:",
              choices = unique(data$Provinsi),
              selected = "Aceh"
            )
          )
        ),
        fluidRow(
          column(
            width = 12,
            plotlyOutput(outputId = "barplot")
          )
        )
      )
    ),
    
    tabPanel(
      title = "Persentase partisipasi sekolah di Indonesia tahun 2002-2022",
      fluidPage(
        fluidRow(
          titlePanel("Persentase partisipasi sekolah di Indonesia tahun 2002-2022")
        ),
        fluidRow(
          column(
            width = 12,
            plotlyOutput(outputId = "lineplot")
          )
        )
      )
    ),
  )
)
      
    
server <- function(input, output) {
  output$barplot <- renderPlotly({
    plot_ly(
      data = subset(data, Provinsi %in% input$x), 
      y = data[data$Provinsi %in% input$x, "Jumlah.Guru.SD..Negeri.Swasta."],
      x = subset(data, Provinsi %in% input$x)$Provinsi,
      type = "bar",
      color = "blue",
      name = "Jumlah Guru SD"
    ) %>%
      add_bars(
        data = subset(data2, Provinsi %in% input$x), 
        x = subset(data2, Provinsi %in% input$x)$Provinsi,
        y = data2[data2$Provinsi %in% input$x, "Jumlah.Guru.SMP..Negeri.Swasta."],
        color = "orange",
        name = "Jumlah Guru SMP"
      ) %>%
      add_bars(
        data = subset(data3, Provinsi %in% input$x), 
        x = subset(data3, Provinsi %in% input$x)$Provinsi,
        y = data3[data3$Provinsi %in% input$x, "Jumlah.Guru.SMA..Negeri.Swasta."],
        color = "red",
        name = "Jumlah Guru SMA"
      ) %>%
      add_bars(
        data = subset(data4, Provinsi %in% input$x), 
        x = subset(data4, Provinsi %in% input$x)$Provinsi,
        y = data4[data4$Provinsi %in% input$x, "Jumlah.Guru.SMK..Negeri.Swasta."],
        color = "green",
        name = "Jumlah Guru SMK"
      )
  })
  output$lineplot <- renderPlotly({
    plot_ly(
      data = dataPartisipasi,
      x = ~dataPartisipasi$Tahun,
      y = ~dataPartisipasi$`7-12`,
      type = 'scatter',
      mode = 'lines',
      name = '7-12'
    ) %>%
      add_trace(
        y = ~dataPartisipasi$`13-15`,
        name = '13-15',
        mode = 'lines'
      ) %>%
      add_trace(
        y = ~dataPartisipasi$`16-18`,
        name = '16-18',
        mode = 'lines'
      ) %>%
      add_trace(
        y = ~dataPartisipasi$`19-24`,
        name = '19-24',
        mode = 'lines'
      ) %>%
      layout(
        title = "Partisipasi berdasarkan Kelompok Usia",
        xaxis = list(title = "Tahun"),
        yaxis = list(title = "Persentase partisipasi")
      )
  })
}

shinyApp(ui = ui, server = server)
