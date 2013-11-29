package com.myhappycloud.shapes.views.activities
{
	import com.greensock.TweenLite;
	import org.osflash.signals.Signal;
	import flash.display.MovieClip;

	/**
	 * @author Eder
	 */
	public class ShapeAct1
	{
		private var id : int;
		private var _mc : MovieClip;
		private var previousY : Number = 0;
		private var _removeSignal : Signal;
		
		private var basketHeight : Number = 595;
//		private var basketWidth : Number = 110;
		// private var basketWidth:Number = 120-230;
		private var _checkBasketSignal : Signal;

		public function ShapeAct1(mc : MovieClip, id : int)
		{
			this._mc = mc;
			this.id = id;
			
			_removeSignal = new Signal(ShapeAct1);
			_checkBasketSignal = new Signal(ShapeAct1);

			mc.scaleX = mc.scaleY = 1;
			mc.y = 0;
			mc.rotation=0;
			mc.x = Math.random() * 700 + 250;
		}

		public function get mc() : MovieClip
		{
			return _mc;
		}

		public function moveDown(num : int) : void
		{
			previousY = mc.y;
			mc.y+=num;
			if(mc.y>basketHeight && previousY <basketHeight)
			{
				_checkBasketSignal.dispatch(this);
			}
			else if(mc.y>768+mc.height)
			{
				removeMe();
			}
		}

		private function removeMe() : void
		{
			_removeSignal.dispatch(this);
		}

		public function get removeSignal() : Signal
		{
			return _removeSignal;
		}

		public function destroy() : void
		{
			_removeSignal=null;
			_mc = null;
		}

		public function get checkBasketSignal() : Signal
		{
			return _checkBasketSignal;
		}

		public function animateIn() : void
		{
			var rot:Number = 0;
			if(mc.x<150)
				rot=70;
			if(mc.x>200)
				rot=-70;
			TweenLite.to(mc, .5, {scaleX: .8, scaleY: .8, x:177, y:250, rotation:rot, onComplete:removeMe});
		}
	}
}
