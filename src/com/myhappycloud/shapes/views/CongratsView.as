package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import assets.shapes.CongratsScreen;

	import com.myhappycloud.utils.Screen;

	import flash.events.MouseEvent;
	/**
	 * @author Eder
	 */
	public class CongratsView extends Screen
	{
		private var mc : CongratsScreen;
		public function init() : void
		{
			mc = new CongratsScreen();
			addChild(mc);
			
			onClick(mc.btn_replay, repeatLevel);
			onClick(mc.btn_next, goGameScreen);
		}

		private function goGameScreen(e:MouseEvent) : void
		{
			trace("CongratsView.goGameScreen(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_GAME_SCREEN));
		}

		private function repeatLevel(e:MouseEvent) : void
		{
			trace("CongratsView.repeatLevel(e)");
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}
	}
}
