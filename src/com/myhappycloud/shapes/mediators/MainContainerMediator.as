package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.MainContainer;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class MainContainerMediator extends Mediator
	{
		[Inject]
		public var view : MainContainer;

		override public function onRegister() : void
		{
			super.onRegister();
			trace("MainMediator.onRegister()");
			view.init();
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_SPLASH, setSplashScreen, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_USERSCREEN, setUserScreen, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_VIDEOS_SCREEN, setVideosScreen, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_PARENTS_SCREEN, setParentsScreen, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_MENU_SCREEN, setMenuScreen, ViewEvent);
			
			//PARENTS MENU
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_ADJUSTMENTS_SCREEN, setAdjustmentsScreen, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_STATS_SCREEN, setStatsScreen, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_TIPS_SCREEN, setTipsScreen, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_MESSAGE_PARENTS, setMsgScreen, ViewEvent);


			eventMap.mapListener(eventDispatcher, ViewEvent.SET_GAME_SCREEN, setGame, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_CHALLENGE_1, setChallenge1, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_CHALLENGE_2, setChallenge2, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_CHALLENGE_3, setChallenge3, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_CONGRATS_SCREEN, setCongrats, ViewEvent);

			eventMap.mapListener(eventDispatcher, ViewEvent.RETURN_TO_LAST_SCREEN, goBack, ViewEvent);
		}

		private function setStatsScreen(e:ViewEvent) : void
		{
			view.setStatsScreen();
		}

		private function setTipsScreen(e:ViewEvent) : void
		{			
			view.setTipsScreen();
		}

		private function setMsgScreen(e:ViewEvent) : void
		{
			view.setMsgScreen();
		}

		private function setMenuScreen(e:ViewEvent) : void
		{
			view.setMenuScreen();
		}

		private function setAdjustmentsScreen(e:ViewEvent) : void
		{
			view.setAdjustmentsScreen();			
		}

		private function setGame(e:ViewEvent) : void
		{
			view.setGame();
		}

		private function setParentsScreen(e:ViewEvent) : void
		{
			view.setParentsScreen();
		}

		private function setVideosScreen(e:ViewEvent) : void
		{
			view.setVideosScreen();
		}

		private function setCongrats(e:ViewEvent) : void
		{
			view.setCongrats();
		}

		private function goBack(e:ViewEvent) : void
		{
			view.goBack();
		}

		private function setChallenge1(e:ViewEvent) : void
		{
			view.setChallenge(1);
		}
		
		private function setChallenge2(e:ViewEvent) : void
		{
			view.setChallenge(2);
		}
		
		private function setChallenge3(e:ViewEvent) : void
		{
			view.setChallenge(3);
		}

		private function setUserScreen(e:ViewEvent) : void
		{
			view.setUserScreen();
		}

		private function setSplashScreen(e:ViewEvent) : void
		{
			view.setSplashScreen();
		}

	}
}
