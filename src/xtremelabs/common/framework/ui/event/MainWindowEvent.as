package xtremelabs.common.framework.ui.event
{
	import flash.events.Event;
	
	public class MainWindowEvent extends Event
	{
		public static const POPUP_VIEW_SHOWED:String = "popup view showed";
		public static const POPUP_VIEW_DISMISSED:String = "popup view dismissed";
		
		public function MainWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}