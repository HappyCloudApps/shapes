package com.myhappycloud.shapes.mediators
{
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
		}

	}
}