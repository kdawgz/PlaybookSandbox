package xtremelabs.common.patterns.mvc.controller
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	
	import xtremelabs.common.patterns.mvc.view.View;
	import xtremelabs.common.patterns.mvc.view.navbar.NavigationBarView;
	import xtremelabs.common.patterns.mvc.view.navbar.NavigationContentView;
	import xtremelabs.common.patterns.mvc.view.navbar.NavigationWindow;
	
	public class NavigationViewController extends ViewController
	{
		private var _navWindow:NavigationWindow;
		private var _navContentView:NavigationContentView;
		private var _viewControllerStack:Vector.<ViewController> = new Vector.<ViewController>;
		
		public function NavigationViewController(parentController:ViewController = null)
		{
			super(parentController);
		}
		
		override public function initWithView(view:View):void
		{
			if(!(view is NavigationWindow))
			{
				throw new Error("Cannot instantiate TabBarViewController with this view");
			}
			
			_view = view;
			_view.backgroundColour = 0xFFFFFF;
			
			_navWindow = NavigationWindow(_view);
			if(_navWindow.navBarView == null)
			{
				_navWindow.navBarView = new NavigationBarView();
				_navWindow.navBarView.initView();
				_navWindow.navBarView.backgroundColour = 0x7D7D7D;
				
			}
			
			_navContentView = new NavigationContentView();
			_navContentView.backgroundColour = 0x000000;
			
			//_navContentView.addEventListener(MouseEvent.CLICK, onContentClick);//TODO: remove.  Temporary for testing
			
			var subViews:Vector.<View> = new Vector.<View>;
			subViews.push(_navWindow.navBarView, _navContentView);
			_view.initWithSubViews(subViews);
		}
		
		//TODO: remove.  Temporary for testing
		public function onContentClick(event:MouseEvent):void
		{
			if(event.currentTarget is NavigationContentView){
				if(event.type == MouseEvent.CLICK)
				{
					var viewController:ViewController = new ViewController();
					var view:View = new View();
					view.addChild(new Sprite());
					view.width = _navContentView.width;
					view.height = _navContentView.height;
					view.backgroundColour = Math.random()*0xFFFFFF;
					viewController.initWithView(view);
					this.pushViewControllerAndDisplay(viewController);
				}
			}
			
		}
		
		public function onBackButtonClicked(event:MouseEvent):void
		{
			if(event.type == MouseEvent.CLICK)
			{
				this.popViewControllerAndDisplay();
			}
		}
		
		
		public function setNavBarSize(width:int, height:int):void
		{
			NavigationWindow(_view).navBarViewWidth = width;
			NavigationWindow(_view).navBarViewHeight = height;
		}
		
		public function pushViewControllerAndDisplay(viewController:ViewController):void
		{
			if(_viewControllerStack.length == 1)
			{
				_navWindow.navBarView.displayBackButton();
				_navWindow.navBarView.backButton.addEventListener(MouseEvent.CLICK, onBackButtonClicked);
			}
			_viewControllerStack.push(viewController);
			var contentCount:int = View(_navContentView).numChildren;
			if (contentCount == 1) {
				_navContentView.removeChildAt(0);	
			} else {
				
			}
			_navContentView.addChild(viewController.view);
			this.displayView();//update navigation view
			viewController.parentViewController = this;
		}
		
		public function pushInitialViewController(viewController:ViewController):void
		{

			_viewControllerStack.push(viewController);
			var contentCount:int = View(_navContentView).numChildren;
			if (contentCount == 1) {
				_navContentView.removeChildAt(0);	
			} else {
				
			}
			_navContentView.addChild(viewController.view);
			viewController.parentViewController = this;
		}
		
		public function popViewControllerAndDisplay():void
		{
			
			var currentView:ViewController = _viewControllerStack.pop();
			if(currentView != null)
			{
				var contentCount:int = View(_navContentView).numChildren;
				if (contentCount == 1) {
					_navContentView.removeChildAt(0);	
				} else {
					
				}
				var previousView:ViewController = _viewControllerStack.pop();
				_navContentView.addChild(previousView.view);
				_viewControllerStack.push(previousView);
				if(_viewControllerStack.length == 1)
				{
					_navWindow.navBarView.backButton.removeEventListener(MouseEvent.CLICK, onBackButtonClicked);
					_navWindow.navBarView.hideBackButton();
				}
				previousView.displayView();
			}
		}
		

	}
}