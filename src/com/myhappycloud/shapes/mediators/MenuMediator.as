package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.views.MenuView;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class MenuMediator extends Mediator
	{
		[Inject]
		public var view : MenuView;

		override public function onRegister() : void
		{
			view.init();
		}

	}
}
