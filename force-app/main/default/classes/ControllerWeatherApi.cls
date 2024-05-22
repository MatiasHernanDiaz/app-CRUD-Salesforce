public with sharing class ControllerWeatherApi {
    @AuraEnabled
    public static Contact getLatLog(String id){
        try {

            return [SELECT MailingLatitude , MailingLongitude FROM  Contact WHERE id =: id with security_enforced];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public static JSON2Apex getDataTem(String id){
        try {

            Contact contacto = getLatLog(id);
            
            return WeatherService.GetData(contacto.MailingLatitude, contacto.MailingLongitude);

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}