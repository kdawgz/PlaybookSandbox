package xtremelabs.common.framework.ui.buttons
{
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	import qnx.ui.display.Image;
	import qnx.ui.skins.SkinStates;
	
	public class FocusableImage extends Image
	{
		private var _focusDelayEnable:Boolean = false;
		private var _state:String = SkinStates.UP;
		
		public function FocusableImage()
		{
			super();
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		
		private function onMouseDown(event:MouseEvent):void {
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
		
		private function onMouseUp(event:MouseEvent):void {
			if(state!=SkinStates.DOWN) return;
			
			state = SkinStates.UP;
			unfocus();
		}

		private function onMouseOut(event:MouseEvent):void {
			if(state==SkinStates.DOWN) {
				state = SkinStates.UP;
				unfocus();
			}
		}
		
		public function focus():void {
			alpha = 0.5;
		}
		
		public function unfocus():void {
			alpha = 1.0;
		}
		
		public function get focusDelayEnable():Boolean
		{
			return _focusDelayEnable;
		}

		public function set focusDelayEnable(value:Boolean):void
		{
			_focusDelayEnable = value;
		}

		public function get state():String
		{
			return _state;
		}

		public function set state(value:String):void
		{
			_state = value;
		}


	}
}