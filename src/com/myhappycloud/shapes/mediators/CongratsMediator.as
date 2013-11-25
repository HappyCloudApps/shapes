package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.CongratsView;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class CongratsMediator extends Mediator
	{
		[Inject]
		public var view : CongratsView;
		
		override public function onRegister() : void
		{
			view.init();
			
			eventMap.mapListener(view, ViewEvent.RETURN_TO_LAST_SCREEN, dispatch, ViewEvent);
			eventMap.mapListener(view, ViewEvent.SET_GAME_SCREEN, dispatch, ViewEvent);
		}

	}
}