import getDataTem from '@salesforce/apex/ControllerWeatherApi.getDataTem';
import { LightningElement, wire, api } from 'lwc';

export default class Prueba extends LightningElement {

    clienteA = '003aj000002Yo65AAC';
    datosClima;

    @wire (getDataTem, {id: "$clienteA"})datosClima;
    wiredCustomerData({ error, data }) {
        if (data) {
            this.customerData = data;
        } else if (error) {
            console.error('Error fetching customer data: ', error);
        }
    }

}
