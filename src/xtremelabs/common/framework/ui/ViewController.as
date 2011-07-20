package xtremelabs.common.framework.ui
{
	import flash.display.Stage;
	import flash.events.EventDispatcher;

	public class ViewController extends EventDispatcher
	{
		protected var _view:View;
		
		protected var _nagivatorMode:Boolean;
		protected var _nagivator:Navigator;
		
		public function ViewController()
		{
		}
		
		public function pushFirstViewController(viewController:ViewController):void {
			if(!_nagivator) {
				trace("ViewController: fatal, navigator mode is off, you cannot push view");
				return;
			}
			
			if(_nagivator.size>0) {
				trace("ViewController: fatal, the first view has been added already");
				return;
			}
			
			_nagivator.pushView(viewController);
		}
		
		public function get nagivator():Navigator
		{
			return _nagivator;
		}
		
		public function set nagivator(value:Navigator):void
		{
			_nagivator = value;
		}
		
		public function get view():View
		{
			// it has to be overriden (optional)
			return _view;
		}
		
		public function get stage():Stage {
			if(view) {
				return view.stage;
			}
			return null;
		}

		public function get nagivatorMode():Boolean
		{
			return _nagivatorMode;
		}

		public function set nagivatorMode(value:Boolean):void
		{
			_nagivatorMode = value;
			if(_nagivatorMode && !_nagivator) {
				_nagivator = new Navigator(this);
			}
		}

	}
}