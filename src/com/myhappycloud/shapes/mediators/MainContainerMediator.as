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
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_CHALLENGE_1, setChallenge1, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_CHALLENGE_2, setChallenge2, ViewEvent);
			eventMap.mapListener(eventDispatcher, ViewEvent.SET_CHALLENGE_3, setChallenge3, ViewEvent);
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
