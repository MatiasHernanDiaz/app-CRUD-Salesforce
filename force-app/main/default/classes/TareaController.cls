public with sharing class TareaController {
    
    private List<Tarea> listTareas = new List<Tarea>();
    private Integer idController = 0;

    //sin constructor por defecto

    private Void assignId(Tarea task){ 
        if(task.getId() == null){
            idController += 1;
            task.setId(idController);
        }
    }

    public Tarea createTarea(String titulo, String descripcion){
        return new Tarea(titulo, descripcion);
    } 

    public Void addTarea(Tarea task){ 
        assignId(task);
        listTareas.add(task); 
    }

    public List<Tarea> getListTareas(){ return listTareas; }

    public Void deleteTarea(Tarea task){
        Integer index = -1;
        for(Tarea tarea : listTareas){
            if(tarea == task){
                index = listTareas.indexOf(task);
                break;
            }
        }
        listTareas.remove(index);

     }

     public Void updateTitulo(Tarea task, String newTitle){ task.setTitulo(newTitle); }

     public Void updateDescripcion(Tarea task, String newDescription){ task.setDescripcion(newDescription); }

     public Void updateState(Tarea task){ task.changeState();}

     public Boolean existsTask(Tarea task){ return listTareas.contains(task); }

}