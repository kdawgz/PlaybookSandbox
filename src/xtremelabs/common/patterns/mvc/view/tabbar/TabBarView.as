package xtremelabs.common.patterns.mvc.view.tabbar
{
	import caurina.transitions.Tweener;
	
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.elements.OverflowPolicy;
	
	import qnx.display.Display;
	import qnx.ui.core.UIComponent;
	import qnx.ui.display.Image;
	
	import xtremelabs.common.patterns.mvc.controller.TabBarViewController;
	import xtremelabs.common.patterns.mvc.view.View;
	import xtremelabs.common.patterns.mvc.view.ButtonView;
	
	/**
	 * VERY IMPORTANT: TabBarView makes the assumption that each TabItemView, is of the same width
	 * 
	 * 
	 **/
	
	public class TabBarView extends View
	{

		private var _focusBackground:Image;
		private var _focusIndex:int = 0;
		
		public function TabBarView()
		{
			super();
		}
		

		override public function initWithSubViews(views:Vector.<View>):void
		{
			super.initWithSubViews(views);
		}
		
		override public function layoutView():void
		{
			
			for (var i:int = 0; i < this.numChildren; i++) 
			{
				if(this.getChildAt(i) is ButtonView)
				{
					var view:ButtonView = ButtonView(this.getChildAt(i));
					view.x = i*getTabWidth();
					view.width = getTabWidth();
					view.height = this.height;
				}
			}
			layoutChildren();
		}
		
		private function getTabWidth():Number
		{
			var tabWidth:Number = this.width/this.numChildren;
			return tabWidth;
		}

	}
}

