# haxe-file-load
Simple Resource Loader in Haxe with minimal dependency supporting JS / SWF / OpenFL.

*Require Haxe 3.4+*

Based originally on this [gist](https://gist.github.com/cambiata/471575a42676b27719e3)

The idea of this library is to have simple classes that can load Bytes (locally or externaly) without any dependency on JS or SWF while still supporting OpenFL.

Also support String / Json.

JS stuff is mainly ripped from [lime](https://github.com/openfl/lime/).

This was primarily created for [notessimo-player](https://github.com/starburst997/notessimo-player) as a way to distribute a small standalone JS file but also to be used as a haxe library in OpenFL project.

Tested on JS / SWF and OpenFL

Example
```haxe
var urls = ["xxxxx", "yyyyy", "zzzzz"];
var files = new Array<BytesLoaderParams>();

var n = 0;
for ( url in urls )
{
  // Single file events
  var i = n++;
  files.push(
  {
    url: url,
    complete: function(data)
    {
      // Complete is always called, even on errors
      var hasData = data != null;
      trace("TEST", i, "Has Bytes", hasData);

      if ( hasData )
      {
        trace("TEST", i, "Bytes:", data.length, data);
      }
    }, progress: function(percent)
    {
      trace("TEST", i, "Progress:", percent);
    }, error: function(error)
    {
      trace("TEST", i, "Error:", error);
    }
  });
}

// Load all files
FileLoad.multiBytes(files,
{
  complete: function(hasError)
  {
    trace("Final Complete:", hasError);

    bytesLoaders = null;
  }, progress: function(percent)
  {
    trace("Final Progress:", percent);
  }, error: function(error)
  {
    trace("Final Error:", error);
  }
});
```