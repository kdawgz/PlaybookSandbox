package xtremelabs.common.patterns.mvc.view.navbar
{
	import qnx.ui.display.Image;
	
	import xtremelabs.common.patterns.mvc.view.ButtonView;
	import xtremelabs.common.patterns.mvc.view.View;

	public class NavigationBarView extends View
	{

		private var _backButton:ButtonView;
		protected static const BACK_BUTTON_HEIGHT:int = 33;
		protected static const BACK_BUTTON_WIDTH:int = 47;
		protected static const BACK_BUTTON_X:int = 5;
		
		public function NavigationBarView(backgroundUrl:String = null, backButtonBackgroundUrl:String = null, backButtonHighlightedBackgroundUrl:String = null)
		{
			super();
			_backButton = new ButtonView("Back");

			if(backgroundUrl!=null)
			{
				var image:Image = new Image();
				image.setImage(backgroundUrl);
				this.backgroundImage = image;
				
			}
			if(backButtonBackgroundUrl!=null)
			{
				_backButton.backgroundImageUrl = backButtonBackgroundUrl;
			}
			if(backButtonHighlightedBackgroundUrl!=null)
			{
				_backButton.backgroundImageHighlightedUrl = backButtonHighlightedBackgroundUrl;
			}
			_backButton.initView();
		}
		
		override public function layoutView():void{
			for (var i:int = 0; i < this.numChildren; i++) 
			{
				if(this.getChildAt(i) is View)
				{
					var view:View = View(this.getChildAt(i));
					if(view is ButtonView)
					{
						view.width = BACK_BUTTON_WIDTH;
						view.height = BACK_BUTTON_HEIGHT;
						view.x = BACK_BUTTON_X;
						view.y = (this.height - view.height)/2;

					}
				}
			} 
			super.layoutChildren();
		}
		
		
		public function setbackButtonBackgrounds(backButtonBackgroundUrl:String, backButtonHighlightedBackgroundUrl:String):void
		{
			if(backButtonBackgroundUrl!=null)
			{
				_backButton.backgroundImageUrl = backButtonBackgroundUrl;
			}
			if(backButtonHighlightedBackgroundUrl!=null)
			{
				_backButton.backgroundImageHighlightedUrl = backButtonHighlightedBackgroundUrl;
			}
			_backButton.initView();
		}

		public function displayBackButton():void
		{
			if(!this.contains(_backButton))
			{
				this.addChild(_backButton);
			}
		}
		
		public function hideBackButton():void
		{
			if(this.contains(_backButton))
			{
				this.removeChild(_backButton);
			}
		}
		
		public function get backButton():ButtonView
		{
			return _backButton;
		}
		
	}
}