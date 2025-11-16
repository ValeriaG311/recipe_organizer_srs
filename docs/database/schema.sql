-- НОРМАЛИЗОВАННАЯ СХЕМА ДО 3NF ДЛЯ SQLite - RECIPE ORGANIZER

-- Пользователи системы
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    created_at TEXT DEFAULT (datetime('now'))
);

-- Рецепты
CREATE TABLE Recipes (
    recipe_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    cooking_time INTEGER,
    difficulty TEXT DEFAULT 'medium'
        CHECK(difficulty IN ('easy', 'medium', 'hard')),
    created_at TEXT DEFAULT (datetime('now')),
    updated_at TEXT DEFAULT (datetime('now')),
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Категории рецептов
CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    description TEXT,
    created_at TEXT DEFAULT (datetime('now'))
);

-- Ингредиенты
CREATE TABLE Ingredients (
    ingredient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    unit TEXT,
    created_at TEXT DEFAULT (datetime('now'))
);

-- Связь многие-ко-многим между рецептами и категориями
CREATE TABLE Recipe_Categories (
    recipe_id INTEGER,
    category_id INTEGER,
    assigned_at TEXT DEFAULT (datetime('now')),
    PRIMARY KEY (recipe_id, category_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE CASCADE
);

-- Связь многие-ко-многим между рецептами и ингредиентами
CREATE TABLE Recipe_Ingredients (
    recipe_id INTEGER,
    ingredient_id INTEGER,
    quantity DECIMAL(10,2),
    assigned_at TEXT DEFAULT (datetime('now')),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id) ON DELETE CASCADE
);

-- Индексы для оптимизации запросов
CREATE INDEX idx_recipes_user_id ON Recipes(user_id);
CREATE INDEX idx_recipes_difficulty ON Recipes(difficulty);
CREATE INDEX idx_recipes_cooking_time ON Recipes(cooking_time);
CREATE INDEX idx_recipe_categories_recipe_id ON Recipe_Categories(recipe_id);
CREATE INDEX idx_recipe_categories_category_id ON Recipe_Categories(category_id);
CREATE INDEX idx_recipe_ingredients_recipe_id ON Recipe_Ingredients(recipe_id);
CREATE INDEX idx_recipe_ingredients_ingredient_id ON Recipe_Ingredients(ingredient_id);
