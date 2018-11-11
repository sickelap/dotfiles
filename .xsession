# Big boy needs different scale settings
if [ "`hostname -s`" == "aw17r4" ]; then
	export GDK_DPI_SCALE=1.5
fi

xset +fp /usr/local/share/fonts/terminus
xset +fp /usr/local/share/fonts/ghostscript
xv -root -rmode 5 -quit ~/.bg/unix.jpg 2>/dev/null
i3
