public with sharing class TareaController {
    
    private List<Tarea> listTarea = new List<Tarea>();

    public TareaController() { }

    public Void assignId(Tarea task){ 
        if(task.getId() != null){
            task.setId( task.getId() + 1 );
        }
        else {
            task.setId(1);
        }
     }

    public Void addTarea(Tarea tarea){ listTarea.add(tarea); }

    public List<Tarea> getTarea(){ return listTarea; }

    public Void deleteTarea(Tarea task){ 
        for(Integer i = 0; i < listTarea.size(); i++){
            if(listTarea[i] == task){
                listTarea.remove(i);
            }
        }
     }

     public Void updateTitulo(Tarea task, String newTitle){ task.setTitulo(newTitle); }

     public Void updateDescripcion(Tarea task, String newDescription){ task.setDescripcion(newDescription); }

     public Void updateState(Tarea task){ task.changeState()} 


}