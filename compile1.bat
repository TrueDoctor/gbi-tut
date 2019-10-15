@echo on
SET Number=01
echo Recompiling slide %Number%...
FOR %%f in (*.tex) DO (
	IF "%%f" == "slide-tut%Number%.tex" (
        REM PAUSE
		echo Generating live beamer slides: %%f
		pdflatex "\input{%%f}"
		pdflatex "\input{%%f}"
		MOVE %%~nf.pdf slides\liveslide_%%~nf.pdf
		echo Generating printing beamer slides: %%f
		pdflatex "\def\compiletype{print} \input{%%f}"
		pdflatex "\def\compiletype{print} \input{%%f}"
		MOVE %%~nf.pdf slides\printslide_%%~nf.pdf
    )
)

cleanup.bat
pause