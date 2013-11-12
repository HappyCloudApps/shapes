package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	/**
	 * @author Eder
	 */
	public class UserView extends Sprite
	{
		public function init() : void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			trace("UserView.init() - choose challenge");
		}

		private function keyPressed(e : KeyboardEvent) : void
		{
			var challengeId:int = e.keyCode-48;
			
			if(challengeId==1)
			dispatchEvent(new ViewEvent(ViewEvent.SET_CHALLENGE_1));
			else if(challengeId==2)
			dispatchEvent(new ViewEvent(ViewEvent.SET_CHALLENGE_2));
			//TODO challenge 3
			//else if(challengeId==3)
			//dispatchEvent(new ViewEvent(ViewEvent.SET_CHALLENGE_3));
			
		}
		
	}
}
