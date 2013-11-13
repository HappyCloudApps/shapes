package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.views.Challenge3View;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class Challenge3Mediator extends Mediator
	{
		[Inject]
		public var view : Challenge3View;
		
		override public function onRegister() : void
		{
			view.init();
		}

	}
}