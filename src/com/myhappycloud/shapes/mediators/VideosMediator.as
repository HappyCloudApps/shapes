package com.myhappycloud.shapes.mediators
{
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
		}

	}
}
