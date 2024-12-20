
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Revisiting cyclones

<!-- badges: start -->

<!-- badges: end -->

This is an exercise repository for the [Open and Reproducible Science in
R](https://oxford-ihtm.io/teaching/) module of the [MSc in International
Health and Tropical
Medicine](https://www.tropicalmedicine.ox.ac.uk/study-with-us/msc-ihtm).

In this exercise, we revisit the cyclones dataset and will work on the
following tasks.

## Task 1: Setup an R project

Although this repository has already been setup for you, unlike other
exercises, the structure of the project is yet to be organised.

For this exercise, let’s create appropriate folders/directories based on
the workflow we will aim to produce.

1.  Create a `data` directory to store the cyclones dataset into.

2.  Create an `outputs` directory to store the various outputs that we
    will create in this project.

3.  Create a `reports` directory to store our literate code for reports
    that we will create in this project.

4.  Create an `R` directory to store all the bespoke functions that we
    will create for this project.

After completing these steps, git commit and push your changes to your
current branch.

## Task 2: Download and read the cyclones dataset

The cyclones dataset is not included in this current project unlike
before. However the cyclones dataset is available from this URL:
<https://github.com/OxfordIHTM/teaching_datasets/raw/refs/heads/main/cyclones.xlsx>.

Using what you have learned earlier about creating functions, create a
function that will download this file into the `data` folder/directory
and will read this dataset into R.

Note that this dataset is in `.XLSX` format. You will have to use a
function that can read an `.XLSX` file. There is an R package that can
be installed that provides a function to read `.XLSX` files. The name of
the package is `openxlsx2`. Install this package and then use the
function called `read_xlsx()` to read the `.XLSX` file.

Once you have written the function, use this function in a new R script
in the root of the project called `cyclones.R`.

After completing these steps, git commit and push your changes to your
current branch.

## Task 3: Perform exploratory data analysis on the cyclones dataset

Now that you have the dataset loaded into R, perform as much exploratory
data analysis (EDA) to describe the structure and the variables of the
dataset. Some of the explorations you might want to do are:

1.  Description of the data such as number of records, any missing
    values, and description of relevant variables.

2.  Summary and distribution of continuous variables.

Write appropriate code in `cyclones.R` that will provide these summary
outputs. Produce appropriate tables and plots.

After completing these steps, git commit and push your changes to your
current branch.

## Task 4: Write literate code to report your findings

Using `Rmarkdown`, write literate code to report your EDA findings.
Create a file called `cyclones.Rmd` inside the `reports` directory that
will produce an HTML report/output in the `outputs` folder.

Once completed, `knit` your report such that an output HTML is stored in
the `outputs` folder.

After completing these steps, git commit and push your changes to your
current branch.
