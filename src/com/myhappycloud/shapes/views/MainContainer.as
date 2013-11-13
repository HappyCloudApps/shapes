package com.myhappycloud.shapes.views
{
	import flash.display.Sprite;

	/**
	 * @author Eder
	 */
	public class MainContainer extends Sprite
	{
		private static const MAX_HISTORY_LENGTH : uint = 10;

		private const SPLASH_SCREEN : int = 1;
		private const USER_SCREEN : int = 2;
		private const MENU_SCREEN : int = 3;
		private const VIDEOS_SCREEN : int = 4;
		private const PARENTS_SCREEN : int = 5;
		private const ADJUSTMENTS_SCREEN : int = 6;
		private const TOY : int = 7;
		private const CHALLENGE_1 : int = 8;
		private const CHALLENGE_2 : int = 9;
		private const CHALLENGE_3 : int = 10;
		private const CONGRATS_SCREEN : int = 11;

		private var _screenHistory : Array;

		public function MainContainer()
		{
			trace("MainContainer.MainContainer()");
		}

		public function init() : void
		{
			trace("MainContainer.init()");
			_screenHistory = [];
		}

		public function setSplashScreen() : void
		{
			trace("MainContainer.setSplashScreen()");
			clearViews();
			addChild(new SplashView());
			addScreenHistory(SPLASH_SCREEN);
		}

		public function setUserScreen() : void
		{
			trace("MainContainer.setUserScreen()");
			clearViews();
			addChild(new UserView());
			addScreenHistory(USER_SCREEN);
		}

		public function setChallenge(id : int) : void
		{
			trace("MainContainer.setChallenge(" + id + ")");
			clearViews();
			switch(id)
			{
				case 1:
					addChild(new Challenge1View());
					addScreenHistory(CHALLENGE_1);
					break;
				case 2:
					addChild(new Challenge2View());
					addScreenHistory(CHALLENGE_2);
					break;
				case 2:
					addChild(new Challenge3View());
					addScreenHistory(CHALLENGE_3);
					break;
				default:
					trace("MainContainer.setChallenge(i) - challenge not defined: " + id);
			}
		}

		public function setCongrats() : void
		{
			trace("MainContainer.setCongrats()");
			clearViews();
			addScreenHistory(CONGRATS_SCREEN);
			addChild(new CongratsView());
		}

		public function goBack() : void
		{
			var backScreen : int = getLastScreen();
			trace("MainContainer.goBack(" + backScreen + ")");
			clearViews();
			switch(backScreen)
			{
				case SPLASH_SCREEN:
					setSplashScreen();
					break;
				case USER_SCREEN:
					setUserScreen();
					break;
				case MENU_SCREEN:
					setMenuScreen();
					break;
				case ADJUSTMENTS_SCREEN:
					setAdjustmentsScreen();
					break;
				case VIDEOS_SCREEN:
					setVideosScreen();
					break;
				case PARENTS_SCREEN:
					setParentsScreen();
					break;
				case TOY:
					setGame();
					break;
				case CHALLENGE_1:
					setChallenge(1);
					break;
				case CHALLENGE_2:
					setChallenge(2);
					break;
				case CHALLENGE_3:
					setChallenge(3);
					break;
				case CONGRATS_SCREEN:
					setCongrats();
					break;
				default:
					trace("MainContainer.goBack() - undefined case: " + backScreen);
			}
		}

		private function clearViews() : void
		{
			trace("MainContainer.clearViews()");
			while (numChildren > 0)
				removeChildAt(0);
		}

		private function getLastScreen() : int
		{
			_screenHistory.pop();
			// pops current screen
			return _screenHistory.pop();
		}

		private function addScreenHistory(screen : int) : void
		{
			_screenHistory.push(screen);
			while (_screenHistory.length > MAX_HISTORY_LENGTH)
			{
				_screenHistory.shift();
			}
		}

		public function setVideosScreen() : void
		{
			clearViews();
			addScreenHistory(VIDEOS_SCREEN);
			addChild(new VideosView());
		}

		public function setParentsScreen() : void
		{
			clearViews();
			addScreenHistory(PARENTS_SCREEN);
			addChild(new ParentsView());
		}

		public function setGame() : void
		{
			clearViews();
			addScreenHistory(TOY);
			addChild(new ToyView());
		}

		public function setMenuScreen() : void
		{
			clearViews();
			addScreenHistory(MENU_SCREEN);
			addChild(new MenuView());
		}

		public function setAdjustmentsScreen() : void
		{
			clearViews();
			addScreenHistory(ADJUSTMENTS_SCREEN);
			addChild(new AdjustmentsView());
		}
	}
}
