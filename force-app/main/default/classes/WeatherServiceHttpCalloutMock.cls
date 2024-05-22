@isTest
global class WeatherServiceHttpCalloutMock implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"lat": "51.50853N","lon": "0.12574W","elevation": 25,"timezone": "Europe/London","units": "uk","current": {"icon": "rain_shower","icon_num": 32,"summary": "Rain shower","temperature": 13.5,"wind": {"speed": 4.6,"angle": 32,"dir": "NNE"},"precipitation": {"total": 0.2,"type": "none"},"cloud_cover": 70},"hourly": null,"daily": null}');
        response.setStatusCode(200);
        return response;
    }
}