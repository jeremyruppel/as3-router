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

Usage
-----

A router can be instantiated stand-alone and can route events through its
`eventDispatcher` accessor.

	var router : IRouter = new Router( );
	
	router.mapRoute( '/hello/:name', CustomRouteEvent.HELLO );
	
	router.eventDispatcher.addEventListener( CustomRouteEvent.HELLO, function( event : RouteEvent ) : void
	{
		trace( event.route.params( 'name' ) ); // => awesome
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

[Sinatra]: http://www.sinatrarb.com/ "Sinatra"
[Backbone]: http://documentcloud.github.com/backbone/ "Backbone.js"
[SWFAddress]: http://www.asual.com/swfaddress/ "SWFAddress"
[RobotLegs]: https://github.com/robotlegs/robotlegs-framework "RobotLegs"