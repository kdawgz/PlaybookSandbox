package xtremelabs.common.framework.ui.tabbase
{
	import flash.display.Stage;
	
	import xtremelabs.common.framework.ui.MainWindowController;
	
	public class TabBasedMainWindowController extends MainWindowController
	{
		private var _subViewControllers:Vector.<SubViewController>;
		private var _currentSubViewController:SubViewController;
		private var _tabController:TabController;
		
		
		public function TabBasedMainWindowController(stage:Stage)
		{
			super(stage);
		}

		public function get subViewControllers():Vector.<SubViewController>
		{
			return _subViewControllers;
		}

		public function set subViewControllers(value:Vector.<SubViewController>):void
		{
			_subViewControllers = value;
		}

		public function get currentSubViewController():SubViewController
		{
			return _currentSubViewController;
		}

		public function set currentSubViewController(value:SubViewController):void
		{
			_currentSubViewController = value;
		}

		public function get tabController():TabController
		{
			return _tabController;
		}

		public function set tabController(value:TabController):void
		{
			_tabController = value;
		}


	}
}