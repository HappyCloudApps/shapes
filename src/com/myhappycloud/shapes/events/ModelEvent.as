package com.myhappycloud.shapes.events 
{
	import flash.events.Event;
	/**
	 * @author Eder
	 */
	public class ModelEvent extends Event 
	{
		public static const LANGUAGE_CHANGE : String = "LANGUAGE_CHANGE";

		private var _type : String;
		private var _data : Object;		
		public function ModelEvent(type:String, data:Object)
		{
			this._data = data;
			_type = type;
			super(type, false, false);
		}

		override public function clone():Event
		{
			return new ModelEvent(_type, _data);
		}

		public function get data() : Object
		{
			return _data;
		}
	}
}
