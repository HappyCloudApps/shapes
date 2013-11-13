package com.myhappycloud.shapes
{
	import com.myhappycloud.shapes.models.UserData;
	import com.myhappycloud.shapes.models.IUserData;
	import com.myhappycloud.shapes.mediators.CongratsMediator;
	import com.myhappycloud.shapes.mediators.Challenge3Mediator;
	import com.myhappycloud.shapes.mediators.ToyMediator;
	import com.myhappycloud.shapes.mediators.AdustmentsMediator;
	import com.myhappycloud.shapes.mediators.ParentsMediator;
	import com.myhappycloud.shapes.mediators.VideosMediator;
	import com.myhappycloud.shapes.views.CongratsView;
	import com.myhappycloud.shapes.views.Challenge3View;
	import com.myhappycloud.shapes.views.ToyView;
	import com.myhappycloud.shapes.views.AdjustmentsView;
	import com.myhappycloud.shapes.views.ParentsView;
	import com.myhappycloud.shapes.views.VideosView;
	import com.myhappycloud.shapes.mediators.MenuMediator;
	import com.myhappycloud.shapes.views.MenuView;
	import com.myhappycloud.shapes.mediators.Challenge2Mediator;
	import com.myhappycloud.shapes.views.Challenge2View;
	import com.myhappycloud.shapes.commands.InitialSetupCommand;
	import com.myhappycloud.shapes.mediators.Challenge1Mediator;
	import com.myhappycloud.shapes.mediators.MainContainerMediator;
	import com.myhappycloud.shapes.mediators.SplashViewMediator;
	import com.myhappycloud.shapes.mediators.UserViewMediator;
	import com.myhappycloud.shapes.views.Challenge1View;
	import com.myhappycloud.shapes.views.MainContainer;
	import com.myhappycloud.shapes.views.SplashView;
	import com.myhappycloud.shapes.views.UserView;

	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;

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

			//menus
			mediatorMap.mapView(MainContainer, MainContainerMediator);
			mediatorMap.mapView(SplashView, SplashViewMediator);
			mediatorMap.mapView(UserView, UserViewMediator);
			mediatorMap.mapView(MenuView, MenuMediator);
			mediatorMap.mapView(VideosView, VideosMediator);
			mediatorMap.mapView(ParentsView, ParentsMediator);
			mediatorMap.mapView(AdjustmentsView, AdustmentsMediator);
			
			// game
			mediatorMap.mapView(ToyView, ToyMediator);
			mediatorMap.mapView(Challenge1View, Challenge1Mediator);
			mediatorMap.mapView(Challenge2View, Challenge2Mediator);
			mediatorMap.mapView(Challenge3View, Challenge3Mediator);
			mediatorMap.mapView(CongratsView, CongratsMediator);

			injector.mapSingletonOf(IUserData, UserData);
		
			super.startup();
		}

	}
}
