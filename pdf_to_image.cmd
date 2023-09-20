@echo off
setlocal

rem Set the input PDF file and output folder
set "input_pdf=out/lavond-joseph-resume.pdf"  rem Replace with the path to your PDF file
set "output_folder=out"  rem Replace with your desired output folder

rem Create the output folder if it doesn't exist
if not exist "%output_folder%" mkdir "%output_folder%"

rem Convert PDF to PNG images using pdftoppm
pdftoppm -png "%input_pdf%" "%output_folder%\page"

echo PDF converted to PNG images in %output_folder%

endlocal
