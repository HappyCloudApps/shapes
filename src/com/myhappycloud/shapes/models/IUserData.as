package com.myhappycloud.shapes.models
{
	/**
	 * @author Eder
	 */
	public interface IUserData
	{
		function get NAME():String;
		
		function get volumeAmbient():Number;
		function set volumeAmbient(vol:Number):void;
		
		function get volumeFx():Number;
		function set volumeFx(vol:Number):void;
		
		function get language():String;
		function set setLanguage(str:String):void;
		
		function makeNewUser(id:uint):Boolean;
		function userExists(id:uint):Boolean;
		function eraseUserById(id:uint):Boolean;
		
		function setUserData(id:uint, objName:String, object:Object):void;
		function getUserData(id:uint, objName:String):Object;	
	}
}
