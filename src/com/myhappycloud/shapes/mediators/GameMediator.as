package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.GameView;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class GameMediator extends Mediator
	{
		[Inject]
		public var view : GameView;
		
		override public function onRegister() : void
		{
			view.init();
			
			eventMap.mapListener(view, ViewEvent.SET_MENU_SCREEN, dispatch, ViewEvent);
			
			eventMap.mapListener(view, ViewEvent.SET_CHALLENGE_1, dispatch, ViewEvent);
			eventMap.mapListener(view, ViewEvent.SET_CHALLENGE_2, dispatch, ViewEvent);
			eventMap.mapListener(view, ViewEvent.SET_CHALLENGE_3, dispatch, ViewEvent);
		}

	}
}