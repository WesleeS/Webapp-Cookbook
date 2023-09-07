# Webapp-Cookbook
## Goal  
Implement a small selection of cookbook recipes, along with a substitution calculator. Might have a search aswell, along the lines of "show me recipes including X, Y, and Z".  
E.g.,  
"What can I replace Egg with?",
"How do I make Sugar Cookies?",
"Show me every recipe that uses Mayonnaise",
"Show me recipes from Betty Crocker's 2010 Print"

## Tables/Types

### Vague Diagram/Schema
|Substitutions| -> |Ingredients| -> |Recipe| <- |Cookbook|
Recipes will refer to both cookbooks and ingredients, and the ingredients will also refer to substitutions.

### Recipes:  
Recipe Name | Ingredient List | Cooking Directions | Cookbook
--- | --- | --- | --- 
Cookies | Egg (Refers to Ingredients) | Bake for X time | Crocker (Refers to Cookbooks)

The ingredient list in the recipe doesn't concern itself with specific quantities -- that's for the cooking directions. The ingredient list just goes over 'what' you're putting in, not how much.
The cooking directions will be a full description of how you cook it, and will display when you examine a recipe on the site.   
I considered implementing a quick replacement field in the ingredient list (e.g., replace "2 egg" with "130g of blood") but there's so many instances that I might miss, even if I just have flags in the cooking directions for it.
I'd much rather just stick with a substitute calculator/index.

### Ingredients:
Ingredient Name | Substitute IDs
--- | --- 
Egg | 5 (Refers to Substitutions)

Really only used for two things -- the search function ("show me all recipes containing egg") and listing substitutions.  
When I'm setting up the search function, I'll probably have a way to iterate through ingredients in this DB to keep it dynamic and in sync.

### Substitutions:
Substitution ID | Substitute | Ratio
--- | --- | --- 
5 | Blood | 65g per 1 egg
6 | Yogurt | 1 cup per 1 cup of sour cream
7 | Yogurt | 1 cup per 1 cup of mayonnaise

As far as my experience goes, one thing will either be a specific substitute for just one ingredient, or rarely two. Thus, I want to refer to it by ID. 
E.g., here's the yogurt substitution for mayo, and here's the yogurt substitution for sour cream.  
It'll display as a list of ingredients to substitute, select one, and it'll show the names of the substitution in bold and then the ratio next to it.  
Mayo - **Yogurt** (1cup:1cup), **Sour Cream** (1cup:1cup)  
Egg - **Blood** (65g:1egg)  
An optional route to go could be also showing "What can I replace with Yogurt?" and it'll return a list matching "Yogurt" in the Substitute column. Not vital, but maybe neat?

### Cookbook:
Cookbook | Printing Date
--- | --- 
Betty Crocker | 2010

A somewhat 'last minute' addition to reach 4 data types, but makes sense if you wanted to just use recipes from one book -- or to find what book something is from.  
Somewhat helpful if you want to cook, say, baked goods specifically, and then you don't have to sift through recipes from "101 Ways to Make Broth"


