package xtremelabs.common.framework.ui
{
	import caurina.transitions.Tweener;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import xtremelabs.common.framework.ui.event.NavigatorEvent;
	
	public class Navigator extends EventDispatcher
	{
		private var _rootViewController:ViewController;
		private var _stack:Vector.<ViewController>;
		
		public var _swipeDuration:Number = 0.5;
		
		public function Navigator(value:ViewController)
		{
			super();
			_rootViewController = value;
			_stack = new Vector.<ViewController>();
		}
		
		public function pushView(viewController:ViewController):void {
			// if this is the first view
			if(_stack.length==0) {
				_stack.push(viewController);
				viewController.view.y = rootView.height - viewController.view.height;
				rootViewController.view.addChild(viewController.view);
				return;
			}
			
			// if it's not the first view
			var oldView:View = _stack[_stack.length-1].view;
			var newView:View = viewController.view;
			
			if(_stack.length>1) _stack.pop();
			_stack.push(viewController);
			
			// do animation and remove the view when animation done
			newView.x = MainWindow.screenWidth;
			//			newView.y = rootView.height - newView.height

			dispatchEventsToChildren(oldView, new NavigatorEvent(NavigatorEvent.REMOVING_FROM_NAVIGATOR));
			
			// start animation
			rootViewController.view.addChild(newView);
			Tweener.addTween(oldView, {x:0-MainWindow.screenWidth, time:swipeDuration, transition:"easeInOutCubic", onComplete:onTweenDone});
			Tweener.addTween(newView, {x:0, time:swipeDuration, transition:"easeInOutCubic"});
			
			function onTweenDone():void {
				rootViewController.view.removeChild(oldView);
				dispatchEventsToChildren(newView, new NavigatorEvent(NavigatorEvent.ADDED_TO_NAVIGATOR));
				dispatchEvent(new NavigatorEvent(NavigatorEvent.VIEW_PUSHED));
			}
		}
		
		public function popView(value:*):void {
			var view:View;
			
			if(value is View) {
				view = value;
			}else if(value is ViewController) {
				view = value.view
			}
			
			if(_stack.length<=1 || _stack[_stack.length-1].view!=view) {
				trace("Navigator: cannot pop the view which is not on the top of the stack!");
				return;
			}
			
			var currView:View = _stack[_stack.length-1].view;
			var pervView:View = _stack[_stack.length-2].view;
			
			// remove from stack first
			_stack.pop();
			
			// do animation and remove the view when animation done
			pervView.x = 0 - MainWindow.screenWidth;
			rootViewController.view.addChild(pervView);
			Tweener.addTween(currView, {x:MainWindow.screenWidth, time:swipeDuration, transition:"easeInOutCubic", onComplete:onTweenDone});
			Tweener.addTween(pervView, {x:0, time:swipeDuration, transition:"easeInOutCubic"});
			
			function onTweenDone():void {
				rootViewController.view.removeChild(currView);
				dispatchEvent(new NavigatorEvent(NavigatorEvent.VIEW_POPPED));
			}
		}
		
		public function indexOf(viewController:ViewController):int {
			return _stack.indexOf(viewController);
		}
		
		private function dispatchEventsToChildren(view:View, event:Event):void {
			if(!view)	return;
			
			view.dispatchEvent(event);
			
			for(var i:int=0; i<view.numChildren; i++) {
				var child:View = view.getChildAt(i) as View;
				if(child) {
					dispatchEventsToChildren(child, event);	
				}
			}
		}
		
		public function get rootView():View {
			return _rootViewController.view;
		}
		
		public function get currentViewController():ViewController {
			return _stack[_stack.length-1] as ViewController;
		}
		
		public function get size():int {
			return _stack.length;
		}
		
		public function get rootViewController():ViewController
		{
			return _rootViewController;
		}
		
		public function get swipeDuration():Number
		{
			return _swipeDuration;
		}
		
		public function set swipeDuration(value:Number):void
		{
			_swipeDuration = value;
		}
		
		
	}
}