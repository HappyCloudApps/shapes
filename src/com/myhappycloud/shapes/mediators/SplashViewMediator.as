package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.SplashView;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Eder
	 */
	public class SplashViewMediator extends Mediator
	{
		[Inject]
		public var view : SplashView;

		override public function onRegister() : void
		{
			eventMap.mapListener(view, ViewEvent.SET_USERSCREEN, dispatch, ViewEvent);
		}
	}
}
