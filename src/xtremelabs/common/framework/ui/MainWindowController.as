package xtremelabs.common.framework.ui
{
	import flash.display.Stage;
	
	import qnx.events.QNXApplicationEvent;
	import qnx.system.QNXApplication;
	
	public class MainWindowController extends ViewController
	{
		private var _stage:Stage;
		
		public function MainWindowController(stage:Stage)
		{
			super();
			
			_stage = stage;
		}
		
		override public function get view():View
		{
			return _view;
		}
	}
}