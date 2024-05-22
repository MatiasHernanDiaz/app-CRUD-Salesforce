public with sharing class CountryService {
    public static String getDataPlaceId(String country) {
        Api_weather__mdt api = Api_weather__mdt.getInstance('Api_weather');
        JSON2Apex jsonParser;

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(api.URL_weather__c + 'place_id=' +  city + '&key=' + api.key__c);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug(response.getStatusCode());
        
        if(response.getStatusCode() == 200) {
            jsonParser = JSON2Apex.parse(response.getBody());
            system.debug(jsonParser.timezone);   
        }
        else{
            throw new BussinesError('Nombre de ciudad no encontrado');
        }
        return jsonParser;
    }
}