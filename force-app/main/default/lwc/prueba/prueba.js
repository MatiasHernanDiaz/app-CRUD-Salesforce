import getDataTem from '@salesforce/apex/ControllerWeatherApi.getDataTem';
import { LightningElement, wire, api } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import ID_FIELD from '@salesforce/schema/Contact.Id'

export default class Prueba extends LightningElement {


    @api recordId;


    @wire (getDataTem, {id: "$recordId"})
    wiredAccount({data, error}) {
        if (data) {
            this.data = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.data = undefined;
        }
    }

    
    //clima = JSON.stringify( this.a );

    

    get temperatura(){
        console.log(this.data);
        console.log(this.error);
        return  this.error;
    }

}
