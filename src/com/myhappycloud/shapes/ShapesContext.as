package com.myhappycloud.shapes
{
	import com.myhappycloud.shapes.mediators.Challenge1Mediator;
	import com.myhappycloud.shapes.views.Challenge2View;
	import com.myhappycloud.shapes.views.Challenge1View;
	import com.myhappycloud.shapes.mediators.UserViewMediator;
	import com.myhappycloud.shapes.views.UserView;
	import com.myhappycloud.shapes.mediators.SplashViewMediator;
	import com.myhappycloud.shapes.views.SplashView;
	import com.myhappycloud.shapes.commands.InitialSetupCommand;
	import com.myhappycloud.shapes.mediators.MainContainerMediator;
	import com.myhappycloud.shapes.views.MainContainer;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import shapes.Reto1;

	import flash.display.DisplayObjectContainer;
	/**
	 * @author Eder
	 */
	public class ShapesContext extends Context
	{
		public function ShapesContext(contextView : DisplayObjectContainer = null)
		{
			super(contextView);
		}

		override public function startup() : void
		{
			trace("ShapeContext.startup()");

			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, InitialSetupCommand);
//			commandMap.mapEvent(ViewEvent.SET_START_SCREEN, SetStartCommand);

			mediatorMap.mapView(MainContainer, MainContainerMediator);
			mediatorMap.mapView(SplashView, SplashViewMediator);
			mediatorMap.mapView(UserView, UserViewMediator);
			mediatorMap.mapView(Challenge1View, Challenge1Mediator);
			//mediatorMap.mapView(Challenge2View, Challenge2Mediator);
		
//			injector.mapSingletonOf(IPrefs, Preferences);
		
			super.startup();
		}

	}
}
