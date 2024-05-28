import { LightningElement, track, api } from 'lwc';

export default class ListaTareasChecktareaCristian extends LightningElement {

    @track tareas = [
        {"name" : "Tarea 1 buenas practica" , "cumplida": false, "id": 1},
        {"name" : "Tarea 2 " , "cumplida": false, "id": 2},
        {"name" : "Tarea 3 " , "cumplida": false, "id": 3},
        {"name" : "Tarea 4 " , "cumplida": false, "id": 4}
    ];

    @api isComplete;

    handleChange(event) {

        let tareaId = event.target.value;

        console.log(tareaId);
        
        this.tareas.forEach( tarea => {
            if(tarea.id == tareaId){
                tarea.cumplida = !tarea.cumplida;
                isComplete = tarea.cumplida;
            }
        })



    }

    /*
    @api
    get claseTarea(){
        console.log("clase tarea: " + this.isComplete);
        return this.isComplete ? 'completa' : 'falta';
     }
    */
}