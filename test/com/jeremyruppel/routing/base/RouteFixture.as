//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2011 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.base
{
	import com.jeremyruppel.routing.base.Route;
	import com.jeremyruppel.routing.core.IRoute;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.emptyArray;
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
	public class RouteFixture
	{
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="route accepts a string value and stores it")]
		public function test_route_accepts_a_string_value_and_stores_it( ) : void
		{
			var route : IRoute = new Route( 'anything' );
			
			assertThat( route.value, equalTo( 'anything' ) );
		}
		
		[Test(description="by default route captures is an empty array")]
		public function test_by_default_route_captures_is_an_empty_array( ) : void
		{
			var route : IRoute = new Route( 'anything' );
			
			assertThat( route.captures, emptyArray( ) );
		}
		
		[Test(description="by default route params all return null")]
		public function test_by_default_route_params_all_return_null( ) : void
		{
			var route : IRoute = new Route( 'anything' );
			
			assertThat( route.params( 'something' ), nullValue( ) );
			assertThat( route.params( 'value' ), nullValue( ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function RouteFixture( )
		{
		}
	
	}

}
