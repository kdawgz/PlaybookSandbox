package xtremelabs.common.framework.ui.text {
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class EllipsisTextField extends TextField {
		
		public function EllipsisTextField() {
			super();
			selectable = false;
		}
		
		public function trimText(maxWidth:int):void {
			if (textWidth > maxWidth) {
				var i:int = length;
				var ot:String = text;
				
				text = "...";
				var ellipsisWidth:int = textWidth;
				text = ot;
				
				for (;i > 0 ; i--) {
					text = text.substring(0, i);
					if (textWidth < maxWidth -ellipsisWidth - 1) {
						break;
					}
				}
				text = text + "...";
			}
		}
	}
}