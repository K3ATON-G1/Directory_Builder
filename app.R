# PROJECT DIRECTORY BUILDER
# Creates a standardized project directory structure as a downloadable ZIP.

library(shiny)
library(zip)

# 1. PROJECT NAME ABBREVIATION FUNCTION

make_short_name <- function(x) {
  x <- trimws(x)
  words <- strsplit(x, "\\s+")[[1]]
  
  ignore_words <- c(
    "a", "an", "and", "the", "of", "for", "to", "in", "on"
  )
  
  words <- words[!tolower(words) %in% ignore_words]
  words <- gsub("[^A-Za-z0-9]", "", words)
  words <- words[nchar(words) > 0]
  
  if (length(words) == 0) {
    return("")
  }
  
  short_words <- substr(words, 1, 3)
  short_words <- paste0(
    toupper(substr(short_words, 1, 1)),
    tolower(substr(short_words, 2, 3))
  )
  
  paste0(short_words, collapse = "")
}

# 2. STANDARD PROJECT FOLDER STRUCTURE

project_folders <- c(
  "01_ORIGINAL_DATA/01_DOCUMENTS",
  "01_ORIGINAL_DATA/01_FILES",
  "01_ORIGINAL_DATA/01_IMAGES",
  "01_ORIGINAL_DATA/01_TABLES",
  "02_WORKING_DATA/02_DOCUMENTS",
  "02_WORKING_DATA/02_FILES",
  "02_WORKING_DATA/02_IMAGES",
  "02_WORKING_DATA/02_TABLES",
  "03_DELIVERABLES/03_DOCUMENTS",
  "03_DELIVERABLES/03_FILES",
  "03_DELIVERABLES/03_IMAGES",
  "03_DELIVERABLES/03_TABLES",
  "04_DOCUMENTATION/04_DOCUMENTS",
  "04_DOCUMENTATION/04_FILES",
  "04_DOCUMENTATION/04_IMAGES",
  "04_DOCUMENTATION/04_TABLES",
  "05_SCRIPT",
  "06_ARCHIVE/06_DOCUMENTS",
  "06_ARCHIVE/06_FILES",
  "06_ARCHIVE/06_IMAGES",
  "06_ARCHIVE/06_TABLES",
  "07_BACKUPS"
)

# 3. README CREATION FUNCTION

create_readme <- function(project_path, project_folder, project_name) {
  readme_text <- c(
    "PROJECT FILE SETUP",
    "==================",
    "",
    paste("Project:", project_name),
    paste("Project Directory:", project_folder),
    paste("Created:", format(Sys.Date(), "%Y.%m.%d")),
    "Parent Directory: Chosen by the user when the downloaded ZIP is extracted.",
    "",
    "",
    "1. THE PARENT DIRECTORY",
    "-----------------------",
    "",
    "The Parent Directory is the main folder that contains all projects",
    "associated with a larger class, research effort, or body of work.",
    "",
    "After downloading this project, extract or move the project folder",
    "into the Parent Directory where it should be stored.",
    "",
    "Keeping related projects under one parent directory provides a",
    "consistent starting point and prevents project files from becoming",
    "scattered across the computer (Noble, 2009).",
    "",
    "",
    "2. PROJECT NAMING",
    "-----------------",
    "",
    "Each project is given a short, readable name and prefixed with the",
    "date it was created.",
    "",
    "Example:",
    "",
    "Satellite Analysis",
    "        |",
    "        v",
    "      SatAnl",
    "        |",
    "        v",
    "26.09.15_SatAnl",
    "",
    "The shortened name keeps file paths manageable while still making",
    "the project identifiable. Using YY.MM.DD at the beginning allows",
    "projects to sort chronologically and records when the project was",
    "started (Wilson et al., 2017).",
    "",
    "",
    "3. STANDARD DIRECTORY STRUCTURE",
    "--------------------------------",
    "",
    "Every project uses the same standard directory structure.",
    "",
    "01_ORIGINAL_DATA",
    "    01_DOCUMENTS",
    "    01_FILES",
    "    01_IMAGES",
    "    01_TABLES",
    "",
    "02_WORKING_DATA",
    "    02_DOCUMENTS",
    "    02_FILES",
    "    02_IMAGES",
    "    02_TABLES",
    "",
    "03_DELIVERABLES",
    "    03_DOCUMENTS",
    "    03_FILES",
    "    03_IMAGES",
    "    03_TABLES",
    "",
    "04_DOCUMENTATION",
    "    04_DOCUMENTS",
    "    04_FILES",
    "    04_IMAGES",
    "    04_TABLES",
    "",
    "05_SCRIPT",
    "",
    "06_ARCHIVE",
    "    06_DOCUMENTS",
    "    06_FILES",
    "    06_IMAGES",
    "    06_TABLES",
    "",
    "07_BACKUPS",
    "",
    "",
    "4. DIRECTORY PURPOSES",
    "---------------------",
    "",
    "01_ORIGINAL_DATA",
    "Stores source data in its original, unchanged form.",
    "",
    "02_WORKING_DATA",
    "Contains modified, processed, or intermediate data.",
    "",
    "03_DELIVERABLES",
    "Contains completed project products.",
    "",
    "04_DOCUMENTATION",
    "Stores project notes, methods, references, and supporting materials.",
    "",
    "05_SCRIPT",
    "Contains code used for processing and analysis.",
    "",
    "06_ARCHIVE",
    "Holds older files that are no longer actively used but should",
    "be retained.",
    "",
    "07_BACKUPS",
    "Stores backup copies of important project data.",
    "",
    "",
    "5. PROJECT MANAGEMENT PRACTICES",
    "-------------------------------",
    "",
    "Files should be placed according to their role in the project.",
    "",
    "Original data should NEVER be modified or overwritten.",
    "",
    "Changes to source data should instead be saved within",
    "02_WORKING_DATA.",
    "",
    "Files that are no longer actively needed but may have future value",
    "should be moved to 06_ARCHIVE rather than deleted.",
    "",
    "07_BACKUPS should contain separate backup copies of important",
    "project data.",
    "",
    "An archive preserves older material, while a backup protects",
    "against data loss (Noble, 2009).",
    "",
    "",
    "REFERENCES",
    "----------",
    "",
    "Noble, W. S. (2009). A quick guide to organizing computational",
    "biology projects. PLOS Computational Biology, 5(7), e1000424.",
    "",
    "Wilson, G. et al. (2017). Good enough practices in scientific",
    "computing. PLOS Computational Biology, 13(6), e1005510."
  )
  
  writeLines(readme_text, file.path(project_path, "00_READ_ME.txt"))
}

