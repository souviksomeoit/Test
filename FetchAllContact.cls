global class FetchAllContact{
    
    webservice static Contact FetchContact(string email){
        Contact c = [Select FirstName,LastName from Contact where Email =:email limit 1];
        return c;
    }
}