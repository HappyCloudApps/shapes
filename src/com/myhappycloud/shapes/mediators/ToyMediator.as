package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.views.ToyView;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class ToyMediator extends Mediator
	{
		[Inject]
		public var view : ToyView;
		
		override public function onRegister() : void
		{
			view.init();
		}

	}
}