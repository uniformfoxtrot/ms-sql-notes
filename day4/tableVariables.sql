
declare @tab1 table(id int, name char(10))

insert into @tab1 values(100,'Ankit'),(101,'Ankita')

select * from @tab1



--Multi statement table valued function
--Inline table valued function

alter function udf_cylinder(@radius int, @height int)
returns table
as
return(select 'Diameter' as Measure, 2*@radius as Value
union
select 'Volume' as Measure, 3.14*@radius*@radius*@height as Value
)


select * from dbo.udf_cylinder(2,3)

create function udf_mscylinder(@radius int, @height int)
returns @tab1 table(Measure char(10), Value numeric(5,2))
as
begin 
	insert into @tab1 values('Diameter', 2*@radius)

	insert into @tab1 values('Volume', 3.14*@radius*@radius*@height)
return
end


select * from dbo.udf_mscylinder(2,3)


