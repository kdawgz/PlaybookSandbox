package xtremelabs.common.patterns.mvc.view
{
	import flash.events.Event;
	
	import qnx.ui.display.Image;
	
	/**
	 * Base Class to be used for UI elements that will switch backgrounds when focused
	 * 
	 * 
	 **/
	public class FocusableView extends View
	{
		protected var _backgroundImageHighlighted:Image;
		private var _backgroundImageHighlightedUrl:String;
		private var _isHighlighted:Boolean;
		
		

		override public function initView():void{
			this.highlighted = false;
			super.initView();
		}
		
		override public function initWithSubViews(views:Vector.<View>):void{
			for each (var view:View in views) {
				this.addChild(view);
				//view.initView();
			}
			this.highlighted = false;
			super.initView();
		}
		
		protected function set backgroundImageHighlighted(bitmap:Image):void{
			_backgroundImageHighlighted = bitmap;
		}
		
		protected function get backgroundImageHighlighted():Image{
			return _backgroundImageHighlighted;
		}
		
		public function get backgroundImageHighlightedUrl():String
		{
			return _backgroundImageHighlightedUrl;
		}
		
		/**
		 * Sets the backgroundImage
		 * (Makes a call internally to add an actual image to the screen)
		 * 
		 **/
		public function set backgroundImageHighlightedUrl(value:String):void
		{
			if(_backgroundImageHighlighted != null && value != _backgroundImageHighlightedUrl)
			{
				this.removeChild(_backgroundImageHighlighted);
			}
			_backgroundImageHighlightedUrl = value;
			if(_backgroundImageHighlighted == null)
			{
				_backgroundImageHighlighted = new Image();
				_backgroundImageHighlighted.setImage(_backgroundImageHighlightedUrl);
				_backgroundImageHighlighted.addEventListener(Event.COMPLETE, backgroundHighlightedLoaded);
			}else
			{
				_backgroundImageHighlighted.setImage(_backgroundImageHighlightedUrl);
				_backgroundImageHighlighted.addEventListener(Event.COMPLETE, backgroundHighlightedLoaded);
			}
			this.addChild(_backgroundImageHighlighted);
		}
//
		private function backgroundHighlightedLoaded(event:Event):void{
			_backgroundImageHighlighted.removeEventListener(Event.COMPLETE, backgroundHighlightedLoaded);
			this.layoutView();
		}
		
		
		public function set highlighted(isHighlighted:Boolean):void
		{
			_isHighlighted = isHighlighted;
			if(_isHighlighted && _backgroundImage!=null && this.contains(_backgroundImage))
			{
				this.removeChild(_backgroundImage);
				this.addChildAt(_backgroundImageHighlighted, 0);
			}else if(!_isHighlighted && _backgroundImageHighlighted!=null && this.contains(_backgroundImageHighlighted))
			{
				this.removeChild(_backgroundImageHighlighted);
				this.addChildAt(_backgroundImage, 0);
			}
			else if(_backgroundImageHighlighted != null && _backgroundImage != null)
			{
				this.addChildAt((_isHighlighted)? _backgroundImageHighlighted : _backgroundImage, 0);
			}
		}
		
		public function get highlighted():Boolean
		{
			return _isHighlighted;	
		}
		
		override public function layoutView():void
		{
			if(_backgroundImageHighlighted!= null && _backgroundImageHighlighted.width != this.width)
			{
				_backgroundImageHighlighted.width = this.width;
				_backgroundImageHighlighted.height =  this.height;
			}
			super.layoutView();
		}
		
	}
	
}