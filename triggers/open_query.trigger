trigger open_query on Enquire__c (after update) {
    AssignmentRule AR = new AssignmentRule();
    AR = [select id from AssignmentRule where SobjectType = 'Case' and Active = true limit 1];
    Database.DMLOptions dmlOpts = new Database.DMLOptions();
    dmlOpts.assignmentRuleHeader.assignmentRuleId= AR.id;
    
        List<Case> caseList= new List<Case>();
        for(Enquire__c en : System.Trigger.new)
        {
             if(en.Feedback__c=='Open Query')
             {
                  // en.addError('Souvik Insert');
                    Case c = new Case();
                    c.ContactId=en.Contact__c;
                    c.Status='New';
                    c.Origin='Phone';
                    c.Subject=system.label.Subject;
                    c.Enquire__c=en.Id;
                    c.setOptions(dmlOpts);
                    caseList.add(c);
                    
            }
              
        }
        Enquire__c en = new Enquire__c();
        en.addError('Error '+caseList.size());
        insert caseList;
        
}