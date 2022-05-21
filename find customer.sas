libname data "D:\Workshop\dift\Vishwas";
/*find customer*/
%macro find(Customer_ID,Customer_Name);
title "Customer Details";
proc print data=data.retail_1;
where Customer_ID like "&Customer_ID%" or Customer_Name like "&Customer_Name%";
run;
title;
%mend find;
%find(Customer_ID=&Customer_ID,
Customer_Name=&Customer_Name);

%let Customer_ID=BP-11050;
%let Customer_Name=Barry Pond;


title "Customer Details";
proc print data=data.retail_1;
where Customer_ID like "&%Customer_ID%" or Customer_Name like "&%Customer_Name%";
run;
title;