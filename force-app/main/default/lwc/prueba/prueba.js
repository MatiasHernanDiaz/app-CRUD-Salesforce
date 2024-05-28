import getDataTem from '@salesforce/apex/ControllerWeatherApi.getDataTem';
import { LightningElement, wire, api, track } from 'lwc';
//import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
//import ID_FIELD from '@salesforce/schema/Contact.Id'

export default class Prueba extends LightningElement {
    @api recordId;
    @track datazo = {urlIcon: " ", temperature: 12, speed: 12, cloudCover: 1};
    error;

    @wire (getDataTem, {id: "$recordId"})
    wiredTemperature({data, error}) {
        if (data) {
            console.log(data);
            this.datazo = JSON.parse(data);
            console.log('URL icono' + this.datazo.icon );
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.data = undefined;
        }
    }
}
