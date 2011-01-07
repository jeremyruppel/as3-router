//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2010 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.routes
{
	import com.jeremyruppel.routing.core.IRoute;
	import com.jeremyruppel.routing.routes.RegExpRoute;
	import com.jeremyruppel.routing.utils.bookend;
	import com.jeremyruppel.routing.utils.capture;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.array;
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
	 * @since  27.09.2010
	 */
	public class RegExpRouteFixture
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
			var match : Array = new RegExp( bookend( capture( '/home/:first/:second/*' ) ) ).exec( '/home/one/two/three' );
			
			route = new RegExpRoute( match );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="route value returns the first value in its array")]
		public function test_route_value_returns_the_first_value_in_its_array( ) : void
		{
			assertThat( route.value, equalTo( '/home/one/two/three' ) );
		}
		
		[Test(description="route params lets you access named routes")]
		public function test_route_params_lets_you_access_named_routes( ) : void
		{
			assertThat( route.params( 'first' ), equalTo( 'one' ) );
			assertThat( route.params( 'second' ), equalTo( 'two' ) );
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
			
			assertThat( route.captures, array( 'one', 'two', 'three' ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function RegExpRouteFixture( )
		{
		}
	
	}

}
