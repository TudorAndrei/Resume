git: clean
	git add .
	git commit -m "backup the files"
	git push

clean:
	echo "clean"

all: clean
	pdflatex resume.tex
	zathura resume.pdf
