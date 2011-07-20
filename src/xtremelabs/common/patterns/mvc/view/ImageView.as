package xtremelabs.common.patterns.mvc.view
{
	import caurina.transitions.Tweener;
	
	import flash.events.Event;
	import flash.sampler.getInvocationCount;
	
	import qnx.events.ImageCacheEvent;
	import qnx.ui.display.Image;
	import qnx.utils.ImageCache;

	
	/**
	 * A view to be used in displaying an image
	 * 
	 * 
	 **/
	public class ImageView extends View
	{
		
		private var _defaultImage:Image;
		private var _loadedImage:Image;
		private var _loadedImageUrl:String;
		private var _defaultListenerCallback:Function; 
		private var _newListenerCallback:Function;
		
		public function ImageView(defaultImageUrl:String = null)
		{
			super();
			_defaultImage = new Image();
			_defaultImage.setImage(defaultImageUrl);
			_loadedImage = new Image();
		}
		
		override public function initView():void
		{
			this.addChild(_defaultImage);
			this.addChildAt(_loadedImage,0);
			_defaultImage.addEventListener(Event.COMPLETE, defaultImageLoaded);
			super.initView();
		}
		
		override public function layoutView():void
		{
			if(_loadedImage!= null && _loadedImage.width != this.width)
			{
				_loadedImage.width = this.width;
				_loadedImage.height =  this.height;
			}
			this.layoutChildren();
		}
	
		
		public function loadImage(loadedImageUrl:String):void
		{
			if(_loadedImageUrl != loadedImageUrl)
			{
				_loadedImageUrl = loadedImageUrl;
				_loadedImage.setImage(loadedImageUrl);
				_loadedImage.addEventListener(Event.COMPLETE, newImageLoaded);
			}
		}

		
		private function defaultImageLoaded(event:Event):void{

			if(_defaultListenerCallback!=null)
			{
				_defaultListenerCallback.call(null,event);
			}
			_defaultImage.removeEventListener(Event.COMPLETE, defaultImageLoaded);
			this.layoutView();
		}
		
		private function newImageLoaded(event:Event):void{
			
			if(_newListenerCallback != null)
			{
				_newListenerCallback.call(null,event);
				
			}
			_loadedImage.removeEventListener(Event.COMPLETE, newImageLoaded);
			this.layoutView();
			if(this.contains(_defaultImage))
			{
				Tweener.addTween(_defaultImage, {alpha:0.0, time:2.0, onComplete:fadeComplete});
			}
		}
		
		public function setDefaultImageLoadedCallback(listener:Function):void
		{
			_defaultListenerCallback = listener;
		}
		
		public function setNewImageLoadedCallback(listener:Function):void
		{
			_newListenerCallback = listener;
		}
		
		public function fadeComplete():void
		{
			if (this.contains(_defaultImage))
			{
				this.removeChild(_defaultImage);
			}
		}
	}
}