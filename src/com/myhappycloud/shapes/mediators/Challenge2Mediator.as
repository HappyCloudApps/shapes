package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.views.Challenge2View;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class Challenge2Mediator extends Mediator
	{
		[Inject]
		public var view : Challenge2View;

		override public function onRegister() : void
		{
			view.init();
		}

	}
}
