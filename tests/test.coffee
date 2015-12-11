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
    nav = @driver.findElement(id:'n1').getText()
    expect(nav).to.eventually.equal 'Inicio Convertir Temperatura'


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


describe 'Conversor de Temperatura', ->

  it 'Enlace al conversor de temperatura', ->
    @driver.get 'localhost:8080/conversor/temperatura'
    @timeout 5000
    @driver.findElement(linkText: 'Inicio').click()
    expect(@driver.getCurrentUrl()).to.eventually.equal 'http://localhost:8080/'

  it 'Posee una descripcion al ingresar a la pagina', ->
    @driver.get 'localhost:8080/conversor/temperatura'
    @timeout 5000
    label = @driver.findElement(id:'labelT').getText()
    expect(label).to.eventually.equal 'Ingrese la Temperatura (e.g: 90F, 37C, -3.14f):'

  it 'Posee un boton para convertir temperatura', ->
    @driver.get 'localhost:8080/conversor/temperatura'
    @timeout 5000
    boton = @driver.findElement(id:'buttonC').click()
    expect(boton).to.eventually.equal 'ok'

  it 'Llena el Input con 43f y de presiona Convertir ', ->
    @driver.get 'localhost:8080/conversor/temperatura'
    @timeout 5000
    ingresar = @driver.findElement(id: 'original').sendKeys('43f')
    boton = @driver.findElement(id:'buttonC').click()
    expect(@driver.findElement(id:'result').getText()).to.eventually.equal '6.1 Celsius'

  it 'Llena el Input con 13C y de presiona Convertir ', ->
    @driver.get 'localhost:8080/conversor/temperatura'
    @timeout 5000
    ingresar = @driver.findElement(id: 'original').sendKeys('13C')
    boton = @driver.findElement(id:'buttonC').click()
    expect(@driver.findElement(id:'result').getText()).to.eventually.equal '55.4 Farenheit'
