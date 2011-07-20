package com.PlaybookSandbox.app.mediator
{
	import org.robotlegs.mvcs.Mediator;
	
	public class ApplicationMediator extends Mediator
	{
		[Inject]
		public var view:PlaybookSandbox;
		public function ApplicationMediator()
		{
			super();
		}
		
		override public function onRegister():void {
			view.createChildren();
		}
	}
}