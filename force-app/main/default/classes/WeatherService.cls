public with sharing class WeatherService {

    public static JSON2Apex GetData(Decimal lat, Decimal lon) {

        Api_weather__mdt api = Api_weather__mdt.getInstance('Api_weather');
        JSON2Apex jsonParser;

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(api.URL_weather__c + 'lat=' + lat + '&lon='+ lon + '&key=' + api.key__c);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response.getStatusCode());

        try{
            if(response.getStatusCode() == 200) {
                jsonParser = JSON2Apex.parse(response.getBody());
                system.debug(jsonParser.timezone);   
            }
            else{
                throw new BussinesException('Error codigo: ' + response.getBody() + ' datos no encontrados');
            }
        } 
        catch (Exception e) {
            e.getMessage();
        }
        
        
        return jsonParser;
    }
}
