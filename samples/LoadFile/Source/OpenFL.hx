package;

import openfl.display.Sprite;

/**
 * Test the haxe-multiloader library in OpenFL
 */
class Main extends Sprite
{
  var test:LoadFile;

  // Run some tests
	public function new()
  {
		super ();

		test = new LoadFile();
	}
}