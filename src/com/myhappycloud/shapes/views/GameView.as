package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import flash.events.MouseEvent;

	import assets.shapes.ToyScreen;

	import com.myhappycloud.utils.Screen;

	/**
	 * @author Eder
	 */
	public class GameView extends Screen
	{
		private var mc : ToyScreen;

		public function init() : void
		{
			mc = new ToyScreen();
			addChild(mc);
			
			onClick(mc.menu_challenges.btn_challenge1, goChallenge1);
			onClick(mc.menu_challenges.btn_challenge2, goChallenge2);
			onClick(mc.menu_challenges.btn_challenge3, goChallenge3);
			
			onClick(mc.back_btn, goBack);
		}

		private function goBack(e:MouseEvent) : void
		{
			dispatchEvent(new ViewEvent(ViewEvent.SET_MENU_SCREEN));
		}

		private function goChallenge1(e : MouseEvent) : void
		{
			trace("ToyView.goChallenge1(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_CHALLENGE_1));
		}

		private function goChallenge2(e : MouseEvent) : void
		{
			trace("ToyView.goChallenge2(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_CHALLENGE_2));
		}

		private function goChallenge3(e : MouseEvent) : void
		{
			trace("ToyView.goChallenge3(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_CHALLENGE_3));
		}
	}
}
