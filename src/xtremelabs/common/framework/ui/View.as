package xtremelabs.common.framework.ui
{
	import flash.display.Sprite;
	
	import qnx.ui.core.Container;
	import qnx.ui.core.SizeUnit;
	import qnx.ui.core.UIComponent;
	
	public class View extends UIComponent 
	{
		private var _backgroundColor:uint = 0x000000;
		private var _backgroundAlpla:Number = 1.0;
		private var _enableBackground:Boolean = false;
		
		public function View()
		{
			super();
		}
		
		public function layout(w:int, h:int):void {
			// to override
		}	
		
		public function relayout():void {
			layout(width, height);
		}
		
		override public function setSize(w:Number, h:Number):void
		{
			if(!w>0 || !h>0)	return;
			
			layout(w, h);
			
			super.setSize(w, h);
			
		}
		
		override protected function draw():void
		{
			graphics.clear();
			
			if(!width>0 || !height>0)	return;
			
			if(_enableBackground) {
				graphics.beginFill(_backgroundColor, _backgroundAlpla);
				graphics.drawRect(0, 0, width, height);
				graphics.endFill();
			}else {
				graphics.drawRect(0, 0, width, height);
			}
		}
		
		public function get backgroundColor():uint
		{
			return _backgroundColor;
		}
		
		public function set backgroundColor(value:uint):void
		{
			_enableBackground = true;
			_backgroundColor = value;
			invalidate();
		}

		public function get backgroundAlpla():Number
		{
			return _backgroundAlpla;
		}

		public function set backgroundAlpla(value:Number):void
		{
			_backgroundAlpla = value;
		}

		public function get enableBackground():Boolean
		{
			return _enableBackground;
		}

		public function set enableBackground(value:Boolean):void
		{
			_enableBackground = value;
		}
	}
}