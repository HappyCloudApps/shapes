package com.myhappycloud.shapes.views
{
	import assets.SplashScreen;

	import com.myhappycloud.shapes.events.ViewEvent;

	import flash.display.Sprite;
	import flash.utils.setTimeout;

	/**
	 * @author Eder
	 */
	public class SplashView extends Sprite
	{
		private var _mc : SplashScreen;

		public function SplashView()
		{
			trace("SplashView.SplashView()");
			_mc = new SplashScreen();
			addChild(_mc);
			_mc.title_txt.text = "SplashScreen - Hello world w/Robotlegs";
			
			setTimeout(close, 2000);
		}

		private function close() : void
		{
			dispatchEvent(new ViewEvent(ViewEvent.SET_USERSCREEN));
		}
	}
}
