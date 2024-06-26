//Assignment3
//Que 1
Select 
    c.custname, 
    ca.carmake, 
    ca.carmodel, 
    sum(ca.carlistprice) as totallistprice,
    avg(ca.carlistprice) as avglistprice
From 
    si.customer c
Join 
    si.car ca on c.custname = ca.custname  
Group by 
    c.custname, ca.carmake, ca.carmodel;



//Que 2

Select 
    c.custname,
    ca.carmake,
    ca.carmodel,
    sum(ca.carlistprice) over (partition by c.custname, ca.carmake, ca.carmodel) as totallistprice,
    sum(ca.carlistprice) over (partition by c.custname order by ca.carlistprice asc 
                                rows between unbounded preceding and current row) as cumulativelistprice
From 
    si.customer c
Join 
    si.car ca on c.custname = ca.custname 
Group by 
    c.custname, ca.carmake, ca.carmodel, ca.carlistprice
Order by 
    c.custname, ca.carmake, ca.carmodel, ca.carlistprice asc;

    
    
//Que3

Select carmake, carmodel, carsaleprice
From (
    select 
        c.carmake,
        c.carmodel,
        s.carsaleprice,
        dense_rank() over (order by s.carsaleprice asc) as rankasc,
        dense_rank() over (order by s.carsaleprice desc) as rankdesc
    from 
        si.car c
    inner join 
        si.saleinv s on c.carserial = s.carserial
) rankedcars
Where rankasc = 2 or rankdesc = 2;




//Que4

Select 
    c.carmake,
    c.carmodel,
    s.carsaleprice,
    c.carlistprice,
    round(avg(c.carlistprice) over (partition by c.carmake), 2) as avglistprice,
    round(avg(s.carsaleprice) over (partition by c.carmake), 2) as avgsaleprice,
    round(avg(c.carlistprice) over (partition by c.carmake), 2) - 
    round(avg(s.carsaleprice) over (partition by c.carmake), 2) as avgpricedifference
From 
    si.car c
Join 
    si.saleinv s on c.carserial = s.carserial;


//Que5

Select 
    oldest.carmake,
    oldest.oldestyear,
    oldest.lowestlistpricecar,
    newest.newestyear,
    newest.highestlistpricecar
From
    (select 
        carmake,
        min(caryear) as oldestyear,
        min(carlistprice) as lowestlistpricecar
    from 
        si.car
    group by 
        carmake) oldest
Join
    (select 
        carmake,
        max(caryear) as newestyear,
        max(carlistprice) as highestlistpricecar
    from 
        si.car
    group by 
        carmake) newest
On
    oldest.carmake = newest.carmake;


//Que6

Select 
    carmake,
    carmodel,
    round(avg(purchcost), 2) as avgcarsaleprice
From 
    si.car
Group by rollup (carmake, carmodel);
