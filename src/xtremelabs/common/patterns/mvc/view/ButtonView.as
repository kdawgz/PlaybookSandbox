package xtremelabs.common.patterns.mvc.view
{
	
		import flash.display.BlendMode;
		import flash.text.TextField;
		import flash.text.TextFormat;
		
		//[SWF(width="100", height="40", backgroundColor="#000000", frameRate="30")]
		public class ButtonView extends FocusableView {
			protected var _labelField:TextField;
			private var _textColour:uint = 0xAFAFAF;
			private var _textColourHighlighted:uint = 0xFFFFFF;
			private var _title:String;
			private var _fontSize:int = 14;
			
			public function ButtonView(title:String, fontSize:int = 0) {
				super();
				_title = title;
				initFields(title);
				this.backgroundColour = 0x000000;
				if(fontSize!=0)
				{
					_fontSize = fontSize;
				}
			}
			
			public function initFields(title:String):void {
				_labelField = new TextField();
				_labelField.selectable = false;
				_labelField.defaultTextFormat = getTextFormat();
				_labelField.text = title;
				_labelField.cacheAsBitmap = true;
				_labelField.blendMode = BlendMode.LAYER;
				//_labelField.autoSize = "center";
				_labelField.mouseEnabled = false;
				_labelField.textColor = _textColour;
				_labelField.height = _labelField.textHeight+4;
				_labelField.width = _labelField.textWidth+4;
				
			}
			
			override public function initView():void
			{
				
				if (!this.contains(_labelField))
				{
					this.addChild(_labelField);
					this.mouseChildren = false;
				}
				super.initView();
			}
			
			override public function layoutView():void
			{
				_labelField.x = ((this.width-_labelField.width)/2);
				_labelField.y = ((this.height-_labelField.height)/2);
				super.layoutView();
			}
			
			public function getTextFormat():TextFormat
			{
				var textFormat:TextFormat = new TextFormat();
				textFormat.align = "center";
				textFormat.size = _fontSize;
				textFormat.font = "Helvetica";
				return textFormat;
			}

			override public function set highlighted(isHighlighted:Boolean):void
			{
				if (isHighlighted)
				{
					_labelField.textColor = _textColourHighlighted;
				} else
				{
					_labelField.textColor = _textColour;
				}
				super.highlighted = isHighlighted;
			}
			
			public function get textColour():uint
			{
				return _textColour;
			}

			public function set textColour(value:uint):void
			{
				_textColour = value;
				if (!highlighted)
				{
					_labelField.textColor = value;
				}
			}

			public function get textColourHighlighted():uint
			{
				return _textColourHighlighted;
			}

			public function set textColourHighlighted(value:uint):void
			{
				_textColourHighlighted = value;
				if (highlighted)
				{
					_labelField.textColor = value;
				}
			}

			public function get title():String
			{
				return _title;
			}
		
			
		}
}