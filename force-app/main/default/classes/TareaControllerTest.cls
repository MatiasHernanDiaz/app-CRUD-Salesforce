@isTest
private with sharing class TareaControllerTest {

    @isTest static public void testAssignanId() {
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        TareaController controllerTest = new TareaController();

        controllerTest.addTarea(taskTest);

        System.assertEquals(1, taskTest.getId() , 'Se verifica id asignado');
    }

    @isTest static public void testAssignanId2() {
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        Tarea taskTest2 = new Tarea('tituloTest', 'descripcionTest');

        TareaController controllerTest = new TareaController();

        controllerTest.addTarea(taskTest);

        controllerTest.addTarea(taskTest2);

        System.assertEquals(2, taskTest2.getId() , 'Se verifica id asignado para un seg elemento');
    }
    
    @isTest static public void testAddTarea() {
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        TareaController controllerTest = new TareaController();

        controllerTest.addTarea(taskTest);

        System.assertEquals(1, controllerTest.getListTareas().size() , 'Se agrega una tarea');
    }

    @isTest static public void testUpdateTitulo() {
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        Tarea taskTest2 = new Tarea('tituloTest', 'descripcionTest');

        TareaController controllerTest = new TareaController();

        controllerTest.addTarea(taskTest);
        controllerTest.addTarea(taskTest2);

        controllerTest.updateTitulo(taskTest2,'titulo2update');

        System.assertEquals('titulo2update', taskTest2.getTitulo(), 'Se modifica un titulo');
    }

    @isTest static public void testUpdateDescripcion() {
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        Tarea taskTest2 = new Tarea('tituloTest', 'descripcionTest');

        TareaController controllerTest = new TareaController();

        controllerTest.addTarea(taskTest);
        controllerTest.addTarea(taskTest2);

        controllerTest.updateDescripcion(taskTest2,'descripcion2update');

        System.assertEquals('descripcion2update', taskTest2.getDescripcion(), 'Se modifica una descripcion');
    }

    @isTest static public void testDeleteTarea() {
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        Tarea taskTest2 = new Tarea('tituloTest', 'descripcionTest');

        TareaController controllerTest = new TareaController();

        controllerTest.addTarea(taskTest);
        controllerTest.addTarea(taskTest2);

        controllerTest.deleteTarea(taskTest);

        System.assertEquals(taskTest2 , controllerTest.getListTareas()[0], 'Se elimina una tarea');
    }

    @isTest static public void testExistsTask() {
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        Tarea taskTest2 = new Tarea('tituloTest', 'descripcionTest');

        TareaController controllerTest = new TareaController();

        controllerTest.addTarea(taskTest);
        controllerTest.addTarea(taskTest2);

        System.assertEquals(true , controllerTest.existsTask(taskTest), 'Contiene una tarea');
    }

    @isTest static public void testNotExistsTask() {
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        Tarea taskTest2 = new Tarea('tituloTest', 'descripcionTest');

        TareaController controllerTest = new TareaController();

        controllerTest.addTarea(taskTest);
        
        System.assertEquals(false , controllerTest.existsTask(taskTest2), 'No contiene una tarea');
    }
}