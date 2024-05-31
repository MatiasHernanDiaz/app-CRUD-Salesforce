import getDataTem from '@salesforce/apex/ControllerWeatherApi.getDataTem';
import { LightningElement, wire, api, track } from 'lwc';

export default class Clima extends LightningElement {
    @api recordId;
    @track datos = {urlIcon: "", temperature: null, speed: null, cloudCover: null};
    unidades = 'F';
    cambiarUnidades = true;
    @track error ={statusText: ""};

    carga = true;

    @wire (getDataTem, {id: "$recordId"})
    wiredTemperature({data, error}) {
        if (data) {
            this.datos = JSON.parse(data);
            this.error = undefined;
            this.carga = false;
        } else if (error) {
            this.error = error;
            this.data = undefined;
            this.carga = false;
        }
    }

    handleClick(){
      if(this.cambiarUnidades){
        this.datos.temperature = ((this.datos.temperature - 32) * (5/9)).toFixed(1);
        this.unidades = '°C';
        this.cambiarUnidades = false;
      }
      else{
        this.datos.temperature = ((this.datos.temperature * (9/5)) + 32).toFixed(1);
        this.unidades = 'F';
        this.cambiarUnidades = true;
      }
    }
}