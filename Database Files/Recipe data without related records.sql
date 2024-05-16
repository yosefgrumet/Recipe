INSERT Recipe(StaffID, CuisineID, RecipeName, Calories, DraftDate, PublishDate, ArchivedDate)
select  3, 2, 'Cinnamon Bun', 200, getdate(), null, null
union select  2, 1, 'Diet Muffin', 70, '2023-05-15', '2023-05-16', '2023-05-19'
union select  1, 1, 'Pancakes', 170, '2023-08-05', '2024-01-16', null
union select  2, 2, 'Chicken on the Bone', 90, '2022-01-25', '2023-05-16', null