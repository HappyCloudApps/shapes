package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.events.ModelEvent;
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.models.IUserData;
	import com.myhappycloud.shapes.views.AdjustmentsView;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author Eder
	 */
	public class AdustmentsMediator extends Mediator
	{
		[Inject]
		public var view : AdjustmentsView;
		[Inject]
		public var model : IUserData;

		override public function onRegister() : void
		{
			view.init();
			view.setLanguage(model.language);
			view.setAudio(model.volumeAmbient, model.volumeFx);
			
			eventMap.mapListener(view, ViewEvent.RETURN_TO_LAST_SCREEN, dispatch, ViewEvent);
			eventMap.mapListener(view, ModelEvent.LANGUAGE_CHANGE, dispatch, ModelEvent);
		}
	}
}