package xtremelabs.common.framework.ui.buttons
{
	import flash.events.Event;
	
	public class ImageToggleButtonEvent extends Event
	{
		public static const CLICK:String = "click";
		
		public function ImageToggleButtonEvent(type:String)
		{
			super(type);
		}
	}
}