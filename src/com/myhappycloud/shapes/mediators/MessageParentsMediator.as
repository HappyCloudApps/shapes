package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.MessageParentsView;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class MessageParentsMediator extends Mediator
	{
		[Inject]
		public var view : MessageParentsView;
		
		override public function onRegister() : void
		{
			view.init();
			
			eventMap.mapListener(view, ViewEvent.RETURN_TO_LAST_SCREEN, dispatch, ViewEvent);
		}

	}
}