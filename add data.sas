
libname data "D:\Workshop\dift\Vishwas";

/*Add data into database*/
%macro Add_Data(Customer_ID,Customer_Name,
City,State,Country,Amount,Date,Quantity);
data data.retail_1;
    set data.retail_1 end=eof;
    output;
 
    if eof then do;	
        Customer_ID = "&Customer_ID";
        Customer_Name = "&Customer_Name";
		City = "&City";
		State = "&State";
		Country = "&Country";
		Amount= &Amount;
		Date = "&Date"d;
		Quantity = &Quantity;
       
        output;
    end;
run;
proc print data=data.retail_1;
where Customer_ID = "&Customer_ID";
run;
%mend Add_Data;



%Add_Data(Customer_ID=&Customer_ID,
Customer_Name=&Customer_Name,
City=&City,
State=&State,
Country=&Country,
Amount=&Amount,
Date=&Date,
Quantity=&Quantity);