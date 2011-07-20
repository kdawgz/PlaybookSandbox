package xtremelabs.common.patterns.mvc.view.navbar
{
	import xtremelabs.common.patterns.mvc.view.View;

	public class NavigationWindow extends View
	{
		private var _navBarViewWidth:int; 
		private var _navBarViewHeight:int;
		private var _navBarView:NavigationBarView;
		
		public function NavigationWindow()
		{
			super();
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
			
			
			for (var i:int = 0; i < this.numChildren; i++) 
			{
				var view:View = View(this.getChildAt(i));
				if(view is NavigationBarView)
				{
					view.x = (this.width - _navBarViewWidth)/2;
					view.width = _navBarViewWidth;
					view.height = _navBarViewHeight;
				}else if(view is NavigationContentView)
				{
					view.width = this.width;
					view.height = this.height - _navBarViewHeight;
					view.y = _navBarViewHeight;
				}
			} 
			
			super.layoutChildren();
		}
		

		public function set navBarViewWidth(navWidth:int):void
		{
			_navBarViewWidth = navWidth;
		}
		
		public function set navBarViewHeight(navHeight:int):void
		{
			_navBarViewHeight = navHeight;
		}
		
		public function set navBarView(newNavBarView:NavigationBarView):void
		{
			if(_navBarView != null && this.contains(_navBarView))
			{
				this.removeChild(_navBarView);
			}
			_navBarView = newNavBarView;
			this.addChildAt(_navBarView, 0);
		}
		
		public function get navBarView():NavigationBarView
		{
			return _navBarView;
		}
		
	}
}