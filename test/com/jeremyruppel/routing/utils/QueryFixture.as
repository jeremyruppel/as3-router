//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.routing.utils
{
	import com.jeremyruppel.routing.utils.parse;
	import com.jeremyruppel.routing.utils.query;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.anyOf;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.hasPropertyWithValue;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  28.09.2010
	 */
	public class QueryFixture
	{	
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="query assembles hash with one field into query string")]
		public function test_query_assembles_hash_with_one_field_into_query_string( ) : void
		{
			assertThat( query( { page : 'home' } ), equalTo( '?page=home' ) );
		}
		
		[Test(description="query assembles hash with two fields into query string")]
		public function test_query_assembles_hash_with_two_fields_into_query_string( ) : void
		{
			assertThat( query( { page : 'home', view : 'main' } ), 
			anyOf( 
				equalTo( '?page=home&view=main' ),
				equalTo( '?view=main&page=home' ) ) );
		}
		
		[Test(description="query assembles hash with three fields into query string")]
		public function test_query_assembles_hash_with_three_fields_into_query_string( ) : void
		{
			assertThat( query( { page : 'home', view : 'main', user : 'jbone' } ), 
			anyOf( 
				equalTo( '?page=home&view=main&user=jbone' ),
				equalTo( '?page=home&user=jbone&view=main' ),
				equalTo( '?view=main&user=jbone&page=home' ),
				equalTo( '?view=main&page=home&user=jbone' ),
				equalTo( '?user=jbone&page=home&view=main' ),
				equalTo( '?user=jbone&view=main&page=home' ) ) );
		}
		
		[Test(description="query stringifies nonstring values passed to it")]
		public function test_query_stringifies_nonstring_values_passed_to_it( ) : void
		{
			assertThat( query( { page : 'home', user : 12345 } ),
			anyOf( 
				equalTo( '?page=home&user=12345' ),
				equalTo( '?user=12345&page=home' ) ) );
		}
		
		[Test(description="query acts as inverse to parse function")]
		public function test_query_acts_as_inverse_to_parse_function( ) : void
		{
			var string : String = query( { page : 'home', view : 'main' } );
			
			var result : Object = parse( string );
			
			assertThat( result, hasPropertyWithValue( 'page', 'home' ) );
			assertThat( result, hasPropertyWithValue( 'view', 'main' ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function QueryFixture( )
		{
		}
	
	}

}
