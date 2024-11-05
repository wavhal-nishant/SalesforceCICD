/*
Apex Test Class for coverage of BicycleListController and BicycleWrapper for Different Users and Also per region and Exception
*/

@isTest
public class BicycleRevenueListTestClass 
{

    @TestSetup
    public static void testSetupbicycle()
    {   
        User thisUser = [SELECT Id FROM User WHERE Id = :UserInfo.getUserId()];
        System.runAs (thisUser) 
        {

            Id roleeuId = [Select Id From UserRole where Name='Sales APAC'].Id;
            Id roleusId = [Select Id From UserRole where Name='Sales EMEA'].Id;
            Id roleinId = [Select Id From UserRole where Name='Sales US'].Id;

            Id salesprofileId = [Select Id From Profile Where Name ='Custom: Sales Profile'].Id;
            Id supportprofileId = [Select Id From Profile Where Name ='Custom: Support Profile'].Id;


            User salesusereu = new User(FirstName = 'saleseufName',LastName = 'saleslName',email = 'saleseu@sfdc.org',Username = 'saleseu2345fName@sfdc.org',EmailEncodingKey = 'ISO-8859-1',Alias ='sEuro',TimeZoneSidKey = 'America/Los_Angeles',LocaleSidKey = 'en_US',LanguageLocaleKey = 'en_US',ProfileId = salesprofileId,UserRoleId=roleeuId,CurrencyIsoCode='EUR');
            User salesuserus = new User(FirstName = 'salesusfName',LastName = 'saleslName',email = 'salesus@sfdc.org',Username = 'salesus7893fName@sfdc.org',EmailEncodingKey = 'ISO-8859-1',Alias = 'sUsd',TimeZoneSidKey = 'America/Los_Angeles',LocaleSidKey = 'en_US',LanguageLocaleKey = 'en_US',ProfileId = salesprofileId,UserRoleId=roleusId,CurrencyIsoCode='USD' );
            User salesuserinr = new User(FirstName = 'salesinrfName',LastName = 'saleslName',email = 'salesinr@sfdc.org',Username = 'salesin36474fName@sfdc.org',EmailEncodingKey = 'ISO-8859-1',Alias ='sInr',TimeZoneSidKey = 'America/Los_Angeles',LocaleSidKey = 'en_US',LanguageLocaleKey = 'en_US',ProfileId = salesprofileId,UserRoleId=roleinId,CurrencyIsoCode='INR');
            User supportusereu = new User(FirstName = 'supportfName',LastName = 'saleslName',email = 'support@sfdc.org',Username = 'support8374fName@sfdc.org',EmailEncodingKey = 'ISO-8859-1',Alias = 'suInr',TimeZoneSidKey = 'America/Los_Angeles',LocaleSidKey = 'en_US',LanguageLocaleKey = 'en_US',ProfileId = supportprofileId);

            List<User> uList= new List<User>();
            uList.add(salesusereu);
            uList.add(salesuserus);
            uList.add(salesuserinr);
            uList.add(supportusereu);

            insert uList;
        }

        Account parrentacount=  new Account(Name='Customer Account Global',CurrencyIsoCode='EUR');
        Account a=  new Account(Name='Customer Account Europe 1',CurrencyIsoCode='EUR', ParentId=parrentacount.id);
        Account a1=  new Account(Name='Customer Account Europe 2',CurrencyIsoCode='EUR',ParentId=parrentacount.id);
        Account a2=  new Account(Name='Customer Account India 1',CurrencyIsoCode='INR',ParentId=parrentacount.id);
        Account a3=  new Account(Name='Customer Account India 2',CurrencyIsoCode='INR',ParentId=parrentacount.id);
        Account a4=  new Account(Name='Customer Account India 3',CurrencyIsoCode='INR',ParentId=parrentacount.id);
        Account a5=  new Account(Name='Customer Account India 4',CurrencyIsoCode='INR',ParentId=parrentacount.id);
        Account a6=  new Account(Name='Customer Account United States 1',CurrencyIsoCode='USD',ParentId=parrentacount.id);
        Account a7=  new Account(Name='Customer Account United States 2',CurrencyIsoCode='USD',ParentId=parrentacount.id);

        List<Account> aList= new List<Account>();
        aList.add(parrentacount);
        aList.add(a);
        aList.add(a1);
        aList.add(a2);
        aList.add(a3);
        aList.add(a4);
        aList.add(a5);
        aList.add(a6);
        aList.add(a7);

        insert aList;

        Test.starttest();

        Account a0 = [select id,name from Account where name ='Customer Account Europe 1' limit 1];
        Account a01 = [select id,name from Account where name ='Customer Account Europe 2' limit 1];
        Account a02 = [select id,name from Account where name ='Customer Account India 1' limit 1];
        Account a03 = [select id,name from Account where name ='Customer Account India 2' limit 1];
        Account a04 = [select id,name from Account where name ='Customer Account India 3' limit 1];
        Account a05 = [select id,name from Account where name ='Customer Account India 4' limit 1];
        Account a06 = [select id,name from Account where name ='Customer Account United States 1' limit 1];
        Account a07 = [select id,name from Account where name ='Customer Account United States 2' limit 1];


        Bicycle__c b1= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('08/07/2024'),Account__c=a0.id,CurrencyIsoCode='EUR');
        Bicycle__c b2= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('01/07/2024'),Account__c=a0.id,CurrencyIsoCode='EUR');
        Bicycle__c b3= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-003',Revenue__c=100.00,Registration_Date__c=Date.parse('08/11/2024'),Account__c=a0.id,CurrencyIsoCode='EUR');
        Bicycle__c b4= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=130.00,Registration_Date__c=Date.parse('21/02/2024'),Account__c=a0.id,CurrencyIsoCode='EUR');
        Bicycle__c b5= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('01/07/2024'),Account__c=a01.id,CurrencyIsoCode='EUR');
        Bicycle__c b6= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('11/12/2024'),Account__c=a01.id,CurrencyIsoCode='EUR');

        Bicycle__c b10= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('03/12/2024'),Account__c=a02.id,CurrencyIsoCode='INR');
        Bicycle__c b20= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('27/09/2024'),Account__c=a03.id,CurrencyIsoCode='INR');
        Bicycle__c b30= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-003',Revenue__c=100.00,Registration_Date__c=Date.parse('17/07/2024'),Account__c=a03.id,CurrencyIsoCode='INR');
        Bicycle__c b40= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=130.00,Registration_Date__c=Date.parse('09/07/2024'),Account__c=a04.id,CurrencyIsoCode='INR');
        Bicycle__c b50= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('01/03/2024'),Account__c=a04.id,CurrencyIsoCode='INR');
        Bicycle__c b60= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('03/02/2024'),Account__c=a05.id,CurrencyIsoCode='INR');

        Bicycle__c b11= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('03/04/2024'),Account__c=a07.id,CurrencyIsoCode='USD');
        Bicycle__c b21= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('11/05/2024'),Account__c=a07.id,CurrencyIsoCode='USD');
        Bicycle__c b31= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-003',Revenue__c=100.00,Registration_Date__c=Date.parse('07/09/2024'),Account__c=a07.id,CurrencyIsoCode='USD');
        Bicycle__c b41= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=130.00,Registration_Date__c=Date.parse('09/11/2024'),Account__c=a07.id,CurrencyIsoCode='USD');
        Bicycle__c b51= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('23/02/2024'),Account__c=a06.id,CurrencyIsoCode='USD');
        Bicycle__c b61= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('28/04/2024'),Account__c=a06.id,CurrencyIsoCode='USD');

        List<Bicycle__c> bList= new List<Bicycle__c>();
        bList.add(b1);
        bList.add(b2);
        bList.add(b3);
        bList.add(b4);
        bList.add(b5);
        bList.add(b6);

        bList.add(b10);
        bList.add(b20);
        bList.add(b30);
        bList.add(b40);
        bList.add(b50);
        bList.add(b60);

        bList.add(b11);
        bList.add(b21);
        bList.add(b31);
        bList.add(b41);
        bList.add(b51);
        bList.add(b61);

        insert bList;
        Test.stoptest();

    }

    @isTest  
    public static void testmethodRevenueListsysAdminUser() 
    {
        Account a =[select id from Account where name ='Customer Account Europe 1'limit 1];

        Test.startTest();
        List<BicycleRevenueWrapper> bwrap=BicycleRevenueListController.getRevenueList(a.id);
                Assert.areEqual(date.newInstance(2024,02,21),bwrap[0].registration_date);
                Assert.areEqual(250.00,bwrap[0].total_revenue);
                Assert.areEqual('PinarelloFasto-002',bwrap[0].attributeid);
                Assert.areEqual('Pinarello',bwrap[0].brand_name);
                Assert.areEqual('Fasto-002',bwrap[0].model_name); 
        Test.stopTest();

        Assert.areEqual(bwrap, bwrap);

    }

    @isTest
    public static void testmethodRevenueListSalesUserEU() 
    {
        User u = [select id from User where FirstName='saleseufName'];

        Account a0 = [select id,name from Account where name ='Customer Account Europe 1' limit 1];
        a0.OwnerId=u.Id;
        update a0;

        Account a01 = [select id,name from Account where name ='Customer Account Europe 2' limit 1];
        a01.OwnerId=u.Id;
        update a01;

        System.runAs(u) 
        {
            Bicycle__c b1= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('08/07/2024'),Account__c=a0.id,CurrencyIsoCode='EUR');
			Bicycle__c b2= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('01/07/2024'),Account__c=a0.id,CurrencyIsoCode='EUR');
			Bicycle__c b3= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-003',Revenue__c=100.00,Registration_Date__c=Date.parse('08/11/2024'),Account__c=a0.id,CurrencyIsoCode='EUR');
			Bicycle__c b4= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=130.00,Registration_Date__c=Date.parse('02/22/2024'),Account__c=a0.id,CurrencyIsoCode='EUR');
			Bicycle__c b5= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('01/07/2024'),Account__c=a01.id,CurrencyIsoCode='EUR');
			Bicycle__c b6= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('11/12/2024'),Account__c=a01.id,CurrencyIsoCode='EUR');


            List<Bicycle__c> bList= new List<Bicycle__c>();
            bList.add(b1);
            bList.add(b2);
            bList.add(b3);
            bList.add(b4);
            bList.add(b5);
            bList.add(b6);

            insert bList;

        Test.startTest();
        List<BicycleRevenueWrapper> bwrap=BicycleRevenueListController.getRevenueList(a0.id);
                Assert.areEqual(date.newInstance(2024,01,07),bwrap[0].registration_date);
                Assert.areEqual(250.00,bwrap[0].total_revenue);
                Assert.areEqual('PinarelloFasto-002',bwrap[0].attributeid);
                Assert.areEqual('Pinarello',bwrap[0].brand_name);
                Assert.areEqual('Fasto-002',bwrap[0].model_name); 
        Test.stopTest();
        }

    }

    @isTest
    public static void testmethodRevenueListSalesUserUS() 
    {   
        User u = [select id from User where FirstName='salesusfName'];

        Account a07 = [select id from Account where name ='Customer Account United States 1' limit 1];
        a07.OwnerId=u.Id;
        update a07;

        Account a06 = [select id from Account where name ='Customer Account United States 1' limit 1];
        a06.OwnerId=u.Id;
        update a06;

            System.runAs(u) 
            {
            Test.startTest();
			
            Bicycle__c b11= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('03/04/2024'),Account__c=a07.id,CurrencyIsoCode='USD');
			Bicycle__c b21= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('11/05/2024'),Account__c=a07.id,CurrencyIsoCode='USD');
			Bicycle__c b31= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-003',Revenue__c=100.00,Registration_Date__c=Date.parse('07/09/2024'),Account__c=a07.id,CurrencyIsoCode='USD');
			Bicycle__c b41= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=130.00,Registration_Date__c=Date.parse('09/11/2024'),Account__c=a07.id,CurrencyIsoCode='USD');
			Bicycle__c b51= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('02/23/2024'),Account__c=a06.id,CurrencyIsoCode='USD');
			Bicycle__c b61= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('04/28/2024'),Account__c=a06.id,CurrencyIsoCode='USD');

            List<Bicycle__c> bList= new List<Bicycle__c>();

            bList.add(b11);
            bList.add(b21);
            bList.add(b31);
            bList.add(b41);
            bList.add(b51);
            bList.add(b61);

            insert bList;

            List<BicycleRevenueWrapper> bwrap=BicycleRevenueListController.getRevenueList(a07.id);
                Assert.areEqual(date.newInstance(2024,02,23),bwrap[0].registration_date);
                Assert.areEqual(3.39,bwrap[0].total_revenue);
                Assert.areEqual('PinarelloFasto-002',bwrap[0].attributeid);
                Assert.areEqual('Pinarello',bwrap[0].brand_name);
                Assert.areEqual('Fasto-002',bwrap[0].model_name);           
            Test.stopTest();
            }

    }
  
    
        @isTest
    public static void testmethodRevenueListServicesUserINError() 
    {    
        User u = [select id from User where FirstName='supportfName'];

        Account a05 = [select id from Account where name ='Customer Account India 1' limit 1];
        a05.OwnerId=u.Id;
        update a05;

        Account a04 = [select id from Account where name ='Customer Account India 2' limit 1];
        a04.OwnerId=u.Id;
        update a04;

        Account a03 = [select id from Account where name ='Customer Account India 3' limit 1];
        a03.OwnerId=u.Id;
        update a03;


        System.runAs(u) 
            {
            Test.startTest();
            
			Bicycle__c b10= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('03/12/2024'),Account__c=a03.id,CurrencyIsoCode='INR');
			Bicycle__c b20= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('09/27/2024'),Account__c=a03.id,CurrencyIsoCode='INR');
			Bicycle__c b30= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-003',Revenue__c=100.00,Registration_Date__c=Date.parse('07/17/2024'),Account__c=a03.id,CurrencyIsoCode='INR');
			Bicycle__c b40= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=130.00,Registration_Date__c=Date.parse('09/07/2024'),Account__c=a04.id,CurrencyIsoCode='INR');
			Bicycle__c b50= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-002',Revenue__c=120.00,Registration_Date__c=Date.parse('01/03/2024'),Account__c=a04.id,CurrencyIsoCode='INR');
			Bicycle__c b60= new Bicycle__c(Brand__c='Pinarello', Model__c='Fasto-001',Revenue__c=100.00,Registration_Date__c=Date.parse('03/02/2024'),Account__c=a05.id,CurrencyIsoCode='INR');

            List<Bicycle__c> bList= new List<Bicycle__c>();
            bList.add(b10);
            bList.add(b20);
            bList.add(b30);
            bList.add(b40);
            bList.add(b50);
            bList.add(b60);

            insert bList;
            try
            {
            	List<BicycleRevenueWrapper> bwrap=BicycleRevenueListController.getRevenueList(a03.id);       
            }
            catch(Exception e)
            {   
                Assert.areEqual('Script-thrown exception',e.getmessage());
            }
     
            Test.stopTest();
            }

    } 

}