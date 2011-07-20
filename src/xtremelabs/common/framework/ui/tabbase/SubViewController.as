package xtremelabs.common.framework.ui.tabbase
{
	import xtremelabs.common.framework.ui.View;
	import xtremelabs.common.framework.ui.ViewController;
	
	public class SubViewController extends ViewController
	{
		private var _title:String;
		
		public function SubViewController(title:String, width:int=0, height:int=0)
		{
			super();
			_title = title;
		}
		
		override public function get view():View {
			if(!_view) {
				var subView:View = new View();
				_view = subView;
			}
			return _view;
		}

		public function get title():String
		{
			return _title;
		}

		public function set title(value:String):void
		{
			_title = value;
		}

	}
}