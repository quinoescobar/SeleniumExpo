webdriver = require 'selenium-webdriver'
chai = require 'chai'
chai.use require 'chai-as-promised'
expect = chai.expect

before ->
  @timeout 10000
  @driver = new webdriver.Builder()
    .withCapabilities(webdriver.Capabilities.firefox())
    .build()
  @driver.getWindowHandle()



after ->
  @driver.quit();

describe 'Selenium Webdriver tutorial', ->



  it 'has the title of the post in the window\'s title', ->
    @driver.get 'http://bites.goodeggs.com/posts/selenium-webdriver-nodejs-tutorial/'
    @timeout 5000
    expect(@driver.getTitle()).to.eventually.contain
    'Getting started with Selenium Webdriver for node.js'

  it 'has publication date', ->
    @driver.get 'http://bites.goodeggs.com/posts/selenium-webdriver-nodejs-tutorial/'
    @timeout 5000
    text = @driver.findElement(css: '.post .meta time').getText()
    expect(text).to.eventually.equal 'December 30th, 2014'

  it 'links back to the homepage', ->
    @driver.get 'http://bites.goodeggs.com/posts/selenium-webdriver-nodejs-tutorial/'
    @timeout 5000
    @driver.findElement(linkText: 'Bites').click()
    expect(@driver.getCurrentUrl()).to.eventually.equal 'http://bites.goodeggs.com/'
