package xtremelabs.common.framework.ui.buttons
{
	import flash.display.Bitmap;
	import flash.display.BlendMode;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import qnx.ui.core.UIComponent;
	import qnx.ui.display.Image;
	import qnx.ui.skins.SkinStates;
	import qnx.ui.text.Label;
	
	import xtremelabs.common.framework.ui.View;
	import xtremelabs.common.framework.ui.text.EllipsisTextField;
	
	public class ImageBaseButton extends View
	{
		private var _bitmap:Bitmap;
		private var _bitmapHL:Bitmap;
		private var _image:Image;
		
		private var _text:String;
		private var _textFormat:TextFormat;
		private var _label:EllipsisTextField = new EllipsisTextField();
		private var _align:String = ImageBaseButtonAlign.MID;
		private var _alignPadding:int = 10;
		private var _textColor:uint = 0xffffff;
		private var _textColorHL:uint = 0xffffff;
		
		private var _state:String;
		
		private var _isFocused:Boolean = false;
		
		public function ImageBaseButton(bitmap:Bitmap, bitmapHL:Bitmap=null, text:String="", w:int=0, h:int=0)
		{
			buttonMode = true;
			
			_bitmap = bitmap;
			if(bitmapHL) {
				_bitmapHL = bitmapHL;
			}
			
			_image = new Image();
			_image.setImage(_bitmap);
			
			addChild(_image);
			
			_textFormat = defaultTextFormat;
			_text = text;
			formateLabel();
			
			if(w>0 && h>0) {
				setSize(w, h);
			}else {
				setSize(bitmap.width, bitmap.height);
			}
			
			_state = SkinStates.UP;
			
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		
		private function formateLabel():void {
			_label.cacheAsBitmap = true;
			_label.blendMode = BlendMode.LAYER;
			_label.defaultTextFormat = _textFormat;
			_label.text = _text;
			_label.autoSize = TextFieldAutoSize.CENTER;
			addChild(_label);
		}
		
		override public function layout(w:int, h:int):void
		{
			super.layout(w, h);
			
			if(_image)	{
				_image.setSize(w, h);
				_image.setImage(isFocused ? _bitmapHL : _bitmap);
			}
			
			_label.trimText(_bitmap.width*0.9);
			
			_label.y = (h-_label.height)/2;
			switch(align) {
				case ImageBaseButtonAlign.LEFT:
					_label.x = alignPadding;
					break;
				case ImageBaseButtonAlign.MID:
					_label.x = (w-_label.width)/2;
					break;
				case ImageBaseButtonAlign.RIGHT:
					_label.x = w - alignPadding;
					break;
			}
		}
		
		protected function onMouseDown(event:MouseEvent):void {
			// to override
		}
		
		protected function onMouseUp(event:MouseEvent):void {
			// to override
		}
		
		protected function onMouseOut(event:MouseEvent):void {
			// tp override
		}
		
		public function get state():String
		{
			return _state;
		}
		
		public function set state(value:String):void
		{
			_state = value;
		}
		
		public function focus():void {
			if(_isFocused==true)	return;
			
			_isFocused = true;
			
			_label.textColor = textColorHL;
			if(_bitmapHL) {
				_image.setImage(_bitmapHL);
			}else {
				alpha = 0.5;
			}
		}
		
		public function unfocus():void {
			if(_isFocused==false)	return;
			
			_isFocused = false;
			
			_label.textColor = textColor;
			if(_bitmapHL) {
				_image.setImage(_bitmap);
			}else {
				alpha = 1.0;
			}
		}
		
		public function get isFocused():Boolean
		{
			return _isFocused;
		}

		public function set isFocused(value:Boolean):void
		{
			_isFocused = value;
		}

		public function set text(value:String):void {
			_label.text = value;
			relayout();
		}
		
		public function get defaultTextFormat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.color = textColor;
			format.size = int(_bitmap.height/2.2);
			format.bold = true;
			format.align = TextFormatAlign.LEFT;
			format.font = "Helvetica";
			return format;
		}
		
		public function set textFormat(format:TextFormat):void {
			_textFormat = format;
			formateLabel();
			relayout();
		}

		public function get align():String
		{
			return _align;
		}

		public function set align(value:String):void
		{
			_align = value;
			relayout();
		}

		public function get textColor():uint
		{
			return _textColor;
		}

		public function set textColor(value:uint):void
		{
			_textColor = value;
			if(state==SkinStates.UP) {
				_label.textColor = textColor;
			}
		}

		public function get textColorHL():uint
		{
			return _textColorHL;
		}

		public function set textColorHL(value:uint):void
		{
			_textColorHL = value;
			if(state!=SkinStates.UP) {
				_label.textColor = textColorHL;
			}
		}

		public function get text():String
		{
			return _text;
		}

		public function get textFormat():TextFormat
		{
			return _textFormat;
		}

		public function get label():EllipsisTextField
		{
			return _label;
		}

		public function set label(value:EllipsisTextField):void
		{
			_label = value;
		}

		public function get bitmap():Bitmap
		{
			return _bitmap;
		}

		public function set bitmap(value:Bitmap):void
		{
			_bitmap = value;
		}

		public function get bitmapHL():Bitmap
		{
			return _bitmapHL;
		}

		public function set bitmapHL(value:Bitmap):void
		{
			_bitmapHL = value;
		}

		public function get image():Image
		{
			return _image;
		}

		public function set image(value:Image):void
		{
			_image = value;
		}

		public function get alignPadding():int
		{
			return _alignPadding;
		}

		public function set alignPadding(value:int):void
		{
			_alignPadding = value;
		}


	}	
}