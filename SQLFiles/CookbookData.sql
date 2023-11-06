Insert Into Cookbook (Name,Edition,Genre) Values (
    'Betty Crocker''s Best of Baking', 1998, 'Baking'
);

Insert Into Recipe (Name, Page, CookbookID) Values (
    'Fudge Melt-Away Squares', './PLACEHOLDER.html/', 1
);

Insert Into VeganDetail(FoodType, IsImitation, GlutenFree) Values (
    'fruit', 0, 1
);
Insert Into VeganDetail(FoodType, IsImitation, GlutenFree) Values (
    'nut', 0, 1
);
Insert Into VeganDetail(FoodType, IsImitation, GlutenFree) Values (
    'other', 0, 1
);
Insert Into VeganDetail(FoodType, IsImitation, GlutenFree) Values (
    'spice', 0, 1
);
Insert Into VeganDetail(FoodType, IsImitation, GlutenFree) Values (
    'nut', 1, 1
);
Insert Into VeganDetail(FoodType, IsImitation, GlutenFree) Values (
    'grain', 1, 1
);

Insert Into Ingredient (Name, VeID) Values (
    'butter', NULL
);
Insert Into Ingredient (Name, VeID) Values (
    'chocolate', NULL
);
Insert Into Ingredient (Name, VeID) Values (
    'graham cracker', NULL
);
Insert Into Ingredient (Name, VeID) Values (
    'flaked coconut', 1
);
Insert Into Ingredient (Name, VeID) Values (
    'nuts', 2
);
Insert Into Ingredient (Name, VeID) Values (
    'granulated sugar', 3
);
Insert Into Ingredient (Name, VeID) Values (
    'vanilla', 4
);
Insert Into Ingredient (Name, VeID) Values (
    'powdered sugar', 3
);
Insert Into Ingredient (Name, VeID) Values (
    'margarine', 3
);
Insert Into Ingredient (Name, VeID) Values (
    'milk', NULL
);
Insert Into Ingredient (Name, VeID) Values (
    'almond milk', 5
);
Insert Into Ingredient (Name, VeID) Values (
    'oat milk', 6
);

Insert Into RecipeIngredientLink (RecipeID, IngredientID) Values (
    1, 1
);
Insert Into RecipeIngredientLink (RecipeID, IngredientID) Values (
    1, 2
);
Insert Into RecipeIngredientLink (RecipeID, IngredientID) Values (
    1, 3
);
Insert Into RecipeIngredientLink (RecipeID, IngredientID) Values (
    1, 4
);
Insert Into RecipeIngredientLink (RecipeID, IngredientID) Values (
    1, 5
);
Insert Into RecipeIngredientLink (RecipeID, IngredientID) Values (
    1, 6
);
Insert Into RecipeIngredientLink (RecipeID, IngredientID) Values (
    1, 7
);
Insert Into RecipeIngredientLink (RecipeID, IngredientID) Values (
    1, 8
);
Insert Into RecipeIngredientLink (RecipeID, IngredientID) Values (
    1, 9
);
Insert Into RecipeIngredientLink (RecipeID, IngredientID) Values (
    1, 10
);

Select *
From (
    Select R.RecipeID, R.Name as RecipeName, I.Name as IngredientName, I.IngredientID
    From Recipe as R 
    Left Join RecipeIngredientLink as L on R.RecipeID = L.RecipeID
    Left Join Ingredient as I on L.IngredientID = I.IngredientID
) 
as RecipeList
Where RecipeID = 1;


Select IngredientID, Name as "Substitution for Almond Milk"
From Ingredient
Join (
    Select FirstSub as Sub
    From IngredientSubstitution
    Where SecondSub = 11
    Union
    Select SecondSub as Sub
    From IngredientSubstitution
    Where FirstSub = 11
)
as Substitution on Ingredient.IngredientID = Substitution.Sub;
