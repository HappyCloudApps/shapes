package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import flash.events.MouseEvent;
	import assets.shapes.MsgParentsScreen;
	import com.myhappycloud.utils.Screen;
	/**
	 * @author Eder
	 */
	public class MessageParentsView extends Screen
	{
		private var mc : MsgParentsScreen;
		public function init() : void
		{
			mc = new MsgParentsScreen();
			addChild(mc);
			
			onClick(mc.back_btn, goBack);
		}

		private function goBack(e:MouseEvent) : void
		{
			trace("MessageParentsView.goBack(e)");
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}
	}
}
