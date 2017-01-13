package;

import openfl.display.Sprite;

/**
 * Test the multiloader library in OpenFL
 */
class MainOpenFL extends Sprite
{
  var test:LoadFile;

  // Run some tests
	public function new()
  {
		super ();

		test = new LoadFile();
	}
}