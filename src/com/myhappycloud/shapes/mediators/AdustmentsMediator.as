package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.views.AdjustmentsView;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class AdustmentsMediator extends Mediator
	{
		[Inject]
		public var view : AdjustmentsView;
		
		override public function onRegister() : void
		{
			view.init();
		}

	}
}