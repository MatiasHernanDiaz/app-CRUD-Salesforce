public with sharing class WeatherService {

    public static JSON2Apex getData(Decimal lat, Decimal lon) {
        
        Api_weather__mdt api = Api_weather__mdt.getInstance('Api_weather');
        JSON2Apex jsonParser;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(api.URL_weather__c + 'units=us&lat=' + lat + '&lon='+ lon + '&key=' + api.key__c);
        request.setMethod('GET');
        
        try{
            HttpResponse response = http.send(request);
            if(response.getStatusCode() == 200) {
                jsonParser = JSON2Apex.parse(response.getBody());
                system.debug(jsonParser.timezone);   
            }
            else{
                throw new BussinesException('Error codigo: ' + response.getStatusCode());
            }
        } 
        catch (Exception e) {
            throw e;
        }
        return jsonParser;
    }
}
