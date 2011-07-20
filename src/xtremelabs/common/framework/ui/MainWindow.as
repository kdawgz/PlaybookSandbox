package xtremelabs.common.framework.ui
{
	import caurina.transitions.Tweener;
	
	import flash.display.BlendMode;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	
	import qnx.display.Display;
	
	import xtremelabs.common.framework.ui.event.MainWindowEvent;
	
	public class MainWindow extends View
	{
		private var _popupViewTouchLayer:View;
		private var _popupView:View;
		
		public function MainWindow()
		{
			super();
		}
		
		public static function get screenWidth():int {
			return Display.display.getDisplayWidth(0);
		}
		
		public static function get screenHeight():int {
			return Display.display.getDisplayHeight(0);
		}
		
		public function pushPopupView(view:View, xPos:int=-1, yPos:int=-1, transparency:Number=0):void {
			// apply shadows
			view.filters = new Array(new DropShadowFilter(0, 0, 0x000000, 0.8, 20, 20, 2));
			
			if(_popupViewTouchLayer && contains(_popupViewTouchLayer))	{
				removeChild(_popupViewTouchLayer);
				_popupViewTouchLayer = _popupView = null;
			}
			
			_popupViewTouchLayer = new View();
			_popupViewTouchLayer.backgroundColor = 0x000000;
			_popupViewTouchLayer.backgroundAlpla = transparency;
			_popupViewTouchLayer.setSize(screenWidth, screenHeight);
			
			_popupView = view;
			_popupViewTouchLayer.addChild(_popupView);
			if(xPos<0 || yPos<0) {
				view.setPosition((_popupViewTouchLayer.width-view.width)/2, (_popupViewTouchLayer.height-view.height)/2);
			}else {
				view.setPosition(xPos, yPos);
			}
			
			_popupViewTouchLayer.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			
			addChild(_popupViewTouchLayer);
			dispatchEvent(new MainWindowEvent(MainWindowEvent.POPUP_VIEW_SHOWED));
			
			function onMouseUp(event:MouseEvent):void {
				if(event.target!=view && !view.contains(event.target as DisplayObject)) {
					popPopupView(_popupView);
				}
			}
		}
		
		public function popPopupView(view:View):void {
			if(_popupView==view) {
				if(_popupViewTouchLayer && contains(_popupViewTouchLayer))	{
					removeChild(_popupViewTouchLayer);
					_popupViewTouchLayer = _popupView = null;
					dispatchEvent(new MainWindowEvent(MainWindowEvent.POPUP_VIEW_DISMISSED));
				}
			}else {
				trace("MainWindow: fatal, cannot pop the view which is not on the main window");
			}
		}
		
	}
}