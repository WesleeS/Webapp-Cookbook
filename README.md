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

### Ingredient Table
(PK) IngredientID  
Name  

IngredientID: Generated surrogate key for the entity.  
Name: The name of the ingredient

Notes on Ingredient's subtypes:  


### Ingredient Substitution Self-Referential Link Table
(FK) IngredientID  
(FK) IngredientID  

Notes on combinations:  
Substitutions are two-way, meaning Butter - Margarine is the same as Margarine - Butter. These values could be rearranged to include both versions in the act of denormalization to improve speed (e.g., only search 1 column for the ingredient ID).



