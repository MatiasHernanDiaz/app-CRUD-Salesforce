import { LightningElement, track } from 'lwc';


export default class GestorTareas extends LightningElement {

    @track tareas = [
        {"name" : "Tarea 1 buenas practica" , "cumplida": false, "id": 1},
        {"name" : "Tarea 2 " , "cumplida": false, "id": 2},
        {"name" : "Tarea 3 " , "cumplida": false, "id": 3},
        {"name" : "Tarea 4 " , "cumplida": false, "id": 4}
    ];
    
    tarea = {"name" : "", "cumplida": false, "id": 0};

    handleSubmit(){
        console.log("tarea " + this.tarea);
        console.log("lista tarea " + this.tareas);
        this.tareas = [...this.tareas, this.tarea];
        console.log("lista tarea nueva " + this.tareas);
    }

    handleInput(event){
        this.tarea.name = event.target.value;
        console.log("nombre tarea: " + this.tarea.name);
        console.log("nombre event: " + event.target.value);
    }

    sendToParent() { 
        const event = new CustomEvent('custom-event', { detail: { key: 'value' } }); this.dispatchEvent(event); 
    } 
}
