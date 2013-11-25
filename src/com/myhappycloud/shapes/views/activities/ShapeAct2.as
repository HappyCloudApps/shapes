package com.myhappycloud.shapes.views.activities
{
	import flash.display.MovieClip;
	/**
	 * @author Eder
	 */
	public class ShapeAct2 extends MovieClip
	{
		public var velX : Number;
		public var velY : Number;
		private var mc : MovieClip;
		private var _id : int;

		public function ShapeAct2(mc : MovieClip)
		{
			this.mc = mc;
			addChild(mc);
		}


		public function get id() : int
		{
			return _id;
		}

		public function set id(id : int) : void
		{
			_id = id;
			mc.gotoAndStop(id);
		}

		public function setOnKillPosition() : void
		{
			mc.x-=mc.width*.5;
			mc.y-=mc.height*.5;
			x+=mc.width*.5;
			y+=mc.height*.5;
		}
		
	}
}
