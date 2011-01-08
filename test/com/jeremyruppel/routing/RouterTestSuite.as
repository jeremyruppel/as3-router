//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2011 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing
{
	import com.jeremyruppel.routing.base.MapPatternFixture;
	import com.jeremyruppel.routing.base.MapQueryFixture;
	import com.jeremyruppel.routing.base.MapRouteFixture;
	import com.jeremyruppel.routing.base.RouteFixture;
	import com.jeremyruppel.routing.base.RouterFixture;
	import com.jeremyruppel.routing.routes.HashRouteFixture;
	import com.jeremyruppel.routing.routes.RegExpRouteFixture;
	import com.jeremyruppel.routing.rules.HashRuleFixture;
	import com.jeremyruppel.routing.rules.RegExpRuleFixture;
	import com.jeremyruppel.routing.utils.BookendFixture;
	import com.jeremyruppel.routing.utils.CaptureFixture;
	import com.jeremyruppel.routing.utils.ParseFixture;
	import com.jeremyruppel.routing.utils.QueryFixture;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  08.09.2010
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class RouterTestSuite
	{
		//--------------------------------------
		//  TEST FIXTURES
		//--------------------------------------
	
		// routing.base               : contains the base classes for the suite
		public var mapPatternFixture  : MapPatternFixture;
		public var mapQueryFixture    : MapQueryFixture;
		public var mapRouteFixure     : MapRouteFixture;
		public var routeFixture       : RouteFixture;
		public var routerFixture      : RouterFixture;
		
		// routing.routes             : contains various route types
		public var hashRouteFixture   : HashRouteFixture;
		public var regExpRouteFixture : RegExpRouteFixture;
		
		// routing.rules              : contains various route rules to match routes
		public var hashRuleFixture    : HashRuleFixture;
		public var regExpRuleFixture  : RegExpRuleFixture;
		
		// routing.utils              : contains helper methods and utilities
		public var bookendFixture     : BookendFixture;
		public var captureFixture     : CaptureFixture;
		public var parseFixture       : ParseFixture;
		public var queryFixture       : QueryFixture;
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function RouterTestSuite( )
		{
		}
	
	}

}
