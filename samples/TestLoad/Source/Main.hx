package;

/**
 * Class used to Test / Compile haxe-file-load library
 *
 * Install https://github.com/tapio/live-server and start from html5 folder
 * Simply issue "live-server" inside the html5 folder and build (release for faster build)
 * Server will reload page automatically when JS is compiled
 */
class Main
{
  var test:TestLoad;

  public function new()
  {
    test = new TestLoad();
  }

  static function main()
  {
    new Main();
  }
}