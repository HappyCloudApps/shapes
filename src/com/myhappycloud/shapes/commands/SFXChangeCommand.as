package com.myhappycloud.shapes.commands 
{
	import com.myhappycloud.shapes.events.ModelEvent;
	import com.myhappycloud.shapes.models.IUserData;
	import com.reintroducing.sound.SoundManager;
	import org.robotlegs.mvcs.Command;
	/**
	 * ...
	 * @author angel
	 */
	public class SFXChangeCommand extends Command
	{
		[Inject]
		public var event:ModelEvent;
		[Inject]
		public var userData:IUserData;
		
		override public function execute():void 
		{
			var sm: SoundManager = SoundManager.getInstance();
			sm.setSoundVolume("background_loop", event.data.volume);
			userData.volumeFx = event.data.volume;
		}
		
	}

}