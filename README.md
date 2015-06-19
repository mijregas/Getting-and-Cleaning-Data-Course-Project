# Getting-and-Cleaning-Data-Course-Project
Project Submission for Data Science Course - Getting and Cleaning Data

There are 2 files of interest in this repository:

  1) run_analysis.R is a file containing an R script or function that will perform the 
     data retrieval and data cleaning activity as required for the course project. Once 
	 opened and "sourced" in RStudio, simply issue the command "run_analysis()". For 
	 detail on how the script operates, please see the script itself which contains 
	 comments at the beginning of each logical step.
	 
  2) CodeBook.md describes the files that are retrieved by the R script and, in some detail,
     the operations that are performed to produce the required output -- i.e. the "tidy" data 
	 frame.
	 
Note:  In addition to the data frame returned by the function, the run_analysis.R script
       writes three output files into the "./data" directory. The first (df_tidy_all.csv) 
	   is a CSV (spreadsheet) file containing the detailed data from which the summarized 
	   dataset is produced. The other two files are TXT and CSV versions of the summarized 
	   data -- df_tidy_summary.txt and df_tidy_summary.csv respectively.
