/*
LWC Client Controller for HTML action ,Service Side action,Pagination Helper 
*/

import { LightningElement,api} from 'lwc';
import getRevenueList from '@salesforce/apex/BicycleRevenueListController.getRevenueList';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { columns,sortHelper } from './bicycleRevenueListHelper';

export default class BicycleRevenueListClient extends LightningElement 
{

    @api recordId;

    bicyclewrapper=[];
    recordsToDisplay = [];
    columns = columns;  
    sortBy;
    sortDirection;  
    totalRecords = 0; 
    totalPages;
    pageSize;
    pageNumber = 1;
    isloaded=false;
    msg;
    error; 
    
    get disableFirst() 
    {
        return this.pageNumber == 1;
    }

    get disableLast() 
    {
        return this.pageNumber == this.totalPages;
    }

    connectedCallback() 
    {     
        this.handleLoad();
    }

    handleLoad() 
    {
        getRevenueList({accountid:this.recordId}).
        then(result => 
            {
                this.bicyclewrapper=result;
                this.totalRecords = result.length;               
                this.pageSize = 8;
                this.paginationHelper(); 
                this.isloaded=true;
                if(result.length==0)
                    this.msg='No Records were Found ! ';
            }).
        catch(error => 
            {
                this.error = error;
                this.msg='Something Went Wrong Please Contact Administrator';
                this.dispatchEvent(new ShowToastEvent({title: "Error",message:this.error.body.message,variant: "Error",}),
                );
            });
    }

    handleRecordsPerPage(event) 
    {
        this.pageSize = event.target.value;
        this.paginationHelper();
    }

    previousPage() 
    {
        this.pageNumber = this.pageNumber - 1;
        this.paginationHelper();
    }

    nextPage() 
    {
        this.pageNumber = this.pageNumber + 1;
        this.paginationHelper();
    }

    firstPage() 
    {
        this.pageNumber = 1;
        this.paginationHelper();
    }

    lastPage() 
    {
        this.pageNumber = this.totalPages;
        this.paginationHelper();
    }

    doSorting(event)
     {  
        this.sortBy = event.detail.fieldName;
        this.sortDirection = event.detail.sortDirection;
        this.pageNumber = 1;
        this.bicyclewrapper =sortHelper(this.sortBy,this.sortDirection,this.bicyclewrapper);
        this.paginationHelper(); 
     }

    paginationHelper() 
    {
        this.recordsToDisplay = [];
        this.totalPages = Math.ceil(this.totalRecords / this.pageSize);

        if (this.pageNumber <= 1) 
        {
            this.pageNumber = 1;
        } 
        else if (this.pageNumber >= this.totalPages) 
        {
            this.pageNumber = this.totalPages;
        }

        for (let i = (this.pageNumber - 1) * this.pageSize; i < this.pageNumber * this.pageSize; i++)
        {
            if (i === this.totalRecords)
            {
                break;
            }
            this.recordsToDisplay.push(this.bicyclewrapper[i]);
        }
    }
    
}