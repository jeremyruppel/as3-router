//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.rules
{
	import com.jeremyruppel.routing.core.IRoute;
	import com.jeremyruppel.routing.core.IRule;
	import com.jeremyruppel.routing.rules.HashRule;
	import com.jeremyruppel.routing.support.TestRouteEvent;
	import com.jeremyruppel.routing.utils.query;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.isA;
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
	 * @since  27.09.2010
	 */
	public class HashRuleFixture
	{
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
		
		[Test(description="hash rule returns its event type")]
		public function test_hash_rule_returns_its_event_type( ) : void
		{
			var rule : IRule = new HashRule( { page : 'home' }, TestRouteEvent.TEST );
			
			assertThat( rule.eventType, equalTo( TestRouteEvent.TEST ) );
		}
		
		[Test(description="hash rule uses object passed to match route")]
		public function test_hash_rule_uses_object_passed_to_match_route( ) : void
		{
			var rule : IRule = new HashRule( { page : 'home' }, TestRouteEvent.TEST );
			
			assertThat( rule.matches( query( { page : 'home' } ) ), isTrue( ) );
			
			assertThat( rule.matches( query( { page : 'contact' } ) ), isFalse( ) );
		}
		
		[Test(description="hash rule can match multiple fields in any order")]
		public function test_hash_rule_can_match_multiple_fields_in_any_order( ) : void
		{
			var rule : IRule = new HashRule( { page : 'home', view : 'main' }, TestRouteEvent.TEST );
			
			assertThat( rule.matches( query( { page : 'home', view : 'main' } ) ), isTrue( ) );
		}

		[Test(description="hash rule must match all fields to be considered a match")]
		public function test_hash_rule_must_match_all_fields_to_be_considered_a_match( ) : void
		{
			var rule : IRule = new HashRule( { page : 'home', view : 'main' }, TestRouteEvent.TEST );
			
			assertThat( rule.matches( query( { page : 'home' } ) ), isFalse( ) );
			
			assertThat( rule.matches( query( { view : 'main' } ) ), isFalse( ) );
		}

		[Test(description="hash rule must match all of its fields and ignores extra information")]
		public function test_hash_rule_must_match_all_of_its_fields_and_ignores_extra_information( ) : void
		{
			var rule : IRule = new HashRule( { page : 'home', view : 'main' }, TestRouteEvent.TEST );
			
			assertThat( rule.matches( query( { page : 'home', extra : 'info', view : 'main' } ) ), isTrue( ) );
		}

		[Test(description="hash rule can use patterns to match routes")]
		public function test_hash_rule_can_use_patterns_to_match_routes( ) : void
		{
			var rule : IRule = new HashRule( { page : /\w+/, view : 'main' }, TestRouteEvent.TEST );
			
			assertThat( rule.matches( query( { page : 'home', view : 'main' } ) ), isTrue( ) );
			
			assertThat( rule.matches( query( { page : 'contact', view : 'main' } ) ), isTrue( ) );
		}
		
		[Test(description="hash rule execute returns a route object")]
		public function test_hash_rule_execute_returns_a_route_object( ) : void
		{
			var rule : IRule = new HashRule( { page : /w+/, view : 'main' }, TestRouteEvent.TEST );
			
			assertThat( rule.execute( query( { page : 'home', view : 'main' } ) ), isA( IRoute ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function HashRuleFixture( )
		{
		}
	
	}

}
