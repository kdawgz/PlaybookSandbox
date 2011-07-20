package xtremelabs.common.framework.ui.tabbase
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import xtremelabs.common.framework.ui.View;
	
	public class TabBarItem extends Sprite
	{
		public static var LEFT:String = "left";
		public static var MID:String = "mid";
		public static var RIGHT:String = "right";
		
		public static var WIDTH:int = 157;
		public static var HEIGHT:int = 57;
		public static var FONT_SIZE:int = 17;
		
		private var _title:String;
		private var _type:String;
		private var _selected:Boolean;
		
		private var _buttonBackground:Bitmap;
		private var _buttonBackgroundHL:Bitmap;
		private var _label:TextField;
		
		public function TabBarItem(title:String, type:String)
		{
			super();
			
			_title = title;
			_type = type;
			_selected = false;
			
			initBackground();
			addLabel();
			
			buttonMode = true;
			
//			setSize(WIDTH, HEIGHT);
		}
		
		private function initBackground():void {
			switch(_type) {
				case LEFT:
					_buttonBackground = new Bitmap(new TabButtonLeft);
					_buttonBackgroundHL = new Bitmap(new TabButtonLeftHL);
					break;
				case MID:
					_buttonBackground = new Bitmap(new TabButtonMid);
					_buttonBackgroundHL = new Bitmap(new TabButtonMidHL);
					break;
				case RIGHT:
					_buttonBackground = new Bitmap(new TabButtonRight);
					_buttonBackgroundHL = new Bitmap(new TabButtonRightHL);
					break;
			}
			addChild(_buttonBackground);
		}
		
		private function addLabel():void {
			_label = new TextField();
			_label.autoSize = TextFieldAutoSize.CENTER;
			_label.text = _title;
			_label.selectable = false;
			_label.x = (WIDTH-_label.textWidth)/2;
			_label.y = (HEIGHT-_label.textHeight)/2 - 8;
			setTextFormat();
			
			addChild(_label);
		}
		
		public function select():void {
			if(!_selected) {
				addChildAt(_buttonBackgroundHL, getChildIndex(_buttonBackground));
				removeChild(_buttonBackground);
				_selected = true;
				setTextFormat();
			}
		}
		
		public function deselect():void {
			if(_selected) {
				addChildAt(_buttonBackground, getChildIndex(_buttonBackgroundHL));
				removeChild(_buttonBackgroundHL);
				_selected = false;
				setTextFormat();
			}
		}
		
		private function setTextFormat():void {
			var format:TextFormat = new TextFormat();
			format.align = "center";
			format.size = FONT_SIZE;
			format.font = "Helvetica";
			format.color = isSelected ? 0xffffff : 0x8E8E8E;
			
			_label.defaultTextFormat = format;
			_label.text = _title;
		}

		public function get isSelected():Boolean {
			return _selected;
		}
		
	}
}