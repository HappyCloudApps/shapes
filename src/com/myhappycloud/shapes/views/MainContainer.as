package com.myhappycloud.shapes.views
{
	import flash.display.Sprite;

	/**
	 * @author Eder
	 */
	public class MainContainer extends Sprite
	{
		public function MainContainer()
		{
			trace("MainContainer.MainContainer()");
		}

		public function init() : void
		{
			trace("MainContainer.init()");
		}

		public function setSplashScreen() : void
		{
			clearViews();
			addChild(new SplashView());
		}

		public function setUserScreen() : void
		{
			clearViews();
			addChild(new UserView());
		}
		
		private function clearViews() : void
		{
			while (numChildren > 0)
				removeChildAt(0);
		}

		public function setChallenge(i : int) : void
		{
			clearViews();
			switch(i){
				case 1:
					addChild(new Challenge1View());
					break;
				case 2:
					addChild(new Challenge2View());
					break;
					//TODO do case 3
				default:
			}
		}

	}
}
