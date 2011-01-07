//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2010 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.support
{
	import com.jeremyruppel.routing.core.IRoute;
	import com.jeremyruppel.routing.events.RouteEvent;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  27.09.2010
	 */
	public class TestRouteEvent extends RouteEvent
	{
	
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
	
		/**
		 * @private
		 */
		public static const TEST : String = 'TestRouteEvent.test';
		
		/**
		 * @private
		 */
		public static const FIRST : String = 'TestRouteEvent.first';
		
		/**
		 * @private
		 */
		public static const SECOND : String = 'TestRouteEvent.second';
		
		/**
		 * @private
		 */
		public static const THIRD : String = 'TestRouteEvent.third';
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 * @constructor
		 */
		public function TestRouteEvent( type : String, route : IRoute )
		{
			super( type, route );
		}
	}

}
