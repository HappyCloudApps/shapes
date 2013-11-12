package com.myhappycloud.shapes.views
{
	import shapes.Reto1;
	import flash.display.Sprite;
	/**
	 * @author Eder
	 */
	public class Challenge1View extends Sprite
	{
		private var mc : Reto1;
		public function init() : void
		{
			trace("Challenge1View.init()");
			mc = new Reto1();
			addChild(mc);
			
		}
	}
}
