@isTest
private with sharing class WeatherServiceTest {
    @isTest static void testGetData() {
        Test.setMock(HttpCalloutMock.class, new WeatherServiceHttpCalloutMock());
        Test.startTest();
        JSON2Apex respuesta = WeatherService.getData(51.50853,0.12574);
        Test.stopTest();
        Assert.areEqual(13.5, respuesta.current.temperature, 'Trae los mismos datos');
    }

    @isTest static void testGetDataNotFound() {
        Test.setMock(HttpCalloutMock.class, new WeatherServiceHttpCalloutMock());
        try {
            Test.startTest();
            JSON2Apex respuesta = WeatherService.getData(1.00, 1.00);
            Test.stopTest();
        } catch (BussinesException e) {
            Assert.areEqual('Nombre de ciudad no encontrado', e.getMessage(), 'El mensaje de error debe ser el mismo');
        }
    }
}