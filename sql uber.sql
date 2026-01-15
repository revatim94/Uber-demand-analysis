create database ubergap;
use ubergap;
/*based on hour*/
SELECT
  TIMESTAMPDIFF(
    second,
    TIMESTAMP(request_date,request_time),
    TIMESTAMP(drop_date,drop_time)
  ) /3600 AS total_hours
FROM ube;
/*count of pickup_point based on category(uber demand gap)*/
SELECT
    request_time,
    CASE
        WHEN TIME(request_time) >= '00:00:00' AND TIME(request_time) < '06:00:00' THEN 'Early Morning'
        WHEN TIME(request_time) >= '06:00:00' AND TIME(request_time) < '12:00:00' THEN 'Morning'
        WHEN TIME(request_time) >= '12:00:00' AND TIME(request_time) < '17:00:00' THEN 'Afternoon'
        WHEN TIME(request_time) >= '17:00:00' AND TIME(request_time) < '21:00:00' THEN 'Evening'
        WHEN TIME(request_time) >= '21:00:00' AND TIME(request_time) <= '23:59:59' THEN 'Late Night'
        ELSE 'Unknown'
    END AS time_category,
    COUNT(*) AS pickup_count
FROM ube
GROUP BY
case
WHEN TIME(request_time) >= '00:00:00' AND TIME(request_time) < '06:00:00' THEN 'Early Morning'
        WHEN TIME(request_time) >= '06:00:00' AND TIME(request_time) < '12:00:00' THEN 'Morning'
        WHEN TIME(request_time) >= '12:00:00' AND TIME(request_time) < '17:00:00' THEN 'Afternoon'
        WHEN TIME(request_time) >= '17:00:00' AND TIME(request_time) < '21:00:00' THEN 'Evening'
        WHEN TIME(request_time) >= '21:00:00' AND TIME(request_time) <= '23:59:59' THEN 'Late Night'
        ELSE 'Unknown'
        end;


SET sql_mode = '';

/*count of request_id based on category(supply demand uber gap on day)*/

SELECT
    CASE
        WHEN TIME(request_time) >= '00:00:00' AND TIME(request_time) < '06:00:00' THEN 'Early Morning'
        WHEN TIME(request_time) >= '06:00:00' AND TIME(request_time) < '12:00:00' THEN 'Morning'
        WHEN TIME(request_time) >= '12:00:00' AND TIME(request_time) < '17:00:00' THEN 'Afternoon'
        WHEN TIME(request_time) >= '17:00:00' AND TIME(request_time) < '21:00:00' THEN 'Evening'
        WHEN TIME(request_time) >= '21:00:00' AND TIME(request_time) <= '23:59:59' THEN 'Late Night'
        ELSE 'Unknown'
    END AS time_category,
    COUNT(*) AS requestid_count
FROM ube
GROUP BY
case
WHEN TIME(request_time) >= '00:00:00' AND TIME(request_time) < '06:00:00' THEN 'Early Morning'
        WHEN TIME(request_time) >= '06:00:00' AND TIME(request_time) < '12:00:00' THEN 'Morning'
        WHEN TIME(request_time) >= '12:00:00' AND TIME(request_time) < '17:00:00' THEN 'Afternoon'
        WHEN TIME(request_time) >= '17:00:00' AND TIME(request_time) < '21:00:00' THEN 'Evening'
        WHEN TIME(request_time) >= '21:00:00' AND TIME(request_time) <= '23:59:59' THEN 'Late Night'
        ELSE 'Unknown'
        end;
        
	/*count of pickup_point according to driver id*/
select driver_id,pickup_point,count(*)as pickup_pointcount from ube group by Driver_id, Pickup_point;

/*supply demand uber count of cancelled*/
select count(Driver_id) from ube where Driver_id="na";





