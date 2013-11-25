package com.myhappycloud.shapes.views
{
	import assets.shapes.UsersScreen;

	import com.myhappycloud.shapes.events.ViewEvent;
	import com.myhappycloud.utils.Screen;

	import flash.events.MouseEvent;

	/**
	 * @author Eder
	 */
	public class UserView extends Screen
	{
		private var mc : UsersScreen;

		public function init() : void
		{
			mc = new UsersScreen();
			trace("UserView.init() - choose challenge");
			addChild(mc);

			onClick(mc.btn_parents, clickedParents);
			onClick(mc.btn_pic, clickedCamera);
			onClick(mc.btn_play, clickedPlay);
		}

		private function clickedParents(e : MouseEvent) : void
		{
			trace("UserView.clickedParents(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_PARENTS_SCREEN));
		}

		private function clickedPlay(e : MouseEvent) : void
		{
			trace("UserView.clickedPlay(e)");
			dispatchEvent(new ViewEvent(ViewEvent.SET_MENU_SCREEN));
		}

		private function clickedCamera(e : MouseEvent) : void
		{
			trace("UserView.clickedCamera(e)");
		}

	}
}
