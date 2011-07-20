package xtremelabs.common.patterns.mvc.view.tabbar
{
	import xtremelabs.common.patterns.mvc.view.View;

	/**
	 * VERY IMPORTANT: TabBarWindow currently only works 
	 * at the stage level (cannot be added as a subview)
	 * 
	 * 
	 **/
	public class TabBarWindow extends View
	{
		//TODO: refactor to some sort of enum
		public static const ANCHOR_TOP:int = 0;
		public static const ANCHOR_BOTTOM:int = 1;
		private var _anchorPosition:int;
		
		private var _tabBarViewWidth:int = -1; 
		private var _tabBarViewHeight:int = -1;
		
		public function TabBarWindow()
		{
			_backgroundColour = 0x000000;
		}
		
		override public function layoutView():void
		{
			if(this.parent != null && this.parent != stage)
			{
				this.width = this.parent.width;
				this.height = this.parent.height;
			}else{
				this.width = stage.stageWidth;
				this.height = stage.stageHeight;
			}
			
			if(_tabBarViewWidth == -1)
			{
				_tabBarViewWidth = this.width;
			}
			if(_tabBarViewHeight == -1)
			{
				_tabBarViewHeight = this.height;	
			}
			
			for (var i:int = 0; i < this.numChildren; i++) 
			{
				var view:View = View(this.getChildAt(i));
				if(view is TabBarView)
				{
					if(_anchorPosition == ANCHOR_BOTTOM)
					{
						view.y = this.height - _tabBarViewHeight;
					}
					view.x = (this.width - _tabBarViewWidth)/2;
					view.width = _tabBarViewWidth;
					view.height = _tabBarViewHeight;
				}else if(view is TabContentView)
				{
					view.width = this.width;
					view.height = this.height - _tabBarViewHeight;
					if(_anchorPosition == ANCHOR_TOP)
					{
						view.y = _tabBarViewHeight;
					}
				}
			} 
			
			super.layoutChildren();
		}
		
		public function set anchorPosition(position:int):void{
			_anchorPosition = position;
		}
		
		public function set tabViewWidth(tabWidth:int):void
		{
			_tabBarViewWidth = tabWidth;
		}
		
		public function set tabViewHeight(tabHeight:int):void
		{
			_tabBarViewHeight = tabHeight;
		}
		
	}
}