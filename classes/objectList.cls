public class objectList{
  List<SelectOption> options=null;
  public String val {get;set;}
 
  public List<SelectOption> getName()
  {
    List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();     
    options = new List<SelectOption>();
    
    for(Schema.SObjectType f : gd)
    {
       options.add(new SelectOption(f.getDescribe().getLabel(),f.getDescribe().getLabel()));
    }
    return options;
   }
}