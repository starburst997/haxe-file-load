# haxe-multiloader
Simple Resource Loader in Haxe with minimal dependency supporting JS / SWF / OpenFL.

Based originally on this [gist](https://gist.github.com/cambiata/471575a42676b27719e3)

The idea of this library is to have simple classes that can load Bytes (locally or externaly) without any dependency on JS or SWF while still supporting OpenFL.

Also support String / Json.

JS stuff is mainly ripped from [lime](https://github.com/openfl/lime/).

This was primarily created for [notessimo-player](https://github.com/starburst997/notessimo-player) as a way to distribute a small standalone JS file but also to be used as a haxe library in OpenFL project.

Tested on JS / SWF and OpenFL