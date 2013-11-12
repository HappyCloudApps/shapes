package com.myhappycloud.shapes.views
{
	import shapes.Reto1;

	import com.myhappycloud.shapes.events.ViewEvent;

	import flash.display.Sprite;
	import flash.utils.setTimeout;

	/**
	 * @author Eder
	 */
	public class SplashView extends Sprite
	{
		private var _mc : Reto1;

		public function SplashView()
		{
			trace("SplashView.SplashView()");
			_mc = new Reto1();
			addChild(_mc);
			_mc.kamy_mc
			//setTimeout(close, 2000);
		}

		private function close() : void
		{
			dispatchEvent(new ViewEvent(ViewEvent.SET_USERSCREEN));
		}
	}
}
