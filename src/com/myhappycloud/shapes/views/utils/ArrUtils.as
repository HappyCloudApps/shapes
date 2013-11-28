package com.myhappycloud.shapes.views.utils
{
	/**
	 * @author Eder
	 */
	public class ArrUtils
	{
		public static function randomizeArray(array : Array) : Array
		{
			var newArray : Array = new Array();
			while (array.length > 0)
			{
				newArray.push(array.splice(Math.floor(Math.random() * array.length), 1));
			}
			return newArray;
		}
	}
}
