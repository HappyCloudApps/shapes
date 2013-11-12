package com.myhappycloud.shapes.views
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	/**
	 * @author Eder
	 */
	public class UserView extends Sprite
	{
		public function init() : void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
		}

		private function keyPressed(e : KeyboardEvent) : void
		{
			trace("keycode:"+e.keyCode);
		}
		
	}
}
