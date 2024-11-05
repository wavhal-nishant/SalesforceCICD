/*
Apex Class  Bicycle Revenue List Controller for LWC
*/
   
public with sharing class BicycleRevenueListController {
        
        @AuraEnabled(cacheable=true)
        public static List<BicycleRevenueWrapper> getRevenueList(Id accountid)
        {
         
            Map<String,BicycleRevenueWrapper> brWrapperMap= new Map<String,BicycleRevenueWrapper>();
             
            try
            {
                for(Bicycle__c brecord:[select id,Registration_Date__c,convertCurrency(Revenue__c), Brand__c, Model__c from Bicycle__c  where account__c=:accountid WITH USER_MODE order by Registration_Date__c  ])
                {
                    if(!brWrapperMap.containsKey(brecord.Brand__c+brecord.Model__c))
                    {   
                        brWrapperMap.put(brecord.Brand__c+brecord.Model__c,new BicycleRevenueWrapper(brecord.Brand__c+brecord.Model__c,brecord.Brand__c,brecord.Model__c,brecord.Registration_Date__c,brecord.Revenue__c));
                    }
                    else
                    {
                      BicycleRevenueWrapper brwrapper=brWrapperMap.get(brecord.Brand__c+brecord.Model__c);
                      brwrapper.total_revenue+=brecord.Revenue__c;
                      brWrapperMap.put(brecord.Brand__c+brecord.Model__c,brwrapper);                  
                    }                   
                }   
                
                return brWrapperMap.values();
            }
            catch(Exception e)
            {
               throw new AuraHandledException('Something Went wrong ,Please Contact the Administrator :'+e.getMessage());             
            }
           
        }
    }