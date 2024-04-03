-- SM Excellent sketch! See comments, add unique constraints, and add pictures for recipe meal and cookbook. I believe you can go on and start the database.
/*
cuisine
    CuisineName varchar (50)

measurement 
    Type varchar (15)

Ingridient 
    item varchar (100)
    unique
    picture computed --DOES THIS NEED ITS OWN TABLE? -- SM No

Staff
    firstname
    lastname
    username

Recipe
    Name varchar(100)
    unique name
    SaffID (fk)
    cuisineid(fk)
    Calories int
-- SM We only need date, and add computed column to determine current status
    draft date and time
    published date and time
    archived date and time

Instruction
    StepNumber int
    recipeid
    Instruction varchar (100)
    StepNumber Should be unique to recipe


RecipeIngredient
    recipeid
    ingredientid
    measurementid
    amount int

MealCourseRecipe
    MealCoursesid
    recipeid
    picture computed

courses
    varchar (25)

Meal
    unique
    mealname varchar (30)
    StaffID (fk)
    active or inactive bit
    Datecreated date

MealCourse
    mealsid
    courseid

Cookbook
    unique
    varchar (50)
    price decimal
    active or inactive bit
    Datecreated date
    picture computed

-- SM We need sequence for recipe
CookbookRecipe
    cookbookid
    recipeid

*/