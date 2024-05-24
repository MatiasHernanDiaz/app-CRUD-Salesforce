public with sharing class ControllerWeatherApi {

    //@AuraEnabled(cacheable=true) //debería ser privado?
    public static Contact getLatLog(String id){
        try {

            return [SELECT MailingLatitude , MailingLongitude FROM  Contact WHERE id =: id with security_enforced];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true) //1ra en ejecutarse
    public static String getDataTem(String id){
        try {

            Contact contacto = getLatLog(id);

            JSON2Apex datos = WeatherService.GetData(contacto.MailingLatitude, contacto.MailingLongitude);
            
            return  String.valueOf(datos.current.temperature);

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}