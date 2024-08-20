-- SM Excellent! 100% See comments
use heartyhearthdb
GO

drop table if exists CookbookRecipe
drop table if exists Cookbook
drop table if EXISTS MealCourseRecipe
drop table if exists MealCourse
drop table if exists Meal
drop table if exists Course
drop table if EXISTS RecipeIngredient
drop table if EXISTS Instruction
drop table if exists Recipe
drop table if exists Staff
drop table if exists Ingredient
drop table if exists Measurement
drop table if exists Cuisine
GO

CREATE table dbo.Cuisine(
    CuisineID int not null identity primary key,
    CuisineName VARCHAR (50) not null
        constraint ck_Cuisinename_cannot_be_blank check(CuisineName <> '')
        constraint u_Cuisine_name unique
)

CREATE table dbo.Measurement(
    MeasurementID int not null identity primary key,
    MeasurementType varchar (25) not NULL
        constraint ck_MeasurementType_cannot_be_blank check(MeasurementType <> '')
        constraint u_Measurement_Type unique
)

create table dbo.Ingredient(
    IngredientID int not null identity primary key,
    Item  VARCHAR (100) not null
        constraint ck_Ingredient_Item_cannot_be_blank check(Item <> '')
        constraint u_Ingredient_Item unique,
-- SM Also update this image.
    IngredientImage as CONCAT(item,'-','@jpeg')   
)

create table dbo.Staff(
    StaffID int not null identity primary key,
    FirstName varchar (20) not null
        constraint ck_Staff_FirstName_cannot_be_blank check(FirstName <> ''),
    LastName varchar (20) not null
        constraint ck_Staff_LastName_cannot_be_blank check(LastName <> ''),
    UserName varchar (100) not null
        constraint u_Staff_UserName unique
        constraint ck_Staff_UserName_cannot_be_blank check(UserName <> '')
)

create table dbo.Recipe(
    RecipeID int not null identity primary key,
    StaffID int not null 
        constraint f_Recipe_Staff foreign key references Staff(StaffId),
    CuisineID int not null 
        constraint f_Recipe_Cuisine foreign key references Cuisine(CuisineId),
    RecipeName VARCHAR (30) not null
        constraint ck_Recipe_Name_cannot_be_blank check(RecipeName <> '')
        constraint u_Recipe_Name unique,
    Calories int not null 
        constraint ck_Recipe_Calories_must_be_greater_or_equal_to_zero check(Calories >= 0),
    DraftDate DATETIME not null default getdate()
        constraint ck_Recipe_Draft_Date_can_not_be_in_the_futue CHECK(DraftDate <= GETDATE()),
    PublishDate DATETIME
        constraint ck_Recipe_Published_Date_can_not_be_in_the_futue CHECK(PublishDate <= GETDATE()),
    ArchivedDate DATETIME
        constraint ck_Recipe_Archived_Date_can_not_be_in_the_futue CHECK(ArchivedDate <= GETDATE()),
-- SM Do this: when archiveddate is not null then 'Archive' else case when when PublishDate is not null then 'Published' else 'Draft' end end
    Recipestatus as case 
        when archiveddate is not null then 'Archive'  
        when PublishDate  is null then 'Draft'
        when PublishDate  is null and archiveddate is null then 'Draft' 
        else case when archiveddate is null then 'Published' end
        end persisted,
    RecipeImage as CONCAT('Recipe-', replace(RecipeName,' ', '-'),'.jpeg'),
        constraint ck_Recipe_Published_Date_Cant_be_before_Draft_date CHECK(PublishDate >= DraftDate),
        constraint ck_Recipe_Archived_Date_Cant_be_before_Draft_date CHECK(ArchivedDate >= DraftDate)
)

create table dbo.Instruction(
    InstructionID int not null identity primary key,
    RecipeId int not null 
        constraint f_Instruction_Recipe foreign key references Recipe(RecipeId),
    StepNumber int not null 
        constraint ck_Instruction_StepNumber_must_be_greater_than_0 check(StepNumber > 0),
    InstructionDescription varchar (300) not null
        constraint ck_Instruction_description_cannot_be_blank check(InstructionDescription <> ''),
        constraint u_Instruction_RecipeID_StepNumber UNIQUE (RecipeID, StepNumber)
)    


