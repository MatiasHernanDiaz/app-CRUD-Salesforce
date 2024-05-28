public with sharing class ControllerWeatherApi {

    class Clima{
        public Double temperature;
        public Double speed;
        public Integer cloudCover;
        public Integer icon;
        public String urlIcon = 'https://www.meteosource.com/static/img/ico/weather/'; 

        Clima(Double temperature, Double speed, Integer cloudCover){
            this.temperature = temperature;
            this.speed = speed;
            this.cloudCover = cloudCover;
        }

        public Void getUrlIcon(Integer iconNum){ 
            icon = iconNum;
            urlIcon = urlIcon + iconNum + '.svg';
        }
    }

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
            
                JSON2Apex datos = WeatherService.getData(contacto.MailingLatitude, contacto.MailingLongitude);
                Clima clima = new Clima(datos.current.temperature, datos.current.wind.speed, datos.current.cloud_cover);
                clima.getUrlIcon(datos.current.icon_num);
                String cadena = JSON.serialize(Clima);
                return  cadena;
            

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    private static Clima clima(Double temperature, Double speed, Integer cloudCover){
        return new Clima(temperature, speed, cloudCover);
    }
}