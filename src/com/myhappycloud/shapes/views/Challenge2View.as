package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.views.activities.Act2Controller;
	import assets.shapes.Challenge2Screen;

	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.utils.Screen;

	import flash.events.MouseEvent;
	/**
	 * @author Eder
	 */
	public class Challenge2View extends Screen
	{
		private var mc : Challenge2Screen;
		private var act1Controller : Act2Controller;
		public function init() : void
		{
			mc= new Challenge2Screen();
			addChild(mc);
			
			onClick(mc.back_btn, goBack);
			onClick(mc.help_btn, clickHelp);

			act1Controller = new Act2Controller(mc);
			
			act1Controller.startGame();
			act1Controller.gameOverSignal.addOnce(gameOver);
		}

		private function gameOver() : void
		{
			trace("Challenge2View.gameOver()");
			dispatchEvent(new ViewEvent(ViewEvent.SET_CONGRATS_SCREEN));
		}

		private function clickHelp(e:MouseEvent) : void
		{
			trace("Challenge2View.clickHelp(e)");
			openHelp();
		}

		private function openHelp() : void
		{
			trace("Challenge2View.openHelp()");
		}

		private function goBack(e:MouseEvent) : void
		{
			trace("Challenge2View.goBack(e)");
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}
	}
}
