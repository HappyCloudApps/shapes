package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import flash.events.MouseEvent;
	import com.myhappycloud.utils.Screen;
	import assets.shapes.ParentsScreen;
	import flash.display.Sprite;
	/**
	 * @author Eder
	 */
	public class ParentsView extends Screen
	{
		private var mc : ParentsScreen;
		public function init() : void
		{
			mc = new ParentsScreen();
			addChild(mc);
			onClick(mc.btn_adjust, clickAdjust);
			onClick(mc.btn_more, clickMore);
			onClick(mc.btn_msgParent, clickMsg);
			onClick(mc.btn_stats, clickStats);
			onClick(mc.btn_tips, clickTips);
			
			onClick(mc.back_btn, goBack);
		}

		private function goBack(e:MouseEvent) : void
		{
			trace("ParentsView.goBack(e)");
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}

		private function clickAdjust(e:MouseEvent) : void
		{
			trace("ParentsView.clickAdjust(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_ADJUSTMENTS_SCREEN));
		}

		private function clickMore(e:MouseEvent) : void
		{
			trace("ParentsView.clickMore(e)");
			//TODO open more apps link			
		}

		private function clickMsg(e:MouseEvent) : void
		{
			trace("ParentsView.clickMsg(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_MESSAGE_PARENTS));
		}

		private function clickStats(e:MouseEvent) : void
		{
			trace("ParentsView.clickStats(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_STATS_SCREEN));
			
		}

		private function clickTips(e:MouseEvent) : void
		{
			trace("ParentsView.clickTips(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_TIPS_SCREEN));
			
		}
	}
}
