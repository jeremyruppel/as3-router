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
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.isA;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.sameInstance;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  27.09.2010
	 */
	public class RouterFixture
	{
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
		
		[Test(description="router provides its own event dispatcher if none is supplied")]
		public function test_router_provides_its_own_event_dispatcher_if_none_is_supplied( ) : void
		{
			var router : IRouter = new Router( );
			
			assertThat( router.eventDispatcher, isA( IEventDispatcher ) );
			
			assertThat( router.eventDispatcher, sameInstance( router ) );
		}
		
		[Test(async,description="router can dispatch events off of itself if no event dispatcher is supplied")]
		public function test_router_can_dispatch_events_off_of_itself_if_no_event_dispatcher_is_supplied( ) : void
		{
			var router : IRouter = new Router( );
			
			Async.proceedOnEvent( this, router.eventDispatcher, TestRouteEvent.TEST, 500 );
			
			router.mapRoute( '/home', TestRouteEvent.TEST );
			
			router.route( '/home' );
		}
		
		[Test(description="router uses given event dispatcher if one is supplied")]
		public function test_router_uses_given_event_dispatcher_if_one_is_supplied( ) : void
		{
			var eventDispatcher : IEventDispatcher = new EventDispatcher( );
			
			var router : IRouter = new Router( eventDispatcher );
			
			assertThat( router.eventDispatcher, not( sameInstance( router ) ) );
			
			assertThat( router.eventDispatcher, sameInstance( eventDispatcher ) );
		}
		
		[Test(async,description="router can dispatch events on behalf of a given event dispatcher")]
		public function test_router_can_dispatch_events_on_behalf_of_a_given_event_dispatcher( ) : void
		{
			var eventDispatcher : IEventDispatcher = new EventDispatcher( );
			
			var router : IRouter = new Router( eventDispatcher );
			
			Async.proceedOnEvent( this, eventDispatcher, TestRouteEvent.TEST, 500 );
			
			router.mapRoute( '/home', TestRouteEvent.TEST );
			
			router.route( '/home' );
		}
		
		[Test(async,description="router matches routes in order of mapping")]
		public function test_router_matches_routes_in_order_of_mapping( ) : void
		{
			var router : IRouter = new Router( );
			
			var handler : Function = Async.asyncHandler( this, function( event : RouteEvent, data : Object ) : void
			{
				assertThat( event.type, equalTo( TestRouteEvent.SECOND ) );
				assertThat( event.route.params( 'user' ), equalTo( 'jbone' ) );
			}, 500 );
			
			router.eventDispatcher.addEventListener( TestRouteEvent.FIRST, handler );
			router.eventDispatcher.addEventListener( TestRouteEvent.SECOND, handler );
			router.eventDispatcher.addEventListener( TestRouteEvent.THIRD, handler );
			
			router.mapRoute( '/users/quality-assurance', TestRouteEvent.FIRST );
			router.mapRoute( '/users/:user', TestRouteEvent.SECOND );
			router.mapRoute( '/about-us', TestRouteEvent.THIRD );
			
			router.route( '/users/jbone' );
		}
		
		[Test(async,description="router dispatches not found event if no routes can be matched")]
		public function test_router_dispatches_not_found_event_if_no_routes_can_be_matched( ) : void
		{
			var router : IRouter = new Router( );
			
			var handler : Function = Async.asyncHandler( this, function( event : RouteEvent, data : Object ) : void
			{
				assertThat( event.route.value, equalTo( '/pages/contact' ) );
			}, 500 );
			
			router.eventDispatcher.addEventListener( RouteEvent.NOT_FOUND, handler );
			
			router.mapRoute( '/pages/home', TestRouteEvent.FIRST );
			
			router.route( '/pages/contact' );
		}
		
		[Test(async,description="router does not dispatch not found event if a route is matched")]
		public function test_router_does_not_dispatch_not_found_event_if_a_route_is_matched( ) : void
		{
			var router : IRouter = new Router( );
			
			Async.failOnEvent( this, router.eventDispatcher, RouteEvent.NOT_FOUND, 500 );
			
			router.mapRoute( '/pages/home', TestRouteEvent.FIRST );
			
			router.route( '/pages/home' );
		}
		
		[Test(async,description="router will only match one route per route request")]
		public function test_router_will_only_match_one_route_per_route_request( ) : void
		{
			var router : IRouter = new Router( );
			
			var handler : Function = Async.asyncHandler( this, function( event : RouteEvent, data : Object ) : void
			{
				assertThat( event.route.value, equalTo( '/pages/home' ) );
			}, 500 );
			
			Async.failOnEvent( this, router.eventDispatcher, TestRouteEvent.SECOND );
			
			router.eventDispatcher.addEventListener( TestRouteEvent.FIRST, handler );
			
			router.mapRoute( '/pages/home', TestRouteEvent.FIRST );
			router.mapRoute( '/pages/home', TestRouteEvent.SECOND );
			
			router.route( '/pages/home' );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function RouterFixture( )
		{
		}
	
	}

}