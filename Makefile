
Imagemagick-logo.png:
	wget https://upload.wikimedia.org/wikipedia/commons/0/0d/Imagemagick-logo.png

render: example-img.png

all: render

clean:
	rm *.snm
	rm *.nav
	rm *.log
	rm *.toc
	rm *.vrb
