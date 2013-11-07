package com.myhappycloud
{
	import com.myhappycloud.shapes.ShapesContext;
	import flash.display.Sprite;

	public class ShapesApp extends Sprite
	{
		private var context : ShapesContext;
		public function ShapesApp()
		{
			trace("Shapes.Shapes()");
			context = new ShapesContext(this);
		}
	}
}