create table dbo.RecipeIngredient(
    RecipeIngredientID int not null identity primary key,
    RecipeID int not null 
        constraint f_RecipeIngredient_Recipe foreign key references Recipe(RecipeId),
    IngredientID int not null 
        constraint f_RecipeIngredient_Ingredient foreign key references Ingredient(IngredientId),
    MeasurementID int  
        constraint f_RecipeIngredient_Measurement foreign key references Measurement(MeasurementId),
    Amount decimal (4,2) not null
    CONSTRAINT ck_RecipeIngredient_amount_cant_be_less_than_zero CHECK (amount > 0),
    IngredientCode int not null
        constraint ck_Ingredient_IngredientCode_must_be_greater_than_0 check(IngredientCode > 0)
        constraint u_Ingredient_IngredientCode unique(RecipeID, IngredientCode),
)    

create table dbo.Course(
    CourseID int not null identity primary key,
    CourseName varchar (25) not null
        CONSTRAINT ck_Course_Course_Name_can_not_be_blank CHECK (CourseName <> '')
        constraint u_Course_Name unique,
    CourseOrder int not null
        CONSTRAINT ck_Course_Course_order_must_be_greater_than_zero CHECK (Courseorder > 0)
        constraint u_Course_order unique
)    

create table dbo.Meal(
    MealID int not null identity primary key,
    StaffID int not null 
        constraint f_Meal_Staff foreign key references Staff(StaffId),
    MealName varchar (30) not NULL 
        CONSTRAINT ck_Meal_Meal_Name_can_not_be_blank CHECK (MealName <> '')
        constraint u_Meal_MealName unique,
    Active bit not null default 1,
    DateCreated date not null
        CONSTRAINT ck_Meal_Date_Created_can_not_be_in_the_futue CHECK (DateCreated < GETDATE()),
    MealImage as CONCAT('Meal-',replace(MealName,' ', '-'),'.jpeg')
)    


create table dbo.MealCourse(
    MealCourseID int not null identity primary key,
    MealID int not null 
        constraint f_MealCourse_Meal foreign key references Meal(MealId),
    CourseID int not null 
        constraint f_MealCourse_Course foreign key references Course(CourseId),
        constraint u_MealCourse_Meal_course UNIQUE (Mealid, CourseID)
)

create table dbo.MealCourseRecipe(
    MealCourseRecipeID int not null identity primary key,
    Mealcourseid int not null 
        constraint f_MealCourseRecipe_Mealcourse foreign key references Mealcourse(MealcourseId),
    RecipeID int not null         
        constraint f_MealCourseRecipe_Recipe foreign key references Recipe(RecipeId),
    MainDish bit not null,
        constraint u_MealCourseRecipe_Mealcourse_Recipe UNIQUE (Mealcourseid, RecipeID)
)    

Create table dbo.Cookbook(
    CookbookID int not null IDENTITY primary key,
    Staffid int not null 
        constraint f_Cookbook_Staff foreign key references Staff(StaffId),
    CookbookName varchar (50) not NULL
        constraint u_Cookbook_Cookbook_Name unique
        constraint ck_Cookbook_coook_book_name_can_not_be_blank CHECK (CookbookName <> ''),
    Price decimal (4,2) not null
        constraint CK_Cookbook_Price_must_be_greater_than_zero check (price > 0), 
    Active bit not null default 1,
    Datecreated date not NULL
        CONSTRAINT ck_Cookbook_Date_Created_can_not_be_in_the_futue CHECK (DateCreated <= GETDATE()),
    CookbookImage as CONCAT('Cookbook-',replace(cookbookName,' ', '-'),'.jpeg') 
)

create table dbo.CookbookRecipe(
    CookbookRecipeID int not null IDENTITY PRIMARY key,
    CookbookID int not null 
        constraint f_CookbookRecipe_Cookbook foreign key references Cookbook(CookbookId),
    RecipeID int not null 
        constraint f_CookbookRecipe_Recipe foreign key references Recipe(RecipeId),
    RecipeSequence int not null
        CONSTRAINT ck_CookbookRecipe_RecipeSequence_must_be_greater_than_0 check (recipesequence > 0)
        constraint u_CookbookRecipe_Cookbook_Recipe UNIQUE (Cookbookid, RecipeID),
        constraint u_CookbookRecipe_Cookbook_sequence UNIQUE (Cookbookid, RecipeSequence)
)   

