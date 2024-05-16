@isTest
private with sharing class TareaTest {

    @isTest static Void testGetId(){ 
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        taskTest.setId(1);

        System.assertEquals(1, taskTest.getId(), 'Obtener el id de una tarea');
    }

    @isTest static Void testGetTitulo(){ 
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        System.assertEquals('tituloTest', taskTest.getTitulo(), 'Obtener el titulo');
    }

    
    @isTest static Void testGetDescripcion(){ 
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        System.assertEquals('descripcionTest', taskTest.getDescripcion(), 'Obtener la descripcion');
    }

    @isTest static Void testState(){ 
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        System.assertEquals(false, taskTest.state(), 'Obtener el estado');
    }

    @isTest static Void testChangeState(){ 
        
        Tarea taskTest = new Tarea('tituloTest', 'descripcionTest');

        taskTest.changeState();

        System.assertEquals(true, taskTest.state(), 'Obtener el estado');
    }


    


}