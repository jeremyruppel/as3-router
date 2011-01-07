//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2010 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.routes
{
	import com.jeremyruppel.routing.core.IRoute;
	import com.jeremyruppel.routing.routes.HashRoute;
	import com.jeremyruppel.routing.utils.query;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.hasItems;
	import org.hamcrest.core.anyOf;
	import org.hamcrest.core.isA;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.nullValue;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  28.09.2010
	 */
	public class HashRouteFixture
	{
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var route : IRoute;
		
		//--------------------------------------
		//  SETUP
		//--------------------------------------
		
		[Before]
		public function setup( ) : void
		{
			var hash : Object = { page : 'home', user : 'jbone', referrer : 'olm' };
			
			route = new HashRoute( query( hash ), hash );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="route value returns the query string for the route")]
		public function test_route_value_returns_the_query_string_for_the_route( ) : void
		{
			assertThat( route.value, anyOf(
				equalTo( '?page=home&user=jbone&referrer=olm' ),
				equalTo( '?page=home&referrer=olm&user=jbone' ),
				equalTo( '?user=jbone&page=home&referrer=olm' ),
				equalTo( '?user=jbone&referrer=olm&page=home' ),
				equalTo( '?referrer=olm&user=jbone&page=home' ),
				equalTo( '?referrer=olm&page=home&user=jbone' ) ) );
		}
		
		[Test(description="route params lets you access named routes")]
		public function test_route_params_lets_you_access_named_routes( ) : void
		{
			assertThat( route.params( 'page' ), equalTo( 'home' ) );
			assertThat( route.params( 'user' ), equalTo( 'jbone' ) );
			assertThat( route.params( 'referrer' ), equalTo( 'olm' ) );
		}
		
		[Test(description="route params returns null for captures that are not declared")]
		public function test_route_params_returns_null_for_captures_that_are_not_declared( ) : void
		{
			assertThat( route.params( 'nope' ), nullValue( ) );
		}
		
		[Test(description="route captures yields an array with all captures")]
		public function test_route_captures_yields_an_array_with_all_captures( ) : void
		{
			assertThat( route.captures, isA( Array ) );
			
			assertThat( route.captures, hasItems( 'home', 'jbone', 'olm' ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function HashRouteFixture( )
		{
		}
	
	}

}
