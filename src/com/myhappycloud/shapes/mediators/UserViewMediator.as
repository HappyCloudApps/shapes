package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.UserView;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class UserViewMediator extends Mediator
	{
		[Inject]
		public var view : UserView;
		
		override public function onRegister() : void
		{
			view.init();
			
			eventMap.mapListener(view, ViewEvent.SET_PARENTS_SCREEN, dispatch, ViewEvent);
			eventMap.mapListener(view, ViewEvent.SET_MENU_SCREEN, dispatch, ViewEvent);
		}

	}
}
