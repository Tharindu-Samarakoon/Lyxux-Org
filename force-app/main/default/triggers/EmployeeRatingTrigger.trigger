trigger EmployeeRatingTrigger on Employee__c (after insert, after update, after delete) {
    if(Trigger.isInsert || Trigger.isUpdate){
        EmployeeRatingTriggerHandler.handleEmployeeUdpate(Trigger.new);
    } else if(Trigger.isDelete){
        EmployeeRatingTriggerHandler.handleEmployeeUdpate(Trigger.old);
    }
}