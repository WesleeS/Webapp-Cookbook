Create Table Cookbook (
    CookBookID Int Unsigned Not Null Auto_Increment Primary Key,
    Name VarChar(30) Not Null,
    Edition VarChar(10) Default Null,
    Genre VarChar(15) Default Null
    );

Create Table Recipe (
    RecipeID Int Unsigned Not Null Auto_Increment Primary Key,
    Name VarChar(30) Not Null,
    Page VarChar(15) Default Null Unique,
    CookbookID Int Unsigned Not Null,
    Foreign Key(`CookbookID`) references `Cookbook`(`CookBookID`)
        ON DELETE Cascade
);

Create Table VeganDetail(
    VeID Int Unsigned Not Null Auto_Increment Primary Key,
    FoodType VarChar(30) Not Null,
    IsImitation BOOLEAN Not Null,
    GlutenFree BOOLEAN Not Null
);

Create Table Ingredient(
    IngredientID Int Unsigned Not Null Auto_Increment Primary Key,
    Name VarChar(30) Not Null,
    VeID Int Unsigned Default Null,
    Foreign Key(`VeID`) references `VeganDetail`(`VeID`)
);

Create Table IngredientSubstitution(
    FirstSub Int Unsigned Not Null,
    SecondSub Int Unsigned Not Null,
    Foreign Key(`FirstSub`) references `Ingredient`(`IngredientID`)
        ON DELETE Cascade,
    Foreign Key(`SecondSub`) references `Ingredient`(`IngredientID`)
        ON DELETE Cascade
);

Create Table RecipeIngredientLink(
    RecipeID Int Unsigned Not Null,
    IngredientID Int Unsigned Not Null,
    Foreign Key(`RecipeID`) references `Recipe`(`RecipeID`)
        ON DELETE Cascade,
    Foreign Key(`IngredientID`) references `Ingredient`(`IngredientID`)
        ON DELETE Cascade
);

INSERT INTO IngredientSubstitution (FirstSub, SecondSub) VALUES (
    1, 9
);
INSERT INTO IngredientSubstitution (FirstSub, SecondSub) VALUES (
    10, 11
);