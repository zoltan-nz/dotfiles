#!/usr/bin/env node
var fs = require('fs');
var path = require('path');
var cp = require('child_process');

var WEBSTORM = '/Applications/WebStorm.app/Contents/MacOS/webstorm';

console.log('Launching Webstorm...');

var processArgvLength = process.argv.length;

var pathParam = processArgvLength < 3 ? './' : process.argv[processArgvLength-1];

cp.exec(WEBSTORM + ' ' + path.resolve(pathParam));

process.exit(0);
