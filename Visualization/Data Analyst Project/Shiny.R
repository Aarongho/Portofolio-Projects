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

education_2022 = read.table(file.choose(), sep=",", header = T)
poverty_2022 = read.table(file.choose(), sep=",", header = T)

education_2022 <- na.omit(education_2022)
poverty_2022 <- na.omit(poverty_2022)

education_2022$Provinsi <- tolower(education_2022$Provinsi)
poverty_2022$Provinsi <- tolower(poverty_2022$Provinsi)

education_2022$Provinsi[education_2022$Provinsi == "kep. bangka belitung"] <- "kepulauan bangka belitung"
education_2022$Provinsi[education_2022$Provinsi == "kep. riau"] <- "kepulauan riau"
education_2022$Provinsi[education_2022$Provinsi == "di yogyakarta"] <- "di. yogyakarta"
final <- merge(poverty_2022,education_2022, by.x= "Provinsi")


library_data <- read.table(file.choose(), sep=",", header = T)

library_data <- library_data %>%
  select(Province = `Provinsi`, Total_perpustakaan_per_provinsi = `Total.perpustakaan.per.provinsi`) %>%
  filter(!is.na(Total_perpustakaan_per_provinsi)) %>%
  mutate(
    Province = gsub("Prov. ", "", Province),
    Total_perpustakaan_per_provinsi = as.numeric(Total_perpustakaan_per_provinsi)
  )

ui <- navbarPage(
  title = "Quality of Education in Indonesia in 2022",
  theme = bs_theme(bootswatch = "morph"),
  navbarMenu(
    title = "Plots",
    tabPanel(
      title = "Distribution of Teachers in Indonesia in 2022",
      fluidPage(
        fluidRow(
          titlePanel("Distribution of Teachers in Indonesia in 2022"),
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
      title = "School Participation Rates in Indonesia from 2002 to 2022",
      fluidPage(
        fluidRow(
          titlePanel("School Participation Rates in Indonesia from 2002 to 2022")
        ),
        fluidRow(
          column(
            width = 12,
            plotlyOutput(outputId = "lineplot")
          )
        )
      )
    ),
    
    tabPanel(
      title = "Relationship Between Educational Attainment and Poverty in Indonesia in 2022",
      fluidPage(
        fluidRow(
          titlePanel("Relationship Between Educational Attainment and Poverty in Indonesia in 2022"),
        ),
        fluidRow(
          column(
            width = 12,
            plotlyOutput(outputId = "scatter")
          )
        )
      )
    ),
    
    tabPanel(
      title = "Distribution of Libraries in Indonesia for the Academic Year 2022/2023",
      fluidPage(
        fluidRow(
          titlePanel("Distribution of Libraries in Indonesia for the Academic Year 2022/2023"),
          column(
            width = 6,
            selectInput(
              inputId = "library_choice",
              label = "Choose an Option:",
              choices = c("5 Highest", "5 Lowest"),
              selected = "5 Highest"
            )
          )
        ),
        fluidRow(
          column(
            width = 12,
            plotlyOutput(outputId = "library_plot")
          )
        )
      )
    )
    
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
      name = "Total SD Teachers"
    ) %>%
      add_bars(
        data = subset(data2, Provinsi %in% input$x), 
        x = subset(data2, Provinsi %in% input$x)$Provinsi,
        y = data2[data2$Provinsi %in% input$x, "Jumlah.Guru.SMP..Negeri.Swasta."],
        color = "orange",
        name = "Total SMP Teachers"
      ) %>%
      add_bars(
        data = subset(data3, Provinsi %in% input$x), 
        x = subset(data3, Provinsi %in% input$x)$Provinsi,
        y = data3[data3$Provinsi %in% input$x, "Jumlah.Guru.SMA..Negeri.Swasta."],
        color = "red",
        name = "Total SMA Teachers"
      ) %>%
      add_bars(
        data = subset(data4, Provinsi %in% input$x), 
        x = subset(data4, Provinsi %in% input$x)$Provinsi,
        y = data4[data4$Provinsi %in% input$x, "Jumlah.Guru.SMK..Negeri.Swasta."],
        color = "green",
        name = "Total SMK Teachers"
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
        title = "Participation by Age Group",
        xaxis = list(title = "Year"),
        yaxis = list(title = "Participation Percentage")
      )
  })
  
 output$scatter <- renderPlotly({
  lm_model <- lm(Rata.rata.kemiskinan.tahun.2022 ~ Rata.rata.penyelesaian.pendidikan.tahun.2022, data = final)
  final$trendline <- predict(lm_model)

  cor_test <- cor.test(final$Rata.rata.penyelesaian.pendidikan.tahun.2022, final$Rata.rata.kemiskinan.tahun.2022)
  cor_value <- round(cor_test$estimate, 2)
  p_value <- format.pval(cor_test$p.value, digits = 3)

  plot_ly(
    data = final,
    x = ~Rata.rata.penyelesaian.pendidikan.tahun.2022,
    y = ~Rata.rata.kemiskinan.tahun.2022,
    type = 'scatter',
    mode = 'markers',
    text = ~Provinsi,
    name = 'Correlation',
    marker = list(size = 10)
  ) %>%
    add_lines(
      x = ~Rata.rata.penyelesaian.pendidikan.tahun.2022,
      y = ~trendline,
      line = list(color = 'darkorange'),
      name = 'Trendline'
    ) %>%
    layout(
      title = paste("Relationship Between Educational Attainment and Poverty in Indonesia in 2022",
                    "<br>Correlation: ", cor_value, ", p-value: ", p_value),
      xaxis = list(title = "Average Educational Attainment (2022)"),
      yaxis = list(title = "Average Poverty Rate (2022)")
    )
})
 
 output$library_plot <- renderPlotly({
   library_data_sorted <- library_data %>%
     arrange(desc(Total_perpustakaan_per_provinsi))
   
   top5_highest <- library_data_sorted %>%
     head(5)
   
   top5_lowest <- library_data_sorted %>%
     tail(5)
   
   selected_data <- if(input$library_choice == "5 Highest"){
     top5_highest
   }else {
     top5_lowest
   }
   
   plot_ly(
     data = selected_data,
     x = ~Province,
     y = ~Total_perpustakaan_per_provinsi,
     type = 'bar',
     color = ~Province,
     text = ~Total_perpustakaan_per_provinsi
   ) %>%
     layout(
       title = paste(input$library_choice, "Distribution of Libraries in Indonesia for the Academic Year 2022/2023"),
       xaxis = list(title = "Province"),
       yaxis = list(title = "Total Libraries")
     )
 })
  
}
shinyApp(ui = ui, server = server)

