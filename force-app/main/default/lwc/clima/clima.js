import getDataTem from '@salesforce/apex/ControllerWeatherApi.getDataTem';
import { LightningElement, wire, api, track } from 'lwc';

export default class Clima extends LightningElement {
    @api recordId;
    @track datos = {urlIcon: "", temperature: null, speed: null, cloudCover: null};
    unidades = 'F';
    cambiarUnidades = true;
    error ={statusText: ""};

    @wire (getDataTem, {id: "$recordId"})
    wiredTemperature({data, error}) {
        if (data) {
            console.log("antes del paseo " + this.data);
            this.datos = JSON.parse(data);
            console.log("despues del paseo " + this.data);
            this.error = undefined;
        } else if (error) {
            console.log("error " + this.error);
            this.error = error;
            console.log(this.error.statusText);
            this.data = undefined;
        }
    }

    handleClick(){
      if(this.cambiarUnidades){
        this.datos.temperature = ((this.datos.temperature - 32) * (5/9)).toFixed(2);
        this.unidades = 'F';
        this.cambiarUnidades = false;
      }
      else{
        this.datos.temperature = ((this.datos.temperature * (9/5)) + 32).toFixed(2);
        this.unidades = '°C';
        this.cambiarUnidades = true;
      }
    }
}