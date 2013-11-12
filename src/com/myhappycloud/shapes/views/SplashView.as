package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.events.ViewEvent;

	import flash.display.Sprite;
	import flash.utils.setTimeout;

	/**
	 * @author Eder
	 */
	public class SplashView extends Sprite
	{
		//TODO add splash screen to assets
		private var _mc : Sprite;

		public function SplashView()
		{
			trace("SplashView.SplashView()");
			_mc = new Sprite();
			addChild(_mc);
			//_mc.title_txt.text = "SplashScreen - Hello world w/Robotlegs";
			
			setTimeout(close, 2000);
		}

		private function close() : void
		{
			dispatchEvent(new ViewEvent(ViewEvent.SET_USERSCREEN));
		}
	}
}
