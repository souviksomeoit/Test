/*Force.com Cookbook Sample Code

  Chapter 6: Improving Data Quality

  "Preventing Duplicate Records from Saving"
 
  This Apex trigger prevents leads from being saved if they have a

  matching Email field.

  Sample code provided by salesforce.com. All rights reserved.

 */

trigger leadDuplicatePreventer on Lead (before insert, before update, after insert) {

  if (Trigger.isBefore) {

    Map<String, Lead> leadMap = new Map<String, Lead>();

 

    for (Lead lead : System.Trigger.new) {

     

        /* Make sure we don't treat an email address that

           isn't changing during an update as a duplicate. */

        if ((lead.Email != null) && (System.Trigger.isInsert || (lead.Email != System.Trigger.oldMap.get(lead.Id).Email))) {

     

            // Make sure another new lead isn't also a duplicate

            if (leadMap.containsKey(lead.Email)) {

                lead.Email.addError('Another new lead has the same email address.');

            } else {

                leadMap.put(lead.Email, lead);

            }

        }

    }

     

    /* Using a single database query, find all the leads in

       the database that have the same email address as any

       of the leads being inserted or updated. */

    for (Lead lead : [SELECT Email FROM Lead WHERE Email IN :leadMap.KeySet()]) {

        Lead newLead = leadMap.get(lead.Email);

        newLead.Email.addError('A lead with this email address already exists.');

    }

  } else if (Trigger.isAfter)  {

    // after leads are inserted

    List<Task> followupTasks = new List<Task>();// build list in memory

    for (Lead lead : System.Trigger.new) {

        Task task = new Task(

          WhoId = lead.Id,

          Description = 'Call this lead.',

          Priority = 'High',

          ReminderDateTime = System.now().addDays(2),

          Status = 'Not Started',

          Subject = 'New Lead');

        followupTasks.add(task);  // add to list

    }

    // insert the entire list

    insert followupTasks;  // NOTE: this is outside the above loop, only one insert is needed

 } // end of isAfter
}// end of trigger