# 4. PROJECT DETAILS FUNCTION

get_project_details <- function(project_name) {
  project_name <- trimws(project_name)
  
  if (project_name == "") {
    return(NULL)
  }
  
  short_name <- make_short_name(project_name)
  
  if (short_name == "") {
    return(NULL)
  }
  
  project_date <- format(Sys.Date(), "%y.%m.%d")
  
  list(
    project_name = project_name,
    project_folder = paste0(project_date, "_", short_name)
  )
}

# 5. USER INTERFACE

ui <- fluidPage(
  titlePanel("Project Directory Builder"),
  
  tags$p(
    "Create and download a standardized directory structure for a new project."
  ),
  
  tags$hr(),
  
  h3("1. Enter Project Name"),
  
  tags$p("Enter the full readable name of the new project."),
  
  textInput(
    "project_name",
    "Project Name:",
    placeholder = "Satellite Analysis",
    width = "400px"
  ),
  
  tags$hr(),
  
  h3("2. Review Project Name"),
  
  tags$p(
    paste(
      "The project name is automatically abbreviated and",
      "today's date is added."
    )
  ),
  
  strong("Project Directory:"),
  
  verbatimTextOutput("project_preview"),
  
  tags$hr(),
  
  h3("3. Download Project"),
  
  tags$p(
    paste(
      "Download the project directory, standardized subdirectories,",
      "and project README as a ZIP file. Extract the ZIP into the",
      "parent directory where you want to keep the project."
    )
  ),
  
  downloadButton(
    "download_project",
    "Download Project Directory"
  ),
  
  br(),
  br(),
  
  uiOutput("download_status")
)

# 6. SERVER

server <- function(input, output, session) {
  project_details <- reactive({
    get_project_details(input$project_name)
  })
  
  output$project_preview <- renderText({
    details <- project_details()
    
    if (is.null(details)) {
      return("Enter a project name to generate a preview.")
    }
    
    details$project_folder
  })
  
  output$download_project <- downloadHandler(
    filename = function() {
      details <- project_details()
      
      if (is.null(details)) {
        return("project-directory.zip")
      }
      
      paste0(details$project_folder, ".zip")
    },
    
    content = function(file) {
      details <- project_details()
      
      if (is.null(details)) {
        stop("Please enter a valid project name before downloading.")
      }
      
      staging_directory <- tempfile("directory_builder_")
      dir.create(staging_directory, recursive = TRUE)
      on.exit(unlink(staging_directory, recursive = TRUE, force = TRUE), add = TRUE)
      
      project_path <- file.path(
        staging_directory,
        details$project_folder
      )
      
      dir.create(project_path, recursive = TRUE)
      
      for (folder in project_folders) {
        dir.create(
          file.path(project_path, folder),
          recursive = TRUE,
          showWarnings = FALSE
        )
      }
      
      create_readme(
        project_path = project_path,
        project_folder = details$project_folder,
        project_name = details$project_name
      )
      
      zip::zipr(
        zipfile = file,
        files = details$project_folder,
        root = staging_directory,
        recurse = TRUE,
        include_directories = TRUE
      )
    },
    
    contentType = "application/zip"
  )
  
  output$download_status <- renderUI({
    details <- project_details()
    
    if (is.null(details)) {
      return(
        tags$p("Enter a project name before downloading.")
      )
    }
    
    tagList(
      h4("Project Ready for Download"),
      tags$p(strong("Project:")),
      tags$code(details$project_folder),
      tags$p(
        "Click the download button, then extract the ZIP into your chosen parent directory."
      )
    )
  })
}

# 7. RUN APPLICATION

shinyApp(
  ui = ui,
  server = server
)
