package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import flash.events.MouseEvent;
	import assets.shapes.StatsScreen;
	import com.myhappycloud.utils.Screen;
	/**
	 * @author Eder
	 */
	public class StatsView extends Screen
	{
		private var mc : StatsScreen;
		public function init() : void
		{
			mc = new StatsScreen();
			addChild(mc);
			
			onClick(mc.back_btn, goBack);
		}

		private function goBack(e:MouseEvent) : void
		{
			trace("StatsView.goBack(e)");
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}
	}
}
