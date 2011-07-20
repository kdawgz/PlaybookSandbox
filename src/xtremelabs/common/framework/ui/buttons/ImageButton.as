package xtremelabs.common.framework.ui.buttons
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.setTimeout;
	
	import qnx.ui.core.UIComponent;
	import qnx.ui.display.Image;
	import qnx.ui.skins.SkinStates;
	
	public class ImageButton extends ImageBaseButton {
		private var _focusDelayEnable:Boolean = false;
		
		
		public function ImageButton(image:*, imageHL:*=null, text:String="", w:Number=0, h:Number=0) {
			var bitmap:Bitmap, bitmapHL:Bitmap;
			
			if(image is Bitmap) {
				bitmap = image
			}else if(image is BitmapData) {
				bitmap = new Bitmap(image);
			}
			
			if(imageHL is Bitmap) {
				bitmapHL = imageHL;
			}else if(imageHL is BitmapData){
				bitmapHL = new Bitmap(imageHL);
			}
			
			super(bitmap, bitmapHL, text, w, h);
		}	
		
		override protected function onMouseDown(event:MouseEvent):void {
			state = SkinStates.DOWN;
			if(focusDelayEnable) {
				setTimeout(onTimeout, 250);
			}else {
				if(state==SkinStates.DOWN)	focus();
			}
			
			function onTimeout():void {
				if(state==SkinStates.DOWN)	focus();
			}
		}
		
		override protected function onMouseUp(event:MouseEvent):void {
			if(state!=SkinStates.DOWN) return;
			
			state = SkinStates.UP;
			unfocus();
		}
		
		override protected function onMouseOut(event:MouseEvent):void {
			if(state==SkinStates.DOWN) {
				state = SkinStates.UP;
				unfocus();
			}
		}
		
		public function get focusDelayEnable():Boolean
		{
			return _focusDelayEnable;
		}
		
		public function set focusDelayEnable(value:Boolean):void
		{
			_focusDelayEnable = value;
		}
		
	}
}