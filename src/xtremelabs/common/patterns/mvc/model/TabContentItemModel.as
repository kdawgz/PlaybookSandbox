package xtremelabs.common.patterns.mvc.model
{
	import mx.utils.StringUtil;
	
	import qnx.ui.display.Image;
	
	import xtremelabs.common.patterns.mvc.controller.ViewController;

	public class TabContentItemModel
	{
		
		protected var _title:String;
		protected var _contentViewController:ViewController;
		protected var _tabBackgroundImageURL:String;
		protected var _tabBackgroundImageHighlightedURL:String;
		
		
		public function TabContentItemModel(title:String, contentController:ViewController, background:String, backgroundHighlighted:String)
		{
			_title = title;
			_contentViewController = contentController;
			_tabBackgroundImageURL = background;
			_tabBackgroundImageHighlightedURL = backgroundHighlighted;
		}
		
		public function get title():String
		{
			return _title;
		}
		
		public function set title(newTitle:String):void
		{
			_title = newTitle;
		}
		
		public function get contentViewController():ViewController
		{
			return _contentViewController;
		}
		
		public function set contentViewController(newContentController:ViewController):void
		{
			_contentViewController = newContentController; 
		}
		
		public function get tabBackgroundImageURL():String
		{
			return _tabBackgroundImageURL;
		}
		
		public function set tabBackgroundImageURL(newBackground:String):void
		{
			_tabBackgroundImageURL = newBackground;
		}
		
		public function get tabBackgroundImageHighlightedURL():String
		{
			return _tabBackgroundImageHighlightedURL;
		}
		
		public function set tabBackgroundImageHighlightedURL(newHighlightedBackground:String):void
		{
			_tabBackgroundImageHighlightedURL = newHighlightedBackground;
		}

	}
}