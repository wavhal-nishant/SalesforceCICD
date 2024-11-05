/*
Apex Class Bicycle Revenue Wrapper for Bicycle Revenue List Controller
*/
public class BicycleRevenueWrapper {
       
       @AuraEnabled
        public String attributeid;
       @AuraEnabled
        public String brand_name;
       @AuraEnabled
        public String model_name;
       @AuraEnabled
        public Date registration_date;
       @AuraEnabled
        public Decimal total_revenue;
     

      public BicycleRevenueWrapper(String attributeid,String brand_name,String model_name,Date registration_date,Decimal total_revenue){
         this.attributeid=attributeid;
         this.brand_name=brand_name;
         this.model_name=model_name;
         this.registration_date=registration_date;
         this.total_revenue=total_revenue;
        }  
}