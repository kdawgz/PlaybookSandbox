package xtremelabs.common.patterns.mvc.controller
{
	import flash.events.MouseEvent;
	
	import qnx.ui.display.Image;
	
	import xtremelabs.common.patterns.mvc.model.TabContentItemModel;
	import xtremelabs.common.patterns.mvc.view.*;
	import xtremelabs.common.patterns.mvc.view.tabbar.*;


	
	public class TabBarViewController extends ViewController
	{
		

		private var _tabContentItemModels:Vector.<TabContentItemModel> = new Vector.<TabContentItemModel>;
		private var _contentView:TabContentView;
		private var _tabView:TabBarView;
		private var _currentTabItemView:ButtonView;
		
		public function TabBarViewController(parentController:ViewController)
		{
			super(parentController);
			
		}
		
		public function addTabModel(newTabContentItemModel:TabContentItemModel):void
		{
			_tabContentItemModels.push(newTabContentItemModel);
		}
		
		
		override public function initWithView(view:View):void
		{
			if(!(view is TabBarWindow))
			{
				throw new Error("Cannot instantiate TabBarViewController with this view");
			}
			
			//assemble tab bar item views
			var tabItemViews:Vector.<ButtonView> = new Vector.<ButtonView>;
			for each (var tabContentModel:TabContentItemModel in _tabContentItemModels) {
				var tabItemView:ButtonView = new ButtonView(tabContentModel.title);
				tabItemView.backgroundColour = 0X000000;
				var unhighlighted:String = tabContentModel.tabBackgroundImageURL;
				var highlightedImage:String = tabContentModel.tabBackgroundImageHighlightedURL;
				tabItemView.backgroundImageUrl = unhighlighted;
				tabItemView.backgroundImageHighlightedUrl = highlightedImage;
				if(_currentTabItemView == null)
				{
					_currentTabItemView = tabItemView;
				}
				tabItemViews.push(tabItemView);
			}
			_view = view;
			_tabView = new TabBarView();
			_tabView.backgroundColour = 0x000000;
			_tabView.addEventListener(MouseEvent.CLICK, onTabClick);
			
			var views:Vector.<View> = Vector.<View>(tabItemViews);
			_tabView.initWithSubViews(views);
			_contentView = new TabContentView();
			_contentView.backgroundColour = 0x000000;
			var views2:Vector.<View> = new Vector.<View>;
			views2.push(_tabView, _contentView);
			_view.initWithSubViews(views2);
		}
		
		override public function displayView():void
		{
			_view.layoutView();
			_view.paintView();
			setSelectionForIndex(0);
		}
		
		public function onTabClick(event:MouseEvent):void
		{
			if(event.target is ButtonView && _currentTabItemView!=(ButtonView(event.target))){
				if(event.type == MouseEvent.CLICK)
				{
					_currentTabItemView.highlighted = false;
					_currentTabItemView = ButtonView(event.target);
					var index:int = _tabView.getChildIndex(_currentTabItemView);
					setSelectionForIndex(index);
				}
			}
			
		}
		
		public function setSelectionForIndex(index:int):void
		{
			var contentCount:int = View(_contentView).numChildren;
			if (contentCount == 1) {
				_contentView.removeChildAt(0);	
			} else {
				
			}
			_contentView.addChild(_tabContentItemModels[index].contentViewController.view);
			_tabContentItemModels[index].contentViewController.displayView();
			_currentTabItemView.highlighted = true;
		}
		
	}
}