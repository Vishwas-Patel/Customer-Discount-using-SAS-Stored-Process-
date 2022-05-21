libname data "D:\Workshop\dift\Vishwas";


%MACRO RETAIL(CURR_DAY,Customer_ID);
%let WEEK= "&CURR_DAY"D - 7;
%let MONTH= "&CURR_DAY"D - 30;
%let YEAR= "&CURR_DAY"D - 365;

/*for one day discount*/
title "Customer Discount for Current day";
proc sql;
select  distinct Customer_ID,Customer_Name,Date
,sum(Amount) as Agg_Amt
from data.retail_1
where Date = "&CURR_DAY"d
and Customer_ID = "&Customer_ID" 
group by Customer_ID
having Agg_Amt >= 1000;
quit;
title;



/*for week*/
title "Customer Discount for current week";
proc sql;
select  distinct Customer_ID,Customer_Name
,sum(Amount) as Agg_Amt
from data.retail_1
where Date between &WEEK AND  "&CURR_DAY"d  
and Customer_ID = "&Customer_ID" 
group by Customer_ID
having Agg_Amt >= 2000;
quit;
title;

/*for one month*/
title "Customer Discount for Current month";
proc sql;
select  distinct Customer_ID,Customer_Name
,sum(Amount) as Agg_Amt
from data.retail_1
where Date between &MONTH AND  "&CURR_DAY"d  
and Customer_ID = "&Customer_ID" 
group by Customer_ID
having Agg_Amt >= 5000;
quit;
title;


/*for one month and count*/
title "Customer Discount for Current month and permanent customer";
proc sql;
select  distinct Customer_ID,Customer_Name
, COUNT(Amount) AS MONTH_CNT
,sum(Amount) as Agg_Amt
from data.retail_1
where Date between &MONTH AND "&CURR_DAY"d  
and Customer_ID = "&Customer_ID" 
group by Customer_ID
having Agg_Amt >= 5000
AND MONTH_CNT >= 4;
quit;
title;


/*for one year*/
title "Customer Discount for Current year";
proc sql;
select  distinct Customer_ID,Customer_Name
,sum(Amount) as Agg_Amt
from data.retail_1
where Date between &YEAR AND  "&CURR_DAY"d 
and Customer_ID = "&Customer_ID" 
group by Customer_ID
having Agg_Amt >= 8000;
quit;
title;

/*for one year and count*/
title "Customer Discount for Current year and permanent customer";
proc sql;
select  distinct Customer_ID,Customer_Name
, COUNT(Amount) AS YEAR_CNT
,sum(Amount) as Agg_Amt
from data.retail_1
where Date between &YEAR AND  "&CURR_DAY"d
and Customer_ID = "&Customer_ID"
group by Customer_ID
having Agg_Amt >= 8000
AND YEAR_CNT >= 6;
quit;
title;

%MEND RETAIL;

%RETAIL(CURR_DAY=&CURR_DAY,
Customer_ID =&Customer_ID);