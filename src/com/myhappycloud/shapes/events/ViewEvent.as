package com.myhappycloud.shapes.events 
{
	import flash.events.Event;
	/**
	 * @author Eder
	 */
	public class ViewEvent extends Event 
	{
		public static const SET_SPLASH : String = "SET_SPLASH";
		public static const SET_USERSCREEN : String = "SET_USERSCREEN";
		public static const SET_CHALLENGE_1 : String = "SET_CHALLENGE_1";
		public static const SET_CHALLENGE_2 : String = "SET_CHALLENGE_2";
		public static const SET_CHALLENGE_3 : String = "SET_CHALLENGE_3";
		public static const SET_MENU_SCREEN : String = "SET_MENU_SCREEN";
		public static const SET_PARENTS_SCREEN : String = "SET_PARENTS_SCREEN";
		public static const SET_GAME_SCREEN : String = "SET_GAME_SCREEN";
		public static const RETURN_TO_LAST_SCREEN : String = "RETURN_TO_LAST_SCREEN";
		public static const SET_CONGRATS_SCREEN : String = "SET_CONGRATS_SCREEN";
		public static const SET_VIDEOS_SCREEN : String = "SET_VIDEOS_SCREEN";
		public static const SET_ADJUSTMENTS_SCREEN : String = "SET_ADJUSTMENTS_SCREEN";
		public static const SET_MESSAGE_PARENTS : String = "SET_MESSAGE_PARENTS";
		public static const SET_STATS_SCREEN : String = "SET_STATS_SCREEN";
		public static const SET_TIPS_SCREEN : String = "SET_TIPS_SCREEN";

		private var _type : String;
		
		public function ViewEvent(type:String)
		{
			_type = type;
			super(type, false, false);
		}

		override public function clone():Event
		{
			return new ViewEvent (_type);
		}
	}
}
