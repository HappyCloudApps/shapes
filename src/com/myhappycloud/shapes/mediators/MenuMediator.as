package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.MenuView;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class MenuMediator extends Mediator
	{
		[Inject]
		public var view : MenuView;

		override public function onRegister() : void
		{
			view.init();
			eventMap.mapListener(view, ViewEvent.SET_GAME_SCREEN, dispatch, ViewEvent);
			eventMap.mapListener(view, ViewEvent.SET_PARENTS_SCREEN, dispatch, ViewEvent);
			eventMap.mapListener(view, ViewEvent.SET_USERSCREEN, dispatch, ViewEvent);
			eventMap.mapListener(view, ViewEvent.SET_VIDEOS_SCREEN, dispatch, ViewEvent);
		}

	}
}
