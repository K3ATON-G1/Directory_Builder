# PROJECT DIRECTORY BUILDER
# Creates a standardized project directory structure.

# Example:
# Satellite Analysis -> SatAnl -> 26.09.15_SatAnl

library(shiny)

# 1. PROJECT NAME ABBREVIATION FUNCTION

make_short_name <- function(x) {
  
  # Remove extra spaces
  x <- trimws(x)
  
  # Split project name into individual words
  words <- strsplit(x, "\\s+")[[1]]
  
  # Small connecting words to ignore
  ignore_words <- c(
    "a",
    "an",
    "and",
    "the",
    "of",
    "for",
    "to",
    "in",
    "on"
  )
  
  # Remove ignored words
  words <- words[
    !tolower(words) %in% ignore_words
  ]
  
  # Remove special characters
  words <- gsub(
    "[^A-Za-z0-9]",
    "",
    words
  )
  
  # Remove empty words
  words <- words[
    nchar(words) > 0
  ]
  
  # Return blank if no usable words remain
  if (length(words) == 0) {
    return("")
  }
  
  # Take first three letters of each word
  short_words <- substr(
    words,
    1,
    3
  )
  
  # Capitalize first letter of each abbreviation
  short_words <- paste0(
    toupper(substr(short_words, 1, 1)),
    tolower(substr(short_words, 2, 3))
  )
  
  # Combine abbreviations without spaces
  short_name <- paste0(
    short_words,
    collapse = ""
  )
  
  return(short_name)
}

# 2. STANDARD PROJECT FOLDER STRUCTURE

project_folders <- c(
  
  # 01 Original Data
  "01_ORIGINAL_DATA/01_DOCUMENTS",
  "01_ORIGINAL_DATA/01_FILES",
  "01_ORIGINAL_DATA/01_IMAGES",
  "01_ORIGINAL_DATA/01_TABLES",
  
  # 02 Working Data
  "02_WORKING_DATA/02_DOCUMENTS",
  "02_WORKING_DATA/02_FILES",
  "02_WORKING_DATA/02_IMAGES",
  "02_WORKING_DATA/02_TABLES",
  
  # 03 Deliverables
  "03_DELIVERABLES/03_DOCUMENTS",
  "03_DELIVERABLES/03_FILES",
  "03_DELIVERABLES/03_IMAGES",
  "03_DELIVERABLES/03_TABLES",
  
  # 04 Documentation
  "04_DOCUMENTATION/04_DOCUMENTS",
  "04_DOCUMENTATION/04_FILES",
  "04_DOCUMENTATION/04_IMAGES",
  "04_DOCUMENTATION/04_TABLES",
  
  # 05 Script
  "05_SCRIPT",
  
  # 06 Archive
  "06_ARCHIVE/06_DOCUMENTS",
  "06_ARCHIVE/06_FILES",
  "06_ARCHIVE/06_IMAGES",
  "06_ARCHIVE/06_TABLES",
  
  # 07 Backups
  "07_BACKUPS"
)

# 3. README CREATION FUNCTION

create_readme <- function(
    project_path,
    project_folder,
    project_name,
    parent_directory
) {
  
  readme_text <- c(
    
    "PROJECT FILE SETUP",
    "==================",
    "",
    
    paste(
      "Project:",
      project_name
    ),
    
    paste(
      "Project Directory:",
      project_folder
    ),
    
    paste(
      "Created:",
      format(Sys.Date(), "%Y.%m.%d")
    ),
    
    paste(
      "Parent Directory:",
      parent_directory
    ),
    
    "",
    "",
    
    # PARENT DIRECTORY
    
    "1. THE PARENT DIRECTORY",
    "-----------------------",
    "",
    
    "The Parent Directory is the main folder that contains all projects",
    "associated with a larger class, research effort, or body of work.",
    "",
    
    "Keeping related projects under one parent directory provides a",
    "consistent starting point and prevents project files from becoming",
    "scattered across the computer (Noble, 2009).",
    
    "",
    "",

    # PROJECT NAMING
    
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
    
    # DIRECTORY STRUCTURE
    
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

    # DIRECTORY PURPOSES
    
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
    
    # PROJECT MANAGEMENT
    
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
    
    # REFERENCES
    
    "REFERENCES",
    "----------",
    "",
    
    "Noble, W. S. (2009). A quick guide to organizing computational",
    "biology projects. PLOS Computational Biology, 5(7), e1000424.",
    "",
    
    "Wilson, G. et al. (2017). Good enough practices in scientific",
    "computing. PLOS Computational Biology, 13(6), e1005510."
    
  )
  
  # Write README file
  writeLines(
    readme_text,
    file.path(
      project_path,
      "00_READ_ME.txt"
    )
  )
  
}

# 4. USER INTERFACE

