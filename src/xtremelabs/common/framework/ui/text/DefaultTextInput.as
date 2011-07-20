package xtremelabs.common.framework.ui.text
{
	import flash.display.BlendMode;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextFormat;
	import flash.ui.Keyboard;
	
	import qnx.ui.text.ReturnKeyType;
	import qnx.ui.text.TextInput;
	
	public class DefaultTextInput extends TextInput
	{		
		private var _defaultText:String = "";
		private var _text:String = "";
		
		private var _passwordMode:Boolean = false;
		
		public function DefaultTextInput(defaultText:String)
		{
			super();
			
			_defaultText = defaultText;
			
			text = _defaultText;
			format = defaultTextInputTextFormat;
			blendMode = BlendMode.LAYER;
			returnKeyType = ReturnKeyType.SEARCH;
			addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
			addEventListener(FocusEvent.FOCUS_OUT, onFocusOut);
		}
		
		private function get defaultTextInputTextFormat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.color = 0x313131;
			format.size = 13;
			format.bold = false;
			format.font = "Helvetica";
			return format;
		}
		
		private function onFocusIn(event:FocusEvent):void {
			text = _text;
			displayAsPassword = passwordMode;
		}
		
		private function onFocusOut(event:FocusEvent):void {
			_text = text;
			
			if(_text=="") {
				text = _defaultText;
				displayAsPassword = false;;
			}			
		}
		
		public function get passwordMode():Boolean {
			return _passwordMode;
		}
		
		public function set passwordMode(bool:Boolean):void {
			_passwordMode = bool;
		}
	}
}