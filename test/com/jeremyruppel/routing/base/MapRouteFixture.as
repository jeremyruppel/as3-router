//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.base
{
	import com.jeremyruppel.routing.base.Router;
	import com.jeremyruppel.routing.core.IRouter;
	import com.jeremyruppel.routing.events.RouteEvent;
	import com.jeremyruppel.routing.support.TestRouteEvent;
	import org.flexunit.async.Async;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.object.isTrue;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  10.09.2010
	 */
	public class MapRouteFixture
	{
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var router : IRouter;
		
		//--------------------------------------
		//  SETUP
		//--------------------------------------
		
		[Before]
		public function setup( ) : void
		{
			router = new Router( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="map route matches a string route")]
		public function test_map_route_matches_a_string_route( ) : void
		{
			router.mapRoute( '/home', TestRouteEvent.TEST );
			
			assertThat( router.hasRoute( '/home' ), isTrue( ) );
		}
		
		[Test(description="map route matches a string route exactly")]
		public function test_map_route_matches_a_string_route_exactly( ) : void
		{
			router.mapRoute( '/home', TestRouteEvent.TEST );
			
			assertThat( router.hasRoute( '/homeopathy' ), isFalse( ) );
			assertThat( router.hasRoute( '/home/page' ), isFalse( ) );
			assertThat( router.hasRoute( '/site/home' ), isFalse( ) );
		}
		
		[Test(async,description="map route maps an event to a string route")]
		public function test_map_route_maps_an_event_to_a_string_route( ) : void
		{
			Async.proceedOnEvent( this, router.eventDispatcher, TestRouteEvent.TEST, 500 );
			
			router.mapRoute( '/home', TestRouteEvent.TEST );
			
			router.route( '/home' );
		}
		
		[Test(async,description="map route provides a route event to handler with accurate information about route")]
		public function test_map_route_provides_a_route_event_to_handler_with_accurate_information_about_route( ) : void
		{
			var handler : Function = Async.asyncHandler( this, function( event : RouteEvent, data : Object ) : void
			{
				assertThat( event.route.value, equalTo( '/home' ) );
			}, 500 );
			
			router.eventDispatcher.addEventListener( TestRouteEvent.TEST, handler );
			
			router.mapRoute( '/home', TestRouteEvent.TEST );
			
			router.route( '/home' );
		}
		
		[Test(async,description="map route provides a route event to handler with accurate capture information")]
		public function test_map_route_provides_a_route_event_to_handler_with_accurate_capture_information( ) : void
		{
			var handler : Function = Async.asyncHandler( this, function( event : RouteEvent, data : Object ) : void
			{
				assertThat( event.route.params( 'user' ), equalTo( 'jbone' ) );
			}, 500 );
			
			router.eventDispatcher.addEventListener( TestRouteEvent.TEST, handler );
			
			router.mapRoute( '/users/:user', TestRouteEvent.TEST );
			
			router.route( '/users/jbone' );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function MapRouteFixture( )
		{
		}
	
	}

}
