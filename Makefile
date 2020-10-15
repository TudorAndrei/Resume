git: clean
	git add .
	git commit -m "backup the files"
	git push

clean:
	rm resume.pdf
	rm resume.aux
	rm resume.log

build: clean
	pdflatex resume.tex
	zathura resume.pdf
