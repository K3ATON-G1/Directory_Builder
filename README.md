# DIRECTORY BUILDER

Directory Builder is an automated R Shiny application for creating standardized project directory structures.

The application is already configured and does not require users to install R, install RStudio, or modify the application code.

## Open the Application

[Open Directory Builder](https://k3aton-g1.shinyapps.io/directory-builder/)

## How to Use

1. Open the Directory Builder using the link above.

2. Enter the full name of your project.

   Example:

   ```text
   Satellite Analysis
   ```

3. Directory Builder will automatically abbreviate the project name and add the current date.

   Example:

   ```text
   Satellite Analysis
          |
          v
        SatAnl
          |
          v
   26.09.16_SatAnl
   ```

4. Review the generated project directory name.

5. Click **Download Project Directory**.

6. Your complete project directory will download as a ZIP file.

7. Locate the downloaded ZIP file and extract it into the Parent Directory where you want to store the project.

## What Directory Builder Creates

Every downloaded project contains the following structure:

* `PROJECT`

  * `00_READ_ME.txt`
  * `01_ORIGINAL_DATA`

    * `01_DOCUMENTS`
    * `01_FILES`
    * `01_IMAGES`
    * `01_TABLES`
  * `02_WORKING_DATA`

    * `02_DOCUMENTS`
    * `02_FILES`
    * `02_IMAGES`
    * `02_TABLES`
  * `03_DELIVERABLES`

    * `03_DOCUMENTS`
    * `03_FILES`
    * `03_IMAGES`
    * `03_TABLES`
  * `04_DOCUMENTATION`

    * `04_DOCUMENTS`
    * `04_FILES`
    * `04_IMAGES`
    * `04_TABLES`
  * `05_SCRIPT`
  * `06_ARCHIVE`

    * `06_DOCUMENTS`
    * `06_FILES`
    * `06_IMAGES`
    * `06_TABLES`
  * `07_BACKUPS`

## Requirements

Using the hosted Directory Builder only requires:

* A web browser
* Access to the Directory Builder link
* The ability to download and extract a ZIP file

Users do not need R or RStudio.

The source code is stored in this GitHub repository for documentation, maintenance, and future development. The hosted application runs the R code remotely through shinyapps.io (Posit, 2026).

## Running the Application Locally

Developers who want to run the application locally will need:

* R
* RStudio
* The R package `shiny`
* The R package `zip`

Install the required packages by running:

```r
install.packages(c("shiny", "zip"))
```

After installation, open `app.R` and click **Run App**.

## Important Information

You do not need to edit the Directory Builder R code to use the hosted application.

The application automatically:

* Uses the current date
* Generates an abbreviated project name
* Creates the complete directory structure
* Creates a project-specific `00_READ_ME.txt`
* Packages the directory as a ZIP file
* Allows the ZIP file to be downloaded to any computer

After downloading, users choose the Parent Directory by extracting or moving the project folder into the desired location.

## Source

Posit. (2026). *Shinyapps.io user guide*. https://docs.posit.co/shinyapps.io/