ui <- fluidPage(
  
  titlePanel(
    "Project Directory Builder"
  ),
  
  tags$p(
    "Create a standardized directory structure for a new project."
  ),
  
  tags$hr(),
  
  # STEP 1
  
  h3(
    "1. Select Parent Directory"
  ),
  
  tags$p(
    paste(
      "Select the main directory containing the larger class,",
      "research project, or body of work."
    )
  ),
  
  actionButton(
    "select_directory",
    "Select Parent Directory"
  ),
  
  br(),
  br(),
  
  strong(
    "Selected Directory:"
  ),
  
  verbatimTextOutput(
    "directory_display"
  ),
  
  tags$hr(),
  
  # STEP 2
  
  h3(
    "2. Enter Project Name"
  ),
  
  tags$p(
    "Enter the full readable name of the new project."
  ),
  
  textInput(
    "project_name",
    "Project Name:",
    placeholder = "Satellite Analysis",
    width = "400px"
  ),
  
  tags$hr(),
  
  # STEP 3
  
  h3(
    "3. Review Project Name"
  ),
  
  tags$p(
    paste(
      "The project name is automatically abbreviated and",
      "today's date is added."
    )
  ),
  
  strong(
    "Project Directory:"
  ),
  
  verbatimTextOutput(
    "project_preview"
  ),
  
  tags$hr(),
  
  # STEP 4
  
  h3(
    "4. Create Project"
  ),
  
  tags$p(
    paste(
      "Create the project directory, standardized subdirectories,",
      "and project README."
    )
  ),
  
  actionButton(
    "create_project",
    "Create Project"
  ),
  
  br(),
  br(),
  
  uiOutput(
    "creation_status"
  )
  
)

# 5. SERVER

server <- function(input, output, session) {
  
  # STORE SELECTED PARENT DIRECTORY
  
  parent_directory <- reactiveVal(
    NULL
  )
  
  # SELECT PARENT DIRECTORY
  
  observeEvent(
    input$select_directory,
    {
      
      selected <- choose.dir(
        caption = "Select the Main Parent Directory"
      )
      
      if (
        !is.null(selected) &&
        !is.na(selected)
      ) {
        
        parent_directory(
          selected
        )
        
      }
      
    }
  )
  
  # DISPLAY PARENT DIRECTORY
  
  output$directory_display <- renderText({
    
    selected <- parent_directory()
    
    
    if (is.null(selected)) {
      
      return(
        "No directory selected."
      )
      
    }
    
    selected
    
  })
  
  
  # PROJECT NAME PREVIEW
  
  output$project_preview <- renderText({
    
    project_name <- input$project_name
    
    
    if (
      is.null(project_name) ||
      trimws(project_name) == ""
    ) {
      
      return(
        "Enter a project name to generate a preview."
      )
      
    }
    
    # Create abbreviated name
    short_name <- make_short_name(
      project_name
    )
    
    if (short_name == "") {
      
      return(
        "A valid project name could not be generated."
      )
      
    }
    
    # Current date
    project_date <- format(
      Sys.Date(),
      "%y.%m.%d"
    )
    
    # Final project folder
    paste0(
      project_date,
      "_",
      short_name
    )
    
  })
  
  # CREATE PROJECT
  
  observeEvent(
    input$create_project,
    {
      
      # GET PARENT DIRECTORY
      
      selected <- parent_directory()
      
      
      if (is.null(selected)) {
        
        showNotification(
          "Please select a parent directory.",
          type = "error"
        )
        
        return()
        
      }
      
      # CHECK PROJECT NAME
      
      if (
        is.null(input$project_name) ||
        trimws(input$project_name) == ""
      ) {
        
        showNotification(
          "Please enter a project name.",
          type = "error"
        )
        
        return()
        
      }

      # CREATE SHORT PROJECT NAME
      
      short_name <- make_short_name(
        input$project_name
      )
      
      if (short_name == "") {
        
        showNotification(
          "A valid project name could not be generated.",
          type = "error"
        )
        
        return()
        
      }

      # CREATE DATE
      
      project_date <- format(
        Sys.Date(),
        "%y.%m.%d"
      )

      # CREATE PROJECT FOLDER NAME
      
      project_folder <- paste0(
        project_date,
        "_",
        short_name
      )

      # CREATE COMPLETE PROJECT PATH
      
      project_path <- file.path(
        selected,
        project_folder
      )

      # PREVENT ACCIDENTAL OVERWRITE

      if (dir.exists(project_path)) {
        
        showNotification(
          paste(
            "This project already exists:",
            project_folder
          ),
          type = "error",
          duration = 8
        )
        
        return()
        
      }

      # CREATE MAIN PROJECT DIRECTORY
 
      created <- dir.create(
        project_path,
        recursive = TRUE,
        showWarnings = FALSE
      )
      
      if (
        !created &&
        !dir.exists(project_path)
      ) {
        
        showNotification(
          "The project directory could not be created.",
          type = "error"
        )
        
        return()
        
      }
      
      # CREATE STANDARD SUBDIRECTORIES
      
      for (folder in project_folders) {
        
        dir.create(
          file.path(
            project_path,
            folder
          ),
          recursive = TRUE,
          showWarnings = FALSE
        )
        
      }
      
      # CREATE 00_READ_ME.txt
 
      create_readme(
        project_path = project_path,
        project_folder = project_folder,
        project_name = input$project_name,
        parent_directory = selected
      )

      # SUCCESS MESSAGE
      
      output$creation_status <- renderUI({
        
        tagList(
          
          h4(
            "Project Created Successfully"
          ),
          
          tags$p(
            strong(
              "Project:"
            )
          ),
          
          tags$code(
            project_folder
          ),
          
          tags$p(
            strong(
              "Location:"
            )
          ),
          
          tags$code(
            project_path
          ),
          
          tags$p(
            strong(
              "README:"
            )
          ),
          
          tags$code(
            file.path(
              project_path,
              "00_READ_ME.txt"
            )
          )
          
        )
        
      })
      
      
      showNotification(
        paste(
          "Project created:",
          project_folder
        ),
        type = "message",
        duration = 8
      )
      
    }
  )
  
}

# 6. RUN APPLICATION

shinyApp(
  ui = ui,
  server = server
)