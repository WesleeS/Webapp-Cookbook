Create Table Cookbook (
    CookBookID Int Unsigned Not Null Auto_Increment Primary Key,
    Name VarChar(30) Not Null;
    Edition VarChar(10) Default Null;
    Genre VarChar(15) Default Null;
);

Create Table Recipe (
    RecipeID Int Unsigned Not Null Auto_Increment Primary Key,
    Name VarChar(30) Not Null,
    Page VarChar(15) Default Null Unique,
    CookbookID Int Not Null,
    Foreign Key(CookbookID) references Cookbook(CookBookID)
        ON DELETE Cascade,
);

Create Table Ingredient(
    IngredientID Int Unsigned Not Null Auto_Increment Primary Key,
    Name VarChar(30) Not Null,
);

Create Type Vegan Under Ingredient(
    FoodType VarChar(30) Not Null,

);

Create Table IngredientSubstitution(
    FirstSub Int Not Null,
    Foreign Key(FirstSub) references Ingredient(IngredientID)
        ON DELETE Cascade,
    SecondSub Int Not Null,
    Foreign Key(SecondSub) references Ingredient(IngredientID)
        ON DELETE Cascade,
);

Create Table RecipeIngredientLink(
    RecipeID Int Not Null,
    IngredientID Int Not Null,
    Foreign Key(RecipeID) references Recipe(RecipeID)
        ON DELETE Cascade,
    Foreign Key(IngredientID) references Ingredient(IngredientID)
        ON DELETE Cascade,
);