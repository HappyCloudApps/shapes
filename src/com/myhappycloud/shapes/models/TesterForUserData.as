package com.myhappycloud.shapes.models
{
	import flash.display.Sprite;

	/**
	 * @author Eder
	 */
	public class TesterForUserData extends Sprite
	{
		public function TesterForUserData()
		{
			trace("TesterForUserData.TesterForUserData()");
			var userData:UserData = new UserData();
			trace('userData.volumeFx: ' + (userData.volumeFx));
			trace('userData.eraseUserById(1): ' + (userData.eraseUserById(1)));
			trace('userData.getUserData(1,"derp"): ' + (userData.getUserData(1,"derp")));
			trace('userData.userExists(1): ' + (userData.userExists(1)));
			trace('userData.userExists(1): ' + (userData.userExists(0)));
			trace('userData.makeNewUser(0): ' + (userData.makeNewUser(0)));
			trace('userData.setUserData(0,userData.NAME,"Eder"): ' + (userData.setUserData(0,userData.NAME,"Eder")));
			trace('userData.getUserData(0,userData.NAME): ' + (userData.getUserData(0,userData.NAME)));
		}
	}
}
