trigger testAccountTriger on Account (before insert) {
    
   
    
    List<Account> updateObj =new List<Account>();
        
        updateObj = [SELECT Name FROM Account];
        Integer i=0;
        for(Account obj:updateObj)
        {
            obj.Name='Suvenjit deb';
            update obj;
            
        }
        //updateObj.Name=accountNumber;
        
   
}