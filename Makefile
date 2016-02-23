
Imagemagick-logo.png:
	wget https://upload.wikimedia.org/wikipedia/commons/0/0d/Imagemagick-logo.png

cc.large.png:
	wget http://mirrors.creativecommons.org/presskit/icons/cc.large.png

render: Imagemagick-logo.png cc.large.png

all: render

clean:
	rm *.snm
	rm *.nav
	rm *.log
	rm *.toc
	rm *.vrb
