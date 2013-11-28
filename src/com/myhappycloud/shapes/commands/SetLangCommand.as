package com.myhappycloud.shapes.commands
{
	import com.myhappycloud.shapes.events.ModelEvent;
	import com.myhappycloud.shapes.models.IUserData;

	import org.robotlegs.mvcs.Command;

	/**
	 * @author Eder
	 */
	public class SetLangCommand extends Command
	{
		[Inject]
		public var event : ModelEvent;
		[Inject]
		public var model : IUserData;

		override public function execute() : void
		{
			model.setLanguage = event.data.language;
		}
	}
}
