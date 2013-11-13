package com.myhappycloud.shapes.models
{
	import flash.utils.Dictionary;
	import flash.net.SharedObject;

	/**
	 * @author Eder
	 */
	public class UserData implements IUserData
	{
		
		private var _volumeAmbient : Number;
		private var _volumeFx : Number;
		private var _language : String;
		private var _users : Dictionary;

		public function UserData()
		{
			var sharedObject : SharedObject = SharedObject.getLocal("HKUserData");

			if (!sharedObject.data.initialized)
			{
				trace("UserData.UserData() - data empty, setting default data...");
				sharedObject.data.initialized = true;
				sharedObject.data.volAmb = 1;
				sharedObject.data.volFx = 1;
				sharedObject.data.lang = "es";
				sharedObject.data.users = new Dictionary();
				sharedObject.flush();
			}

			_volumeFx = sharedObject.data.volFx;
			_volumeAmbient = sharedObject.data.volAmb;
			_language = sharedObject.data.lang;
			_users = sharedObject.data.users;

		}

		public function get volumeAmbient() : Number
		{
			return _volumeAmbient;
		}

		public function set volumeAmbient(vol : Number) : void
		{
			_volumeAmbient = vol;
			setSO();
		}

		private function setSO() : void
		{
			var sharedObject : SharedObject = SharedObject.getLocal("HKUserData");
			sharedObject.data.volAmb = _volumeAmbient;
			sharedObject.data.volFx = _volumeFx;
			sharedObject.data.lang = _language;
			sharedObject.data.users = _users;
			sharedObject.flush();
		}

		public function get volumeFx() : Number
		{
			return _volumeFx;
		}

		public function set volumeFx(vol : Number) : void
		{
			_volumeFx = vol;
			setSO();
		}

		public function get language() : String
		{
			return language;
		}

		public function set setLanguage(str : String) : void
		{
			_language = str;
			setSO();
		}

		public function makeNewUser(id : uint) : Boolean
		{
			if(_users[id])
			{
				trace("UserData.makeNewUser(id) - user already exists");
				return false;
			}
			_users[id] = new Dictionary();
			setSO();
			return true;
		}

		public function eraseUserById(id : uint) : Boolean
		{
			if(_users[id])
			{
				_users[id] = null;
				setSO();
				return true;
			}
			return false;
		}

		public function setUserData(id : uint, dataId : String, dataValue : Object) : void
		{
			var user:Dictionary = _users[id];
			if(!user)
			{
				trace("UserData.setUserData(id, dataId, dataValue) - user doesn't exist");
				return;				
			}
			user[dataId] = dataValue;
			setSO();
		}

		public function getUserData(id : uint, dataId : String) : Object
		{			
			var user:Dictionary = _users[id];
			if(!user)
			{
				trace("UserData.getUserData(id, dataId, dataValue) - user doesn't exist");
				return null;				
			}
			return user[dataId];
		}

		public function userExists(id : uint) : Boolean
		{
			if(_users[id])
				return true;
			return false;
		}

		public function get NAME() : String
		{
			return "NAME";
		}
	}
}
