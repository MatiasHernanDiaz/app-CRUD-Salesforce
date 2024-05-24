public with sharing class ControllerWeatherApi {

    class Clima{
        public Double temperature;
        public Double speed;
        public Double precipitation;
        Clima(Double temperature, Double speed, Double precipitation){
            this.temperature = temperature;
            this.speed = speed;
            this.precipitation = precipitation;
        }

    }

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

            Clima clima = new Clima(datos.current.temperature, datos.current.wind.speed, datos.current.precipitation.total);

            //List<String> cadena = new List<String>{String.valueOf(datos.current.temperature), String.valueOf(datos.current.wind.speed), datos.current.wind.dir, String.valueOf(datos.current.precipitation.total)};
            
            //String cadena = '{"temperatura" : ' + datos.current.temperature + '}';

            String cadena = JSON.serialize(Clima);

            return  cadena;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    private static Clima clima(Double temperature, Double speed, Double precipitation){
        
        return new Clima(temperature, speed, precipitation);
    }
}