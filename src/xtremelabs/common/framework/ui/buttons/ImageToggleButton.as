package xtremelabs.common.framework.ui.buttons
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	import flash.utils.setTimeout;
	
	import qnx.ui.core.UIComponent;
	import qnx.ui.display.Image;
	import qnx.ui.skins.SkinStates;
	
	public class ImageToggleButton extends ImageBaseButton
	{
		private var _selectable:Boolean;
		private var _selected:Boolean;
		
		public function ImageToggleButton(imageValue:*, imageValueHL:*, text:String="", 
										  isSelected:Boolean=false, selectable:Boolean=true, w:int=0, h:int=0) {
			var bitmap:Bitmap, bitmapHL:Bitmap;
			
			if(imageValue is Bitmap) {
				bitmap = imageValue
			}else if(imageValue is BitmapData) {
				bitmap = new Bitmap(imageValue);
			}
			
			if(imageValueHL is Bitmap) {
				bitmapHL = imageValueHL;
			}else if(imageValueHL is BitmapData){
				bitmapHL = new Bitmap(imageValueHL);
			}
			
			super(bitmap, bitmapHL, text, w, h);

			_selected = isSelected;
			_selectable = selectable;
			state = SkinStates.UP;
			
			if(isSelected) {
				image.setImage(bitmapHL);
			}
			
			addEventListener(MouseEvent.CLICK, onMouseClick);
			
			if(w>0 && h>0) {
				setSize(w, h);
			}else {
				setSize(bitmap.width, bitmap.height);
			}
		}
		
		private function onMouseClick(event:MouseEvent):void {
			if(!_selectable)	return;
			
			if(selected) {
				unselect();
			}else if(!selected){
				select();
			}
		}
		
		public function select():void {
			_selected = true;
			focus();
		}
		
		public function unselect():void {
			_selected = false;
			unfocus();
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}
		
		public function get selectable():Boolean
		{
			return _selectable;
		}
		
		public function set selectable(value:Boolean):void
		{
			_selectable = value;
		}
		
		
	}
}