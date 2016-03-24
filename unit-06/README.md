# Delivering Information

It's not enough to get content into your database -- your users need to pull it out in some way to take advantage of it. 

## Transform on Read
The way you store data may not be the way you want to present data. You can change data on the way out with a transform. Modifying what content gets passed along is a strategy called Schema on Read. 

## Transform on Write
The previous units have used Corb to do in-place transformations after data was loaded. Once we know how we want data to be changed, we have the option of transforming it during the loading process. 
