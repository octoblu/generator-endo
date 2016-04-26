path = require 'path'
helpers = require('yeoman-test')
assert = require('yeoman-assert')

GENERATOR_NAME = 'app'
DEST = path.join __dirname, '..', 'temp', "endo-#{GENERATOR_NAME}"

describe 'app', ->
  before 'run the helper', (done) ->
    helpers
      .run path.join __dirname, '..', 'app'
      .inDir DEST
      .withOptions
        realname: 'Alex Gorbatchev'
        githubUrl: 'https://github.com/alexgorbatchev'
      .withPrompts
        githubUser: 'alexgorbatchev'
        generatorName: GENERATOR_NAME
        passportName: 'passport-app'
      .on 'end', done

  it 'creates expected files', ->
    assert.file '''
      Dockerfile
      schemas/hello-schema.json
      schemas/namaste-schema.json
      src/message-handlers.coffee
      src/schema-loader.coffee
      src/strategies/api-strategy.coffee
      test/test_helper.coffee
      test/mocha.opts
      command.js
      command.coffee
      coffeelint.json
      .gitignore
      .travis.yml
      LICENSE
      README.md
      package.json
    '''.split /\s+/g
