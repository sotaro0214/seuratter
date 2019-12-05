library(shiny)

ui <- fluidPage(
  # Create different tabs for each graphical output
  tabsetPanel(
    tabPanel(title = "Determine Dimensionality",
             sliderInput(inputId = "num",
                         label = "Choose a number",
                         value = 0.7, min = 0, max = 1),
             plotOutput("elbow_plot")
    ),
    tabPanel(title = "Gene Expression Relationships Network",
             plotOutput("clusters_graph"),
             actionButton(inputId = "click",
                          label = "Reorganize")
    ),
    tabPanel(title = "Gene Expression Relationships Bar Plot",
             plotOutput("clusters_bar"),
    )
  )
)

server <- function(input, output) {
  output$elbow_plot <- renderPlot({
    title <- "test plot"
    determine_dimensionality(elbow_plot_data, input$num)
  })

  output$clusters_graph <- renderPlot(({
    draw_cluster_gene_relations(gene_comparison_matrix)
  }))

  # Allow user to reorganize the graph if difficult to observe
  observeEvent(input$click, {
    output$clusters_graph <- renderPlot(({
      draw_cluster_gene_relations(gene_comparison_matrix)
    }))
  })

  graph <- draw_cluster_gene_relations(gene_comparison_matrix)
  output$clusters_bar <- renderPlot(({
    plot_cluster_relations(graph)
  }))

}

shinyApp(ui = ui, server = server)
