libname data "D:\Workshop\dift\Vishwas";

%macro delete_data(Customer_ID,Date,Amount);
title "Customer Old Data";
data data.retail_1;
    set data.retail_1;
 
    if Customer_ID = "&Customer_ID" and 
Date = "&Date"d and
Amount= &Amount then delete;
run;
proc print data=data.retail_1;
where Customer_ID = "&Customer_ID";
run;
title;
%mend delete_data;

%delete_data(Customer_ID=&Customer_ID,
Date=&Date,
Amount=&Amount);