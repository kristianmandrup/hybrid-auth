/*global describe,it*/
'use strict';
var assert = require('assert'),
  hybridAuth = require('../lib/hybrid-auth.js');

describe('hybrid-auth node module.', function() {
  it('must be awesome', function() {
    assert( hybridAuth.awesome(), 'awesome');
  });
});
