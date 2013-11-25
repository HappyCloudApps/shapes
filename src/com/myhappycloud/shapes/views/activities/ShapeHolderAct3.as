package com.myhappycloud.shapes.views.activities
{
	import flash.geom.Point;
	import flash.display.MovieClip;
	/**
	 * @author Eder
	 */
	public class ShapeHolderAct3
	{
		private var _shape : MovieClip;
		private var _id : uint;
		private var _slot : uint;

		public function ShapeHolderAct3(shape : MovieClip, id : uint, slot : uint)
		{
			this._slot = slot;
			this._id = id;
			this._shape = shape;
		}

		public function get slot() : uint
		{
			return _slot;
		}

		public function getPosition() : Point
		{
			return new Point(_shape.x+_shape.parent.x, _shape.y+_shape.parent.y);
		}
	}
}
