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


  it 'Se puede visualizar el titulo del inicio', ->
    @driver.get 'localhost:8080'
    @timeout 5000
    expect(@driver.getTitle()).to.eventually.contain 'Conversor de Temperatura'

  it 'Posee un menu', ->
    @driver.get 'localhost:8080'
    @timeout 5000
    text = @driver.findElement(id:'n1').getText()
    expect(text).to.eventually.equal 'Inicio Convertir Temperatura'


  it 'Se puede ir a Convertir Temperatura', ->
    @driver.get 'localhost:8080'
    @timeout 5000
    @driver.findElement(linkText: 'Comienza a convertir!').click()
    expect(@driver.getCurrentUrl()).to.eventually.equal 'http://localhost:8080/conversor/temperatura'

  it 'Enlace al conversor de temperatura', ->
    @driver.get 'localhost:8080/conversor/temperatura'
    @timeout 5000
    @driver.findElement(linkText: 'Inicio').click()
    expect(@driver.getCurrentUrl()).to.eventually.equal 'http://localhost:8080/'
