package com.myhappycloud.shapes.views.utils
{
	import flash.display.MovieClip;

	/**
	 * @author Eder
	 */
	public class LanguageMc extends MovieClip
	{
		public function LanguageMc()
		{
			stop();
		}
		
		public function init(lang:String):void
		{
			gotoAndStop(lang);
		}
		
		public function set language(lang:String):void
		{
			gotoAndStop(lang);
		}
	}
}
