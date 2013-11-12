package com.myhappycloud.shapes.mediators
{
	import com.myhappycloud.shapes.views.UserView;
	import org.robotlegs.mvcs.Mediator;
	/**
	 * @author Eder
	 */
	public class UserViewMediator extends Mediator
	{
		[Inject]
		public var view : UserView;
		
		override public function onRegister() : void
		{
			
		}

	}
}
