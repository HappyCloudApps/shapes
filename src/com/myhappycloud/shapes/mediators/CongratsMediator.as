package com.myhappycloud.shapes.mediators
{
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
		}

	}
}