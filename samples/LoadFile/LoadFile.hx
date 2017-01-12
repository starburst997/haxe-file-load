package;

import haxe.io.Bytes;
import bytesloader.Loader;

// Tests
enum Tests
{
  LoadBytesURL_Local;
  LoadBytesURL_LocalBad;
  LoadStringURL_Local;
  LoadStringURL_LocalBad;
  LoadJsonURL_Local;
  LoadJsonURL_Local2;
  LoadJsonURL_LocalBad;
}

/**
 * Class used to Test / Compile haxe-bytes-loader library
 *
 * Install https://github.com/tapio/live-server and start from html5 folder
 * Simply issue "live-server" inside the html5 folder and build (release for faster build)
 * Server will reload page automatically when JS is compiled
 */
class LoadFile
{
  // List of files
  public static inline var PATH:String = "./notes/";
  public static inline var TEST1:String = PATH + "test1.note";
  public static inline var TEST2:String = PATH + "test1.notezz";
  public static inline var TEST3:String = PATH + "test2.json";
  public static inline var TEST4:String = PATH + "test2.jsonzz";

  // Keep current loader
  var bytesLoader:BytesLoader = null;
  var jsonLoader:JsonLoader = null;
  var stringLoader:StringLoader = null;

  // Run some tests
  public function new()
  {
    trace("Load File Launch!");

    var test = LoadBytesURL_Local;

    switch (test)
    {
      case LoadBytesURL_Local: loadBytesURL( TEST1 );
      case LoadBytesURL_LocalBad: loadBytesURL( TEST2 );
      case LoadStringURL_Local: loadStringURL( TEST3 );
      case LoadStringURL_LocalBad: loadStringURL( TEST4 );
      case LoadJsonURL_Local: loadJsonURL( TEST3 );
      case LoadJsonURL_Local2: loadJsonURL( TEST1 );
      case LoadJsonURL_LocalBad: loadJsonURL( TEST4 );
    }
  }

  // Simply load a String URL and do nothing else
  function loadStringURL( url:String )
  {
    stringLoader = new StringLoader(url,
    {
      complete: function(data)
      {
        // Complete is always called, even on errors
        var hasData = data != null;
        trace("Has String", hasData);

        if ( hasData )
        {
          trace("String:", data.length, data);
        }

        stringLoader = null;
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

  // Simply load a JSON URL and do nothing else
  function loadJsonURL( url:String )
  {
    jsonLoader = new JsonLoader(url,
    {
      complete: function(data)
      {
        // Complete is always called, even on errors
        var hasData = data != null;
        trace("Has JSON", hasData);

        if ( hasData )
        {
          trace("JSON:", data.name, data);
        }

        jsonLoader = null;
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

  // Simply load a bytes URL and do nothing else
  function loadBytesURL( url:String )
  {
    bytesLoader = new BytesLoader(url,
    {
      complete: function(data)
      {
        // Complete is always called, even on errors
        var hasData = data != null;
        trace("Has Bytes", hasData);

        if ( hasData )
        {
          trace("Bytes:", data.length, data);
        }

        bytesLoader = null;
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

  // Entry point
  static function main()
  {
    new LoadFile();
  }
}