//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2010 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.core
{

	/**
	 * Interface describing the contract for a routing Rule object.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  10.09.2010
	 */
	public interface IRule
	{
	
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		/**
		 * whether or not this rule matches the given route
		 * 
		 * @return Boolean
		 */
		function matches( route : String ) : Boolean;
		
		/**
		 * parses the given route and returns a route object containing match information
		 * 
		 * @return IRoute
		 */
		function execute( route : String ) : IRoute;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		/**
		 * the event type associated with this rule
		 */
		function get eventType( ) : String;
	
	}

}