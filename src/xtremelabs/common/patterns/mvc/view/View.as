package xtremelabs.common.patterns.mvc.view
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import qnx.ui.core.UIComponent;
	import qnx.ui.display.Image;
	
	import xtremelabs.common.patterns.mvc.controller.ViewListener;
	
	/**
	 * Base Class to be used for all UI elements
	 * 
	 * 
	 **/
	public class View extends UIComponent 
	{
		
		protected var _backgroundColour:uint;
		protected var _backgroundImage:Image;
		private var _backgroundImageUrl:String;
		protected var _viewListener:ViewListener;

		public function layoutChildren():void{
			for (var i:int = 0; i < this.numChildren; i++) 
			{
				if(this.getChildAt(i) is View)
				{
					var view:View = View(this.getChildAt(i));
					if(view != null)
					{
						view.layoutView();
					}
				}
			}
		}
		
		public function paintView():void
		{
			paintBackground();
			paintChildren();
		}
		
		public function paintChildren():void{
			for (var i:int = 0; i < this.numChildren; i++) 
			{
				if(this.getChildAt(i) is View)
				{
					var view:View = View(this.getChildAt(i));
					if(view != null)
					{
						view.paintView();
					}
				}
			}
		}
		
		public function paintBackground():void{
			
			if(_backgroundImage == null)
			{
				this.graphics.beginFill(_backgroundColour, this.alpha);
				this.graphics.drawRect(0, 0, this.width, this.height);
				this.graphics.endFill();
			} else
			{
				this.graphics.drawRect(0, 0, this.width, this.height);
			}
			
		}
		
		public function set backgroundColour(colour:uint):void{
			_backgroundColour = colour;
		}
		
		protected function set backgroundImage(bitmap:Image):void{
			_backgroundImage = bitmap;
		}
		
		protected function get backgroundImage():Image{
			return _backgroundImage;
		}
		
		public function get backgroundImageUrl():String
		{
			return _backgroundImageUrl;
		}
		
		/**
		 * Sets the backgroundImage
		 * (Makes a call internally to add an actual image to the screen)
		 * 
		 **/
		public function set backgroundImageUrl(value:String):void
		{
			if(_backgroundImage != null && value != _backgroundImageUrl)
			{
				this.removeChild(_backgroundImage);
			}
			_backgroundImageUrl = value;

			if(_backgroundImage == null)
			{
				_backgroundImage = new Image();
				_backgroundImage.setImage(_backgroundImageUrl);
				_backgroundImage.addEventListener(Event.COMPLETE, backgroundLoaded);
			}else
			{
				_backgroundImage.setImage(_backgroundImageUrl);
				_backgroundImage.addEventListener(Event.COMPLETE, backgroundLoaded);
			}
			this.addChild(_backgroundImage);
		}
		
		private function backgroundLoaded(event:Event):void{
			_backgroundImage.removeEventListener(Event.COMPLETE, backgroundLoaded);
			this.layoutView();
		}
		
		/*
		 * **************************************************************** 
		 * Methods that must be overriden for custom functionality 
		 * **************************************************************** 
		 **/
	
		/**
		 *  Inits the current view.  Override this method for any custom classes 
		 *  that needs additional items initialized.  This method is intended to 
		 *  be used for leaf nodes in the display hierarchy. 
		 * 
		 *  Classes that override this method should do so in the following manner
		 * <p>
		 * <code><p>
		 * public function initView():void {</p>
		 * 
		 * 		<p>//insert custom code here</p>
		 * 		<p>super.initView(); It is important to always end the method call with super.</p>
		 * <p>}</p>
		 * </code>
		 * </p>
		 * 
		 **/
		public function initView():void{
			if(_backgroundImage != null && !this.contains(_backgroundImage))
			{
				this.addChildAt(_backgroundImage, 0);
			}
			for (var i:int = 0; i < this.numChildren; i++) 
			{
				if(this.getChildAt(i) is View)
				{
					var view:View = View(this.getChildAt(i));
					if(view != null)
					{
						view.initView();
					}
				}
			}
		}
		
		/**
		 *  Inits the current view.  Override this method for any custom classes 
		 *  that needs additional items initialized.  This method is intended to 
		 *  be used for nodes in the display hierarchy that will have children. 
		 * 
		 *  
		 **/
		public function initWithSubViews(views:Vector.<View>):void{
			
			for each (var view:View in views) {
				this.addChild(view);
//				view.initView();
			}
			initView();
		}
		
		/**
		 *  Lays out the current view.  Override this method for any custom classes 
		 *  that require custom layout.  
		 *  
		 *  Classes that override this method should do so in the following manner
		 * <p>
		 * <code><p>
		 * public function layoutView():void {</p>
		 * 
		 * 		<p>//insert custom code here</p>
		 * 		<p>super.layoutView(); It is important to always end the method call with super.</p>
		 * <p>}</p>
		 * </code>
		 * </p>
		 * 
		 **/
		public function layoutView():void
		{
			if(_backgroundImage!= null && _backgroundImage.width != this.width && this.visible)
			{
				_backgroundImage.width = this.width;
				_backgroundImage.height =  this.height;
			}
			layoutChildren();
		}
	}
}