package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import flash.events.MouseEvent;
	import assets.shapes.TipsScreen;
	import com.myhappycloud.utils.Screen;
	/**
	 * @author Eder
	 */
	public class TipsView extends Screen
	{
		private var mc : TipsScreen;
		public function init() : void
		{
			mc = new TipsScreen();
			addChild(mc);
			
			onClick(mc.back_btn, goBack);
		}

		private function goBack(e:MouseEvent) : void
		{
			trace("TipsView.goBack(e)");
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}
	}
}
