# Tables
### Recipe Table

(PK) RecipeID  
Name  
Page  
(FK) CookbookID   

RecipeID: Generated surrogate key for the entity.  
Name: The name of the recipe.  
Page: The webpage contents.  It'll be a string pointing to an xml or html file in the container. E.g., Page: "/ChocolateChip01". Formatted as Name+ID

### Cookbook Table

(PK) CookbookID  
Name  
Edition  
Genre  

CookbookID: Generated surrogate key for the entity.  
Name: The name of the cookbook.  
Edition: The printed edition of the cookbook, including versions.  
Genre: The 'type' of food contained by the cookbook, or atleast the majority of recipes.  

### Recipe Ingredient Link Table
(FK) RecipeID  
(FK) IngredientID  

Notes on the Link Table:  
This table lists the Main Ingredients of a recipe, not including substitutions. If an ingredient is optional, it is **not included** in the link table. 

### IngredientSuper Table
(PK) IngredientID  
Name
(FK) VeganDetails

IngredientID: Generated surrogate key for the entity.  
Name: The name of the ingredient

Notes on Ingredient's subtypes:  
Due to MYSQL natively lacking a subtype structure, I had to be a bit obtuse in design. Lets go over the restrictions:
1) It needs to have a single set of ID's, primarily so the Ingredient Substitution Link table can properly work. An FK can only point to one table, so we can't have it point to both a vegan and non vegan table.  
2) They need to have similar structure. Whether it's effectively just copy and pasted, or uses some form of reference, they need to all have atleast a name and an ID  
3) It needs to be among atleast 2 tables.  

My decision was a single ingredient supertable, and then a vegan reference. The super table has the ID, the Name, and a nullable VeganDetails FK  
The VeganDetails include bool values for if it's an imitation substitute (e.g., imitation crab), if it's gluten free, and what kind of food it is (e.g., fruit, veggie, etc)  
Regarding FoodType, the acceptible values are:
fruit  
vegetable  
legume  
grain  
nuts  
herb  
spice  
other  

### Ingredient Substitution Self-Referential Link Table
(FK) IngredientID  
(FK) IngredientID  

Notes on combinations:  
Substitutions are two-way, meaning Butter - Margarine is the same as Margarine - Butter. These values could be rearranged to include both versions in the act of denormalization to improve speed (e.g., only search 1 column for the ingredient ID).



