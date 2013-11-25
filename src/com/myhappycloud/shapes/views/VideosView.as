package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import flash.events.MouseEvent;
	import com.myhappycloud.utils.Screen;
	import assets.shapes.VideosScreen;
	/**
	 * @author Eder
	 */
	public class VideosView extends Screen
	{
		private var mc : VideosScreen;
		public function init() : void
		{
			mc = new VideosScreen();
			addChild(mc);
			
			onClick(mc.back_btn, goBack);
		}

		private function goBack(e:MouseEvent) : void
		{
			trace("VideosView.goBack(e)");
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}
	}
}
