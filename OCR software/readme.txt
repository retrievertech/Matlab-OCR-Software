The program was developed by Retriever Technology interns for OCR detection of WWSSN images, and uses typical sub-images of the numbers associated with the WWSSN scanned fiches for matching purposes.   The program's purpose is to allow for the automated file name generation when scanning WWSSN fiches.    As the user might have experienced, it is tedious work to name each 16 character file name by hand.

To use, run the file "RunEm.m" and make sure that all of the scripts that are called by this .m file are in the current directory.


Accuracy has been observed to be 90% and better.   Poor image quality often is the main culprit in a failed analysis.   Significant image rotation might also play a role. 

Other code using the bar-code number equivalents (the bar codes above the number in a WWSSN fiche) is not included in her owing to incompleteness.  However, it was used somewhat successfully to create a second metric for reading the seismogram number.   If the two methods agreed, the user could be relatively confident that the outputted number was correct.  


This software is freely available for use and distribution.  No claims are made as to its accuracy.   Retriever Technology assumes no liability for its use.  