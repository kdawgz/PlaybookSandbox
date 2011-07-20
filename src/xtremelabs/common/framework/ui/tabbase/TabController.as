package xtremelabs.common.framework.ui.tabbase
{
	import flash.events.MouseEvent;
	
	import xtremelabs.common.framework.ui.View;
	import xtremelabs.common.framework.ui.ViewController;

	public class TabController
	{
		private var _subViewControllers:Vector.<SubViewController>;
		private var _tabBar:TabBar;
		
		private var _currentIndex:int;
		
		public function TabController(value:Vector.<SubViewController>)
		{
			_subViewControllers = value;
			_tabBar = new TabBar(this);
			_tabBar.addEventListener(MouseEvent.CLICK, onTabSelect);
		}
		
		private function onTabSelect(event:MouseEvent):void {
			var index:int = _tabBar.indexOfTab(event.target);
			
			// show subview
		}
		
		public function setSelect(index:int):void {
			_currentIndex = index;
			_tabBar.setFocus(index);
		}
		
		public function get tabBar():TabBar {
			return _tabBar;
		}

		public function get subViewControllers():Vector.<SubViewController>
		{
			return _subViewControllers;
		}
		
		public function get numSubviews():int {
			return _subViewControllers.length;
		}
		
		public function getTabItemNameAt(index:int):String {
			return _subViewControllers[index].title;
		}

		public function get currentIndex():int
		{
			return _currentIndex;
		}


	}
}