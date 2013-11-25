package com.myhappycloud.shapes.views
{
	import com.myhappycloud.shapes.events.ViewEvent;
	import flash.events.MouseEvent;

	import assets.shapes.MenuScreen;

	import com.myhappycloud.utils.Screen;

	import flash.display.Sprite;

	/**
	 * @author Eder
	 */
	public class MenuView extends Screen
	{
		private var mc : MenuScreen;

		public function init() : void
		{
			mc = new MenuScreen();
			addChild(mc);
			onClick(mc.btn_play, clickedPlay);
			onClick(mc.btn_parents, clickedParents);
			onClick(mc.btn_swap, clickedSwap);
			onClick(mc.btn_videos, clickedVideos);
		}

		private function clickedPlay(e : MouseEvent) : void
		{
			trace("MenuView.clickedPlay(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_GAME_SCREEN));
		}

		private function clickedParents(e : MouseEvent) : void
		{
			trace("MenuView.clickedParents(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_PARENTS_SCREEN));
		}

		private function clickedSwap(e : MouseEvent) : void
		{
			trace("MenuView.clickedSwap(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_USERSCREEN));
		}

		private function clickedVideos(e : MouseEvent) : void
		{
			trace("MenuView.clickedVideos(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_VIDEOS_SCREEN));
		}
	}
}
