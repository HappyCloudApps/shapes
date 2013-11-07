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
