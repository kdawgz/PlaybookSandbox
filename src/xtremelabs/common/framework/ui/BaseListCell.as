package xtremelabs.common.framework.ui
{
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	
	import qnx.ui.listClasses.ICellRenderer;
	
	public class BaseListCell extends View implements ICellRenderer
	{
		public static const SELECT:String = "select";
		public static const ADD:String = "add";
		public static const DELETE:String = "delete";
		
		protected var _data:Object;
		protected var _index:int;
		protected var _isHeader:Boolean;
		protected var _row:int;
		protected var _section:int;
		protected var _state:String;
		protected var _column:int;
		
		private var _action:String;
		
		public function BaseListCell()
		{
			super();
		}
		
		public function get data():Object
		{
			return _data;
		}
		
		public function set data(value:Object):void
		{
			_data = value;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function set index(value:int):void
		{
			_index = value;
		}
		
		public function get isHeader():Boolean
		{
			return _isHeader;
		}
		
		public function get row():int
		{
			return _row;
		}
		
		public function set row(value:int):void
		{
			_row = value;
		}
		
		public function get section():int
		{
			return _section;
		}
		
		public function set section(value:int):void
		{
			_section = value;
		}
		
		public function get state():String
		{
			return _state;
		}
		
		public function set state(value:String):void
		{
			_state = value;
		}
		
		public function get column():int
		{
			return _column;
		}
		
		public function set column(value:int):void
		{
			_column = value;
		}
		
		public function get action():String
		{
			return _action;
		}
		
		public function set action(value:String):void
		{
			_action = value;
		}
	}
}