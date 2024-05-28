@isTest
private with sharing class ControllerWeatherApiTest {
    @isTest
    public static Void getLatLogTest() {
        //Arange
        Contact nuevoContacto = new Contact(LastName = 'LastNameTest', MailingLatitude = 30.198208, MailingLongitude = -97.805982);
        insert nuevoContacto;

        //Act
        Test.startTest();
        Contact contactoObtenido = ControllerWeatherApi.getLatLog(nuevoContacto.Id);
        Test.stopTest();
        
        //Assert
        Assert.areEqual(30.198208, contactoObtenido.MailingLatitude, 'Latitud del registro obtenido por id');
        Assert.areEqual(-97.805982, contactoObtenido.MailingLongitude, 'Latitud del registro obtenido por id');
    }

    @isTest
    public static Void getDataTemTest(){
        //Arange
        Contact nuevoContacto = new Contact(LastName = 'LastNameTest', MailingLatitude = 51.50853, MailingLongitude = 0.12574);
        insert nuevoContacto;
        Test.setMock(HttpCalloutMock.class, new WeatherServiceHttpCalloutMock(200));
        
        String jsonEsperado = '{"urlIcon":"https://www.meteosource.com/static/img/ico/weather/32.svg","temperature":13.5,"speed":4.6,"icon":32,"cloudCover":70}';

        //Act
        Test.startTest();
        String jsonObtenido = ControllerWeatherApi.getDataTem(nuevoContacto.Id);
        System.debug(jsonObtenido);
        Test.stopTest();

        //Assert
        Assert.areEqual(jsonEsperado, jsonObtenido, 'Json esperado y Json obtenido deberian ser iguales');
    }
}