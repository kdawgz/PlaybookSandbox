package xtremelabs.common.patterns.mvc.controller
{
	import xtremelabs.common.patterns.mvc.view.View;
	
	
	/**
	 * Base View Controller
	 * 
	 * 
	 **/
	public class ViewController
	{
		protected var _view:View;
		protected var _parentViewController:ViewController;
		
		
		public function ViewController(parentViewController:ViewController=null)
		{
			_parentViewController = parentViewController;
		}

		public function get parentViewController():ViewController
		{
			return _parentViewController;
		}
		
		public function set parentViewController(value:ViewController):void
		{
			_parentViewController = value;
		}
		
		public function get view():View
		{
			return _view;
		}
		
		public function set view(value:View):void
		{
			_view = value;
		}
		
		
		
		
		/*
		 * **************************************************************** 
		 * Methods that must be overriden for custom functionality 
		 * **************************************************************** 
		 */
		
		/**
		 * Override this function for your root controller
		 * 
		 * This method is responsible for telling the views to display themselves
		 * AFTER they have been initialized using initViewForController
		 * 
		 **/
		public function displayView():void
		{
			_view.layoutView();
			_view.paintView();
		}
		
		
		/**
		 * Override this function for custom view controllers
		 * 
		 * This method is responsible for initializing/adding views 
		 * so that they are in the proper place in the display hiearchy
		 * 
		 * <p>EXAMPLE</p>
		 * <p>
		 * <code>
		 * <p> override public function initWithView(view:View):void{</p>
		 *	<p>_view = view;</p>
		 *	<p>_view.initView();</p>
		 *	<p>var featuredWindow:FeaturedVideoWindow = featuredView();</p>
		 *	<p>if(featuredWindow.swipableViews == null){</p>
		 *	<p>	_coverFlowItemViewOne = new FeaturedCoverFlowItemView("Loading...", null, null, this);</p>
		 *	<p>	_coverFlowItemViewTwo = new FeaturedCoverFlowItemView("Loading...", null, null, this);</p>
		 *	<p>	_coverFlowItemViewThree = new FeaturedCoverFlowItemView("Loading...", null, null, this);</p>
		 *	<p>	var subViews:Vector = new Vector;</p>
		 *	<p>	subViews.push(_coverFlowItemViewOne, _coverFlowItemViewTwo, _coverFlowItemViewThree);</p>
		 *	<p>	_view.initWithSubViews(subViews);</p>
		 *	<p>}</p>
		 *
		 * <p>}</p>
		 * </code>
		 * </p>
		 * 
		 **/
		public function initWithView(view:View):void
		{
			_view = view;
			_view.initView();
		}
		
	}
}