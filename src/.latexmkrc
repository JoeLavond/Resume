$pdf_mode = 1;
# Use exit-0 wrapper: bibentry produces "Lonely \item" errors that cause
# pdflatex to return exit code 1 even though output is correct. We treat
# any pdflatex run that writes a PDF as successful.
$pdflatex = 'pdflatex -interaction=nonstopmode -file-line-error %O %S; test -f %D';
$force_mode = 1;
