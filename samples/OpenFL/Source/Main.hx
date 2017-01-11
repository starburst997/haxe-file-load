package;

import openfl.display.Sprite;
import bytesloader.BytesLoader;

// Tests
enum Tests
{
  LoadURL_Local;
  LoadURL_LocalBad;
}

/**
 * Test the haxe-bytes-loader library in OpenFL
 */
class Main extends Sprite
{
  // List of files
  public static inline var PATH:String = "./assets/notes/";
  public static inline var TEST1:String = PATH + "test1.note";
  public static inline var TEST2:String = PATH + "test1.notezz";

  // Keep current loader
  var loader:BytesLoader = null;

  // Run some tests
	public function new()
  {
		super ();
		
		trace("Load File Launch");

    var test = LoadURL_Local;

    switch (test)
    {
      case LoadURL_Local: loadURL( TEST1 );
      case LoadURL_LocalBad: loadURL( TEST2 );
    }
	}

  // Simply load a URL and do nothing else
  function loadURL( url:String )
  {
    loader = BytesLoader.load(url,
    {
      complete: function(data)
      {
        // Complete is always called, even on errors
        var hasData = data != null;
        trace("Has Data", hasData);

        if ( hasData )
        {
          trace("Data:", data.length, data);
        }

        loader = null;
      },
      progress: function(percent)
      {
        trace("Progress", percent);
      },
      error: function(error)
      {
        trace("Error", error);
      }
    });
  }
}