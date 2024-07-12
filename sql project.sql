---Q1 who is the senior most employee based on job title?

select * from employee
order by levels desc

---Q2 which countries have most invoices?

select * from invoice

select COUNT(*) as c ,billing_country from invoice
group by billing_country
order by c desc

---what are top 3 values of total invoices?

select top 3 * from invoice
order by total desc

/* which city has the best customers? we would like to throw a promotional music festival
in the city we made the most money.write a query that returns one city thst has highest sum of invoices totals.
return both the city name & sum of all invoce total*/

select SUM(total) as invoice_total,billing_city 
 from invoice
 group by billing_city
 order by invice_total desc


 /* Q5 who is the best customer? the customer who as spent the most money will be declared the best customer. 
 write a query that returns the person who has spent the most money.*/


select customer.customer_id,
SUM(invoice.total) as total from customer
join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total desc


select * from customer 
where customer_id=5



---MODERATE---

/*Q1 write a query to return email,first name,last name and genre of all rock music listener.return your list 
ordered alphabetically by email starting with A*/


select email,first_name,last_name from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in(
                  select track_id from track3
				  join genre on track3.genre_id = genre.genre_id
				  where genre.name like 'Rock'
)
order by email


/*Q2 lets invite the artist who written the most rook music in our data set.write a query that returns the 
artist name and total track count of the top 10 rock bands*/


select top 10 artist.artist_id,artist.name,COUNT( artist.artist_id) as number_of_songs
from track3
join album on album.album_id = track3.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track3.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc


/*Q3 return all the track names that have a song length longer than the average song length. 
return the name and millisecond for each track.Order by the song length with the longest songs listed first*/


select name,milliseconds
from track3
where milliseconds>(
         select AVG( milliseconds) as avg_track_length
		 from track3)
order by milliseconds desc


---









 

