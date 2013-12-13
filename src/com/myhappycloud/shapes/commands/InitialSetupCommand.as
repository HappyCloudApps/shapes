package com.myhappycloud.shapes.commands
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.shapes.views.MainContainer;
	import com.reintroducing.sound.SoundManager;
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
			
			setupAudio();
		}
		
		private function setupAudio():void 
		{
			var sm: SoundManager = SoundManager.getInstance();
			sm.addSound("background_loop");
			sm.playSound("background_loop", 1, 0, 99999);
			//sm.setSoundVolume(
		}

	}
}
