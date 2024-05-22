public with sharing class TareaController {

    
    @AuraEnabled(cacheable=true)
    public static Tarea__c crearTarea(String titulo, String descripcion){
        try {
            Tarea__c nuevaTarea = new Tarea__c(titulo__c = titulo, descripcion__c = descripcion);
            insert nuevaTarea;
            return nuevaTarea;

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}