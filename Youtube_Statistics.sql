--What are the most commented-upon videos? Or the most liked
select top 5 * from [videos-stats]
order by Likes desc

--How many total views does each category have? How many likes?
 select Keyword,SUM(v.Views) As TotalViews , Sum(v.Likes) As TotalLikes 
 from   [videos-stats] v
 group by Keyword
 order by keyword asc

 --What are the most-liked comments?
 select top 5 Comment , Likes 
 from comments 
 order by Likes desc
 -- What is the ratio of views/likes per video? Per each category?
 select Title, Views/nullif(Likes,0) as ratio 
 from [videos-stats]
 --Per Each category 
  select Keyword , SUM(views)/nullif(SUM(Likes),0) as Ratio 
 from [videos-stats]
 group by Keyword
 order by Ratio asc
 --What is the average sentiment score in each keyword category?
 select V.Keyword , AVG(C.Sentiment) as Average_Sentiment
 from [videos-stats] V 
 inner join comments C on V.Video_ID=C.Video_ID
 group by Keyword 
 order by Keyword asc

 --How many times do company names (i.e., Apple or Samsung) appear in each keyword category?

select V.Keyword,COUNT(C.Video_ID) As CountCompName  
 from [videos-stats] V 
 inner join comments C on V.Video_ID=C.Video_ID
 where Comment like '%Apple%' or Comment like '%Samsung%'
 group by Keyword 
 Order by CountCompName asc
 ; 

 


