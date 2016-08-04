@istest
public class TestLead 
{
    testMethod static void insertNewUser() 
    {
       
      Lead lead = new Lead();
      //lead.RecordTypeId='WebLead';
      lead.FirstName='Souvik';
      lead.LastName='Some';
      lead.Status='Open - Not Contacted';
      lead.LeadSource='Web';
      lead.Company='OIT';
      lead.Email='abdadasdasdscd@gmail.com';
      insert lead;
      }
}