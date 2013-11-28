package com.myhappycloud.shapes.views
{
	import assets.shapes.SplashScreen;
	import com.myhappycloud.shapes.events.ViewEvent;

	import flash.display.Sprite;
	import flash.utils.setTimeout;

	/**
	 * @author Eder
	 */
	public class SplashView extends Sprite
	{
		private var _mc : Sprite;

		public function SplashView()
		{
			trace("SplashView.SplashView()");
			_mc = new SplashScreen();
			addChild(_mc);
			//_mc.title_txt.text = "SplashScreen - Hello world w/Robotlegs";
			
			//TODO add some more time to timeout
			setTimeout(close, 10);
		}

		private function close() : void
		{
			//TODO return to normal this line
			dispatchEvent(new ViewEvent(ViewEvent.SET_USERSCREEN));
//			dispatchEvent(new ViewEvent(ViewEvent.SET_CHALLENGE_3));
		}
	}
}
