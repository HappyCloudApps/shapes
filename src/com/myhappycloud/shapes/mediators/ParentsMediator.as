package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.ParentsView;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class ParentsMediator extends Mediator
	{
		[Inject]
		public var view : ParentsView;
		
		override public function onRegister() : void
		{
			view.init();
			
			eventMap.mapListener(view, ViewEvent.SET_ADJUSTMENTS_SCREEN, dispatch, ViewEvent);
			eventMap.mapListener(view, ViewEvent.SET_MESSAGE_PARENTS, dispatch, ViewEvent);
			eventMap.mapListener(view, ViewEvent.SET_TIPS_SCREEN, dispatch, ViewEvent);
			eventMap.mapListener(view, ViewEvent.SET_STATS_SCREEN, dispatch, ViewEvent);
			
			eventMap.mapListener(view, ViewEvent.RETURN_TO_LAST_SCREEN, dispatch, ViewEvent);
		}

	}
}