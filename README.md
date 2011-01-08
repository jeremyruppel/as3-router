AS3 Router
==========

**as3-router** is a simple hash and query string router for ActionScript 3
that maps route strings to events. This project was inspired by the simplicity
of routing by frameworks like [Sinatra][Sinatra] and [Backbone][Backbone].

The router does not hook into any specific deep-linking solution (though if
you're looking for one, I'd strongly recommend [SWFAddress][SWFAddress]).
It simply takes a string route and interprets it into an event, including
route information and parameters.

Also, it should be noted that the router works extremely well with [RobotLegs][RobotLegs],
though there are absolutely no dependencies on it.

Usage Overview
--------------

A router can be instantiated stand-alone and can route events through its
`eventDispatcher` accessor.

	var router : IRouter = new Router( );
	
	router.mapRoute( '/hello/:name', CustomRouteEvent.HELLO );
	
	router.eventDispatcher.addEventListener( CustomRouteEvent.HELLO, function( event : RouteEvent ) : void
	{
		event.route.value; // => '/hello/awesome'
		
		event.route.params( 'name' ); // => awesome
	} );
	
	// later on...
	router.route( '/hello/awesome' );

The base `Router` class may optionally accept an `IEventDispatcher` implementation
to dispatch events from. This makes it trivial to integrate into a RobotLegs
context, like:

	var router : IRouter = new Router( eventDispatcher );
	
	router.mapRoute( '/hello/:name', CustomRouteEvent.HELLO );
	
	commandMap.mapEvent( CustomRouteEvent.HELLO, SayHelloToSomeoneCommand );
	
	// later on...
	router.route( '/hello/awesome' );

Route Mappings
--------------

The base Router implementation can map string routes, regex routes, and query string routes
(represented as objects). The most typical and convenient use case should be to map string
routes, as they are internally converted to regex patterns with some common pattern conventions
that should be familiar to anyone who has experience routing with Sinatra or Backbone.

`mapRoute` can accept named parameters denoted by a colon. For example:

	router.mapRoute( '/hello/:name' );

will match "/hello/world", "hello/friend", "hello/no-wait-actually-goodbye", etc. The value of 
a named parameter can be retrieved from the `route` object of the route event dispatched
when this route is matched, like:

	event.route.params( 'name' ); // => 'no-wait-actually-goodbye'

Multiple parameters can be declared and will each be matched by name:

	router.mapRoute( '/:section/:page' );
	
	router.hasRoute( '/company/manifesto' ); // => true
	
	// and for the event's route...
	event.route.params( 'section' ); // => 'company'
	event.route.params( 'page' ); // => 'manifesto'

String routes can also contain splats that will be available as unnamed captures populated in
the route object's `captures` array:

	router.mapRoute( '/*/profile' );
	
	router.hasRoute( '/username/profile' ); // => true
	
	router.hasRoute( '/username/contact' ); // => false
	
	// and for the event's route...
	event.route.captures[ 0 ]; // => 'username'

`mapQuery` can match query-string-style routes if you need them. Because query strings are
unordered key value pairs, they are matched as simple objects, like:

	router.mapQuery( { page : 'home', action : 'whatever' } );
	
	router.route( '?action=whatever&page=home' );
	
	// and for the event's route...
	event.route.params( 'action' ); // => 'whatever'
	event.route.params( 'page' ); // => 'home'

Unmapped Routes
---------------

If no route is matched through a call to `route`, a `RouteEvent.NOT_FOUND` event will
be dispatched from the router's eventDispatcher.

[Sinatra]: http://www.sinatrarb.com/ "Sinatra"
[Backbone]: http://documentcloud.github.com/backbone/ "Backbone.js"
[SWFAddress]: http://www.asual.com/swfaddress/ "SWFAddress"
[RobotLegs]: https://github.com/robotlegs/robotlegs-framework "RobotLegs"