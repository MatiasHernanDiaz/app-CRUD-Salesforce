import getDataTem from '@salesforce/apex/ControllerWeatherApi.getDataTem';
import { LightningElement, wire, api } from 'lwc';

export default class Prueba extends LightningElement {

    clienteA = '003aj000002Yo65AAC';
    @wire (getDataTem, {id: "$clienteA"}) dato;

    

}