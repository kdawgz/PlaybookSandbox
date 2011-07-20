package xtremelabs.common.framework.ui.tabbase
{
	import qnx.ui.core.Container;
	import qnx.ui.core.ContainerAlign;
	import qnx.ui.core.ContainerFlow;
	
	import xtremelabs.common.framework.ui.MainWindow;
	import xtremelabs.common.framework.ui.View;
	
	public class TabBar extends View
	{
		public static var HEIGHT:int = 60;
		
		private var _controller:TabController;
		
		private var _tabBarItems:Vector.<TabBarItem>;
		
		public function TabBar(tabController:TabController)
		{
			super();
			_controller = tabController;
			//			flow = ContainerFlow.HORIZONTAL;
			//			align = ContainerAlign.MID;
			//			padding = 0;
			
			initTabs();
			
			setSize(TabBarItem.WIDTH*_tabBarItems.length, HEIGHT);
		}
		
		public function initTabs():void {
			_tabBarItems = new Vector.<TabBarItem>();
			for(var i:int=0; i<_controller.numSubviews; i++) {
				var title:String = _controller.getTabItemNameAt(i);
				var type:String;
				if(i==0) {
					type = TabBarItem.LEFT;
				}else if(i<_controller.numSubviews-1) {
					type = TabBarItem.MID;
				}else {
					type = TabBarItem.RIGHT;
				}
				_tabBarItems.push(new TabBarItem(title, type));
				//				_tabBarItems[i].x = TabBarItem.WIDTH*i;
				//				_tabBarItems[i].y = HEIGHT - TabBarItem.HEIGHT;
				addChild(_tabBarItems[i]);
			}
		}
		
		override public function setSize(widthValue:Number, heightValue:Number):void
		{
			if(_tabBarItems) {
				for(var i:int=0; i<_tabBarItems.length; i++) {
					_tabBarItems[i].x = TabBarItem.WIDTH*i;
					_tabBarItems[i].y = HEIGHT - TabBarItem.HEIGHT;
				}
			}
			
			super.setSize(widthValue, heightValue);
		}
		
		
		
		public function setFocus(index:int):void {
			for(var i:int=0; i<_controller.numSubviews; i++) {
				if(i==index) {
					_tabBarItems[i].select();
				}else {
					_tabBarItems[i].deselect();
				}
			}
		}
		
		public function indexOfTab(item:*):int {
			if(item is TabBarItem) {
				return _tabBarItems.indexOf(item);
			}else {
				for each(var tabBarItem:TabBarItem in _tabBarItems) {
					if(tabBarItem.contains(item))	return _tabBarItems.indexOf(tabBarItem);
				}
				return -1;
			}
		}
		
	}
}