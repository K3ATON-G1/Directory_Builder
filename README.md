# Directory_Builder
An R Shiny application for creating standardized project directory structures.

DIRECTORY BUILDER
=================

Directory Builder is an automated R Shiny application for creating a
standardized project directory structure.

The application is already configured and does not require any changes
to the R code.


HOW TO USE
==========

1. Extract the entire Directory Builder ZIP folder.

2. Open "Directory Builder.R" in RStudio.

3. Click "Run App" at the top of the RStudio script window.

4. The Directory Builder application will open.

5. Click "Select Parent Directory."

   Select the main location where you want your new project folder
   to be created.

   Example:

   D:\Research

   or

   C:\Users\YourName\Documents\Projects

6. Enter the full name of your project.

   Example:

   Satellite Analysis

7. Directory Builder will automatically create a shortened project
   name and add the current date.

   Example:

   Satellite Analysis
          |
          v
        SatAnl
          |
          v
   26.09.16_SatAnl

8. Review the generated project directory name.

9. Click "Create Project."

10. Your complete project directory will automatically be created
    inside the Parent Directory you selected.


WHAT DIRECTORY BUILDER CREATES
==============================

Every new project contains the following structure:

PROJECT
|
|-- 00_READ_ME.txt
|
|-- 01_ORIGINAL_DATA
|   |-- DOCUMENTS
|   |-- FILES
|   |-- IMAGES
|   `-- TABLES
|
|-- 02_WORKING_DATA
|   |-- DOCUMENTS
|   |-- FILES
|   |-- IMAGES
|   `-- TABLES
|
|-- 03_DELIVERABLES
|   |-- DOCUMENTS
|   |-- FILES
|   |-- IMAGES
|   `-- TABLES
|
|-- 04_DOCUMENTATION
|   |-- DOCUMENTS
|   |-- FILES
|   |-- IMAGES
|   `-- TABLES
|
|-- 05_SCRIPT
|
|-- 06_ARCHIVE
|   |-- DOCUMENTS
|   |-- FILES
|   |-- IMAGES
|   `-- TABLES
|
`-- 07_BACKUPS


REQUIREMENTS
============

Directory Builder requires:

- R
- RStudio
- The R package "shiny"

If Shiny is not already installed, run the following command once
in the RStudio Console:

install.packages("shiny")

After installation, open "Directory Builder.R" and click "Run App."


IMPORTANT
=========

You do not need to edit the Directory Builder R code.

The application automatically:

- Uses the current date
- Generates the abbreviated project name
- Allows you to select your own Parent Directory
- Creates the complete directory structure
- Creates a project-specific 00_READ_ME.txt
- Prevents an existing project directory from being overwritten

The Parent Directory is selected by the user each time the application
is used. This allows Directory Builder to work on different computers
without changing the R code.
