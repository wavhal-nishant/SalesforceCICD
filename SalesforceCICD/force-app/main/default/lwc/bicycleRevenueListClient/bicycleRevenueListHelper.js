/*
Author: Nishant Mohan Wavhal
LWC Helper List Display column data and sortHelper
*/

export const columns = 
    [
        { label: 'Brand', fieldName: 'brand_name',type: 'text', sortable: "true" },
        { label: 'Model', fieldName: 'model_name', type: 'text', sortable: "true"},
        { label: 'First Registration Date', fieldName: 'registration_date', type: 'date', sortable: "true" },
        { label: 'Total Revenue', fieldName: 'total_revenue', type: 'currency', sortable: "true" },
    ];

export function sortHelper(fieldname, direction,bicyclewrapper) 
    {
        let parseData = JSON.parse(JSON.stringify(bicyclewrapper));

        let keyValue = (a) => 
            {
              return a[fieldname];
            };

        let isReverse = direction === 'asc' ? 1: -1;
        parseData.sort((x, y) => {x = keyValue(x) ? keyValue(x) : ''; y = keyValue(y) ? keyValue(y) : '';
                  return isReverse * ((x > y) - (y > x));
                       });

       return parseData;
    }