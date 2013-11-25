package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.VideosView;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class VideosMediator extends Mediator
	{
		[Inject]
		public var view : VideosView;
		
		override public function onRegister() : void
		{
			view.init();
			eventMap.mapListener(view, ViewEvent.RETURN_TO_LAST_SCREEN, dispatch, ViewEvent);
		}

	}
}
