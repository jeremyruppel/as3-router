//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2010 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.base
{
	import com.jeremyruppel.routing.base.Router;
	import com.jeremyruppel.routing.core.IRouter;
	import com.jeremyruppel.routing.events.RouteEvent;
	import com.jeremyruppel.routing.support.TestRouteEvent;
	import com.jeremyruppel.routing.utils.query;
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
	public class MapQueryFixture
	{
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var router : IRouter;
		
		//--------------------------------------
		//  SETUP
		//--------------------------------------
		
		[Before]
		public function startup( ) : void
		{
			router = new Router( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="map query matches an object route")]
		public function test_map_query_matches_an_object_route( ) : void
		{
			router.mapQuery( { page : 'home' }, TestRouteEvent.TEST );
			
			assertThat( router.hasRoute( query( { page : 'home' } ) ), isTrue( ) );
		}
		
		[Test(description="map query can match an object with multiple fields")]
		public function test_map_query_can_match_an_object_with_multiple_fields( ) : void
		{
			router.mapQuery( { page : 'home', view : 'main' }, TestRouteEvent.TEST );
			
			assertThat( router.hasRoute( query( { page : 'home', view : 'main' } ) ), isTrue( ) );
		}
		
		[Test(description="map query objects can accept patterns as well")]
		public function test_map_query_objects_can_accept_patterns_as_well( ) : void
		{
			router.mapQuery( { user : /\w+/, view : 'main' }, TestRouteEvent.TEST );
			
			assertThat( router.hasRoute( query( { view : 'main', user : 'jbone' } ) ), isTrue( ) );
		}
		
		[Test(description="map query routes must match all parts of the route object")]
		public function test_map_query_routes_must_match_all_parts_of_the_route_object( ) : void
		{
			router.mapQuery( { page : 'home', view : 'main' }, TestRouteEvent.TEST );
			
			assertThat( router.hasRoute( query( { view : 'main' } ) ), isFalse( ) );
			assertThat( router.hasRoute( query( { page : 'home' } ) ), isFalse( ) );
		}
		
		[Test(description="map query routes may contain more information than the route object needs")]
		public function test_map_query_routes_may_contain_more_information_than_the_route_object_needs( ) : void
		{
			router.mapQuery( { page : 'home', view : 'main' }, TestRouteEvent.TEST );
			
			assertThat( router.hasRoute( query( { view : 'main', extra : 'awesome', page : 'home' } ) ), isTrue( ) );
		}
		
		[Test(async,description="map query maps an event to an object route")]
		public function test_map_query_maps_an_event_to_an_object_route( ) : void
		{
			Async.proceedOnEvent( this, router.eventDispatcher, TestRouteEvent.TEST, 500 );
			
			router.mapQuery( { page : 'home' }, TestRouteEvent.TEST );
			
			router.route( query( { page : 'home' } ) );
		}
	
		[Test(async,description="map query provides a route event to handler with accurate information about route")]
		public function test_map_query_provides_a_route_event_to_handler_with_accurate_information_about_route( ) : void
		{
			var handler : Function = Async.asyncHandler( this, function( event : RouteEvent, data : Object ) : void
			{
				assertThat( event.route.value, equalTo( '?page=home' ) );
			}, 500 );
			
			router.eventDispatcher.addEventListener( TestRouteEvent.TEST, handler );
			
			router.mapQuery( { page : 'home' }, TestRouteEvent.TEST );
			
			router.route( '?page=home' );
		}
	
		[Test(async,description="map query provides a route event to handler with accurate parameter information")]
		public function test_map_query_provides_a_route_event_to_handler_with_accurate_parameter_information( ) : void
		{
			var handler : Function = Async.asyncHandler( this, function( event : RouteEvent, data : Object ) : void
			{
				assertThat( event.route.params( 'user' ), equalTo( 'jbone' ) );
			}, 500 );
			
			router.eventDispatcher.addEventListener( TestRouteEvent.TEST, handler );
			
			router.mapQuery( { page : 'home', user : /\w+/ }, TestRouteEvent.TEST );
			
			router.route( query( { page : 'home', user : 'jbone' } ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function MapQueryFixture( )
		{
		}
	
	}

}
