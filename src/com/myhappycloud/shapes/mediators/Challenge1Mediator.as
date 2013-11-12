package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.Challenge1View;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class Challenge1Mediator extends Mediator
	{
		[Inject]
		public var view : Challenge1View;
		
		
		override public function onRegister() : void
		{
			view.init();
			eventMap.mapListener(view, ViewEvent.RETURN_TO_LAST_SCREEN, dispatch, ViewEvent);
			eventMap.mapListener(view, ViewEvent.SET_CONGRATS_SCREEN, dispatch, ViewEvent);
		}
	}
}
