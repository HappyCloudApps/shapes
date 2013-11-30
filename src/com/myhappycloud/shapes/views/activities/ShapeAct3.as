package com.myhappycloud.shapes.views.activities
{
	import org.osflash.signals.Signal;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Ease;
	import flash.geom.Point;
	import com.greensock.TweenLite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;

	/**
	 * @author Eder
	 */
	public class ShapeAct3
	{
		private var _id : uint;
		private var _slot : uint;
		private var shadow : MovieClip;
		private var shape : MovieClip;
		private var shadowXY : Point;
		private var shapeWidth : Number;
		private var shapeHeight : Number;
		private var _dropSignal : Signal;
		private var initialPos : Point;

		public function ShapeAct3(shape : MovieClip, id : uint, slot : uint)
		{
			this.shape = shape;
			this._slot = slot;
			this._id = id;
			
			_dropSignal = new Signal(ShapeAct3);
			centerShape();
			initialPos = new Point(shape.x, shape.y);
			
			shadow = MovieClip(shape.getChildByName("shadow_mc"));
			shadowXY = new Point(shadow.x, shadow.y);
			shape.scaleX = shape.scaleY = .95;
			
			shadow.cacheAsBitmap = true;

			shape.addEventListener(MouseEvent.MOUSE_DOWN, onDown, false, 0, true);
		}

		private function centerShape() : void
		{
			shapeWidth=	shape.getChildAt(0).width;
			shapeHeight=	shape.getChildAt(0).height;
			for (var i : int = 0; i < shape.numChildren; i++) 
			{
				shape.getChildAt(i).x -=shapeWidth*.5;
				shape.getChildAt(i).y -=shapeHeight*.5;
			}
			
			shape.x+=shapeWidth*.5;
			shape.y+=shapeHeight*.5;
		}

		private function onDown(e : MouseEvent) : void
		{
			trace("ShapeAct3.onDown(e)");
			shape.startDrag();
			TweenLite.to(shape, .3, {scaleX:1, scaleY:1, ease:Bounce.easeOut});
			TweenLite.to(shadow, .3, {x:shadowXY.x+15, y:shadowXY.y+15, width:shapeWidth-10, height:shapeHeight-10});
			
			shape.removeEventListener(MouseEvent.MOUSE_DOWN, onDown);
			shape.stage.addEventListener(Event.MOUSE_LEAVE, onLeave, false, 0, true);
			shape.stage.addEventListener(MouseEvent.MOUSE_UP, onUp, false, 0, true);
		}

		private function onLeave(event : Event) : void
		{
			trace("ShapeAct3.onLeave(event)");
			stopDragging();
		}

		private function onUp(e : MouseEvent) : void
		{
			trace("ShapeAct3.onUp(e)");			
			stopDragging();
		}

		private function stopDragging() : void
		{
			shape.stopDrag();
			_dropSignal.dispatch(this);
			
		}

		public function get dropSignal() : Signal
		{
			return _dropSignal;
		}

		public function getPosition() : Point
		{
			return new Point(shape.x - shapeWidth * .5+shape.parent.x, shape.y - shapeHeight * .5+shape.parent.y);
		}

		public function get slot() : uint
		{
			return _slot;
		}

		public function lockOn(position : Point) : void
		{
			TweenLite.to(shape, .3, {x:position.x-shape.parent.x+shapeWidth*.5, y:position.y-shape.parent.y+shapeHeight*.5});
			TweenLite.to(shadow, .3, {x:shadowXY.x, y:shadowXY.y, scaleX:1, scaleY:1});
			shape.stage.removeEventListener(Event.MOUSE_LEAVE, onLeave);
			shape.stage.removeEventListener(MouseEvent.MOUSE_UP, onUp);
		}

		public function returnToPosition() : void
		{
			var dist:Number = Point.distance(initialPos, new Point(shape.x, shape.y));
			
			TweenLite.to(shape, dist*.001, {scaleX:.95, scaleY:.95, x:initialPos.x, y:initialPos.y});
			TweenLite.to(shadow, dist*.001, {x:shadowXY.x, y:shadowXY.y, scaleX:1, scaleY:1, onComplete:enableDragging});
		}

		private function enableDragging() : void
		{
			shape.addEventListener(MouseEvent.MOUSE_DOWN, onDown, false, 0, true);
			shape.stage.removeEventListener(Event.MOUSE_LEAVE, onLeave);
			shape.stage.removeEventListener(MouseEvent.MOUSE_UP, onUp);
		}
	}
}
