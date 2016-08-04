public class Test {
	public static void SayYou()
	{
		system.debug('Say Hello');
	}
    public static void SayMe()
    {
        System.debug('Sys Hi');
    }
    public void oddEven()
    {
        Integer n = 7;
        if(Math.mod(n, 2) == 0)
        {
            System.debug('Even No');
        }
        else 
        {
            System.debug('Odd no');
        }
    }
    public static void method()
    {
        String sampleString='Hello World!';
        system.debug('Length of sampleString is='+ sampleString.length());
        system.debug(sampleString.endswith('!'));
        system.debug(sampleString.substring(0,sampleString.length()/2));
        Boolean LeapYear=True;
        if(LeapYear)
        {
            System.debug('Leap Year');
        }
        Boolean list1 = True;
        System.debug('You are '+ (list1?'great':'not so great'));
        Student__c[] obj = [select id,name,Gender__c from student__C where Gender__c='Female'];
        System.debug(obj.size());
        System.debug('count '+[select id,name,Gender__c from student__C where Gender__c='Male'].size());
        System.debug(obj);
        for(Integer i = 0; i<obj.size();i++)
        {
            
            	System.debug('Result Gender = '+obj[i]);
                break;
            
        }
        //System.debug('Get : ');
        //System.debug('Here ID '+obj.get(10));
        //Account[] Accts= [Select id,name from Account];
		Map<id, Account> AccMAp = new Map<id, Account>([SELECT Id,Name,Owner.Username FROM Account]);
		system.debug('Get : '+AccMAp.get('000'));
    }
    public static void customMessage()
    {
        System.debug(system.label.Custom_Label);
    }
}