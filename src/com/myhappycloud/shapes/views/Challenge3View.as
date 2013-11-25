package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.views.activities.Act3Controller;
	import flash.display.MovieClip;
	import assets.shapes.Challenge3Screen;

	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.utils.Screen;

	import flash.events.MouseEvent;
	/**
	 * @author Eder
	 */
	public class Challenge3View extends Screen
	{
		private var mc : Challenge3Screen;
		private var difficulty : uint = 2;
		private var controller : Act3Controller;
		public function init() : void
		{
			mc= new Challenge3Screen();
			addChild(mc);
			
			onClick(mc.back_btn, goBack);
			onClick(mc.help_btn, showHelp);
			
			setupLevel(difficulty);
		}

		private function setupLevel(difficulty : uint) : void
		{
			hideAll();
			
			switch(difficulty){
				case 1:
					setGame(mc.shapes_container_1, mc.shapes_shadows_1, mc.bg_1);
					break;
				case 2:
					setGame(mc.shapes_container_2, mc.shapes_shadows_2, mc.bg_2);
					break;
				case 3:
					setGame(mc.shapes_container_3, mc.shapes_shadows_3, mc.bg_3);
					break;
				default:
			}
		}

		private function setGame(shapes : MovieClip, holders : MovieClip, bg : MovieClip) : void
		{
			controller = new Act3Controller(mc, shapes, holders, bg);
			controller.gameOverSignal.add(goEndScreen);
		}

		private function goEndScreen() : void
		{
			dispatchEvent(new ViewEvent(ViewEvent.SET_CONGRATS_SCREEN));
		}

		private function hideAll() : void
		{
			mc.shapes_container_1.visible = false;
			mc.shapes_container_2.visible = false;
			mc.shapes_container_3.visible = false;
			
			mc.shapes_shadows_1.visible = false;
			mc.shapes_shadows_2.visible = false;
			mc.shapes_shadows_3.visible = false;
			
			mc.bg_1.visible = false;
			mc.bg_2.visible = false;
			mc.bg_3.visible = false;
		}

		private function showHelp(e:MouseEvent) : void
		{
			trace("Challenge3View.showHelp(e)");
			//TODO add show help code
		}

		private function goBack(e:MouseEvent) : void
		{
			trace("Challenge3View.goBack(e)");
			dispatchEvent(new ViewEvent(ViewEvent.RETURN_TO_LAST_SCREEN));
		}
	}
}
