package com.myhappycloud.shapes.commands
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.MainContainer;
	import org.robotlegs.mvcs.Command;
	/**
	 * @author Eder
	 */
	public class InitialSetupCommand extends Command
	{
		override public function execute() : void
		{
			trace("InitialSetupCommand.execute()");
			contextView.addChild(new MainContainer());
			dispatch(new ViewEvent(ViewEvent.SET_SPLASH));
		}

	}
}
