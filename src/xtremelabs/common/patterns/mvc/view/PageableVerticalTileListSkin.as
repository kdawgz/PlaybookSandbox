package xtremelabs.common.patterns.mvc.view
{
	import qnx.ui.listClasses.ICellRenderer;
	
	public class PageableVerticalTileListSkin extends View implements ICellRenderer
	{
		
		protected var _data:Object;
		protected var _index:int;
		protected var _isHeader:Boolean;
		protected var _row:int;
		protected var _section:int;
		protected var _state:String;
		protected var _column:int;
		
		public function PageableVerticalTileListSkin()
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


	}
}