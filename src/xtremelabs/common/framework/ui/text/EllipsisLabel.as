package xtremelabs.common.framework.ui.text
{
	import qnx.ui.text.Label;
	
	public class EllipsisLabel extends Label
	{
		private var _realText:String = "";
		
		public function EllipsisLabel()
		{
			super();
		}
		
		override public function set text(str:String):void
		{
			super.text = str;
			_realText = str;
			trimText();
		}
		
		override public function setSize(w:Number, h:Number):void
		{
			super.setSize(w, h);
			super.text = _realText;
			trimText();
		}
		
		private function trimText():void {
			if(!_realText)	return;
	
			if(textWidth > width*0.9) {
			
			var ot:String = text;
 			super.text = ot;
			
			for (var i:int=0; i < _realText.length; i++) {
				super.text = _realText.substring(0, i);
				if (textWidth >= width*0.9) {
					break;
				}
			}
			super.text = text + "...";
			}
		}
		
		
	}
}