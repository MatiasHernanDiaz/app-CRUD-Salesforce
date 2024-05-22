
@isTest
private with sharing class TareaControllerTest {
    
    @isTest static public void testAssignanId() {
        
        Test.startTest();
        Tarea__c nuevaTarea = new Tarea__c(titulo__c = 'sdasd', descripcion__c = 'dsdsadsadsad');
        Test.stopTest();
        //Boolean res = nuevaTarea instanceOf Tarea__c;
        //System.AssertEquals(true, res, 'No es del tipo esperado');
        
        System.assertEquals('sdasd' , nuevaTarea.titulo__c, 'son iguals');

    }

    
}
