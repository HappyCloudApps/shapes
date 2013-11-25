package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import flash.events.MouseEvent;
	import com.myhappycloud.utils.Screen;
	import assets.shapes.AdjustmentsScreen;
	import flash.display.Sprite;
	/**
	 * @author Eder
	 */
	public class AdjustmentsView extends Screen
	{
		private var mc : AdjustmentsScreen;
		public function init() : void
		{
			mc = new AdjustmentsScreen();
			addChild(mc);
			
			onClick(mc.back_btn, goBack);
		}

		private function goBack(e:MouseEvent) : void
		{
			trace("AdjustmentsView.goBack(e)");
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}
	}
}
