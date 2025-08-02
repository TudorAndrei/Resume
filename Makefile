git: clean
	git add .
	git commit -m "backup the files"
	git push

clean:
	rm resume.pdf
	rm resume.aux
	rm resume.log

build: clean
	typst compile main.typ TudorAndrei-Dumitrascu-Resume.pdf

watch:
	typst watch main.typ TudorAndrei-Dumitrascu-Resume.pdf


