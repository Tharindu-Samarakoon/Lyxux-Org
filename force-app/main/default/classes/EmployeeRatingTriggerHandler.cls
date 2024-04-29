public with sharing class EmployeeRatingTriggerHandler {
    public EmployeeRatingTriggerHandler() {

    }

    public static void handleEmployeeUdpate(Employee__c[] employees) {
        for(Employee__c employee : employees) {
            updateCompanyRating(employee.company__c);
        }

    }

    public static void updateCompanyRating(ID company){
        Decimal sum = 0;
        Employee__c[] empList = [SELECT name, rating__c FROM employee__c WHERE company__c = :company];
        for(Employee__c employee : empList){
            sum = sum + employee.rating__c;
        }
        System.debug('Employee avg: ' + sum/empList.size());
        Company__c comp = [SELECT id, name, Average_Rating__c FROM Company__c WHERE id = :company];
        comp.Average_Rating__c = sum/empList.size();
        update comp;
    }
}