package;

import bytesloader.Loaders;
import haxe.io.Bytes;

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
  LoadBytesLoaders_1;
}

/**
 * Class used to Test / Compile haxe-bytes-loader library
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

  // Test loaders
  var bytesLoaders:BytesLoaders = null;

  // Run some tests
  public function new()
  {
    trace("Load File Launch!");

    var test = LoadBytesLoaders_1;

    switch (test)
    {
      case LoadBytesURL_Local: loadBytesURL( TEST1 );
      case LoadBytesURL_LocalBad: loadBytesURL( TEST2 );
      case LoadStringURL_Local: loadStringURL( TEST3 );
      case LoadStringURL_LocalBad: loadStringURL( TEST4 );
      case LoadJsonURL_Local: loadJsonURL( TEST3 );
      case LoadJsonURL_Local2: loadJsonURL( TEST1 );
      case LoadJsonURL_LocalBad: loadJsonURL( TEST4 );
      case LoadBytesLoaders_1: loadBytesLoaders();
    }
  }

  // Bytes Loaders Test
  function loadBytesLoaders()
  {
    bytesLoaders = new BytesLoaders();

    var files = new Array<BytesLoaderParams>();

    // Load Test 1
    files.push(
    {
      url: TEST1,
      complete: function(data)
      {
        // Complete is always called, even on errors
        var hasData = data != null;
        trace("TEST1", "Has Bytes", hasData);

        if ( hasData )
        {
          trace("TEST1", "Bytes:", data.length, data);
        }
      }, progress: function(percent)
      {
        trace("TEST1", "Progress:", percent);
      }, error: function(error)
      {
        trace("TEST1", "Error:", error);
      }
    });

    // Load Test 3
    files.push(
    {
      url: TEST3,
      complete: function(data)
      {
        // Complete is always called, even on errors
        var hasData = data != null;
        trace("TEST3", "Has Bytes", hasData);

        if ( hasData )
        {
          trace("TEST3", "Bytes:", data.length, data);
        }
      }, progress: function(percent)
      {
        trace("TEST3", "Progress:", percent);
      }, error: function(error)
      {
        trace("TEST3", "Error:", error);
      }
    });

    // Load all files
    bytesLoaders.load(files,
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
}