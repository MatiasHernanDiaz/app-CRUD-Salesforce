@isTest
private with sharing class WeatherServiceTest {
    @isTest static void testGetData() {
        Test.setMock(HttpCalloutMock.class, new WeatherServiceHttpCalloutMock());
        JSON2Apex respuesta = WeatherService.getData('london');
        Assert.areEqual(13.5, respuesta.current.temperature, 'Trae los mismos datos');
    }
}