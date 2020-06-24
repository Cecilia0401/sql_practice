-- 1. Finding 5 oldest users
select * 
from users
order by created_at
limit 5;

-- 2. Most popular registration date;
select 
    dayname(created_at) as day,
    count(*) as total
from users
group by day
order by total DESC
limit 2;

--3. Identify inactive users(no photos)
select username 
from users left join photos
    on users.id = photos.user_id
where photos.id is null;

-- 4. Identify most popular photo
select 
    username,
    photos.id, 
    photos.image_url,
    count(*) as total
from photos
inner join likes
    on likes.photo_id = photos.id
inner join users    
    on photos.user_id = users.id
group by photos.id
order by total DESC
limit 1;
    
    
-- 5. Calculate average number of photos peru ser
select 
    (select count(*)from photos)/(select count(*) from users)as avg;
    
-- 6. Find the five most popular hastags
select 
    tags.tag_name,
    count(*) as total
    from photo_tags
        join tags
        on photo_tags.tag_id = tags.id
group by tags.id
order by total desc
limit 5;


-- 7. Finding bots - users who liked every single photo
select
    username,
    count(*) as num_likes
from users
    inner join likes 
        on users.id = likes.user_id
group by likes.user_id
having num_likes = (select count(*) from photos);



    