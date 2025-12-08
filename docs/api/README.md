# RecipeOrganizer API Documentation
## Mock Server URL
`https://05dc6a17-93dd-4163-9c22-4e44d8ab8188.mock.pstmn.io`
## Endpoints
### Authentication
- `POST /auth/login` - авторизация пользователя
### Recipe Management
- GET /recipes - получить все рецепты
- POST /recipes - создать новый рецепт
- PATCH /recipes/{id} - обновить рецепт
- DELETE /recipes/{id} - удалить рецепт
### Categories
- GET /categories - получить все категории
- POST /categories - создать новую категорию
### Shopping List
- GET /shopping-list - получить список покупок
- POST /shopping-list/from-recipe - добавить ингредиенты из рецепта
## Examples
### User Login
- Name: Success - User Login
URL: {{base_url}}/auth/login?username=chef
- Name: Error - Missing username
URL: {{base_url}}/auth/login?username
- Name: Error - User Login
URL: {{base_url}}/auth/login?username=chef1
### Get All Recipes
- Name: Success - With recipes
URL: {{base_url}}/recipes?status=active
- Name: Success - Empty list
URL: {{base_url}}/recipes?status=deactive
- Name: Succes - Empty
URL: {{base_url}}/recipes?status=archived
### Create New Recipe
- Name: Success - Create New Recipe
URL: {{base_url}}/recipes
- Name: Error - Validation failed
URL: {{base_url}}/recipes?title
- Name: Error - Error title
URL: {{base_url}}/recipes?title="Классический тирамису"
### Update Recipe
- Name: Success - Recipe updated
URL: {{base_url}}/recipes/recipe_001
- Name: Error - Recipe not found
URL: {{base_url}}/recipes/recipe_999
### Delete Recipe
- Name: Success - Recipe deleted
URL: {{base_url}}/recipes/recipe_001
- Name: Error - Recipe not found
URL: {{base_url}}/recipes/recipe_444
### Get All Categories
- Name: Success - With categories
URL: {{base_url}}/categories?include_stats=true
- Name: Success - Empty categories
URL: {{base_url}}/categories?status=inactive
- Name: Error - Get breakfast2
URL: {{base_url}}/categories/breakfast2
### Create Category
- Name: Success - Create Category
URL: {{base_url}}/categories
- <img width="333" height="242" alt="image" src="https://github.com/user-attachments/assets/5c8fb1ac-14bb-4177-a458-930da7e1ba28" />

### Пример ответов
- <img width="1778" height="887" alt="image" src="https://github.com/user-attachments/assets/e76756ff-e77c-4c96-a57a-ffa35b5359b0" />
- <img width="1773" height="841" alt="image" src="https://github.com/user-attachments/assets/a48b8e0a-53f5-4d87-ad8e-42154f4c83e4" />
- и т.д.
