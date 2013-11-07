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
