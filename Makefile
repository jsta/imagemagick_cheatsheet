images: im.png im-border.png im-trim.png im-sepia.png im-animate.gif im-montage.png cc.large.png

im.png:
	wget https://upload.wikimedia.org/wikipedia/commons/0/0d/Imagemagick-logo.png
	mv Imagemagick-logo.png im.png
	convert im.png -background white -alpha remove im.png

im-border.png:
	convert im.png -bordercolor black -border 5x5 im-border.png

im-trim.png:
	convert im.png -trim im-trim.png
	
im-sepia.png:
	convert im.png -sepia-tone 65% im-sepia.png
	
im-animate.gif:
	convert -delay 10 -morph 10 im.png im-sepia.png im-animate.gif
	gifsicle --unoptimize im-animate.gif | convert - im-animate-%d.png

im-montage.png:
	montage im.png im-sepia.png -geometry +2+2 -tile 2x im-montage.png

cc.large.png:
	wget http://mirrors.creativecommons.org/presskit/icons/cc.large.png

render: images
	xelatex imagemagick_cheetsheet.tex

all: render
	@echo "cheatsheat pdf built"

clean:
	rm *.snm
	rm *.nav
	rm *.log
	rm *.toc
	rm *.png
	rm *.out
	rm *.aux
	rm *.gif
	
