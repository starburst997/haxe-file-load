package;

import openfl.display.Sprite;

/**
 * Test the file-load library in OpenFL
 */
class MainOpenFL extends Sprite
{
  var test:TestLoad;

  // Run some tests
	public function new()
  {
		super ();

		test = new TestLoad();
	}
}