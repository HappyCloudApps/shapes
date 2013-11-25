package com.myhappycloud.utils
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author Eder
	 */
	public class Screen extends Sprite
	{
		protected function onClick(btn : MovieClip, func : Function) : void
		{
			btn.buttonMode = true;
			btn.addEventListener(MouseEvent.CLICK, func, false, 0, true);
		}
	}
}
