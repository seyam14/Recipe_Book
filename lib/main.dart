import 'package:flutter/material.dart';


void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // Show login page initially
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 8),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to RecipeBookApp after successful login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RecipeBookApp()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}


class RecipeBookApp extends StatefulWidget {
  @override
  _RecipeBookAppState createState() => _RecipeBookAppState();
}

class _RecipeBookAppState extends State<RecipeBookApp> {
  List<Recipe> recipes = [
    Recipe(name: 'Spaghetti Bolognese', ingredients: ['Pasta', 'Tomato Sauce', 'Ground Beef']),
    Recipe(name: 'Chicken Curry', ingredients: ['Chicken', 'Curry Sauce', 'Rice']),
    Recipe(name: 'Chocolate Cake', ingredients: ['Flour', 'Sugar', 'Cocoa Powder']),
  ];

  void addRecipe(Recipe newRecipe) {
    setState(() {
      recipes.add(newRecipe);
    });
  }

  void updateRecipe(int index, Recipe updatedRecipe) {
    setState(() {
      recipes[index] = updatedRecipe;
    });
  }

  void deleteRecipe(int index) {
    setState(() {
      recipes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Book App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recipes[index].name),
                  subtitle: Text('Ingredients: ${recipes[index].ingredients.join(', ')}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Open a dialog to edit the recipe
                          _editRecipeDialog(index);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Delete the recipe
                          deleteRecipe(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open a dialog to add a new recipe
          _addRecipeDialog();
        },
        tooltip: 'Add Recipe',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addRecipeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Recipe newRecipe = Recipe(name: '', ingredients: []);
        return AlertDialog(
          title: const Text('Add Recipe'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newRecipe.name = value;
                },
                decoration: const InputDecoration(labelText: 'Recipe Name'),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  newRecipe.ingredients = value.split(',').map((e) => e.trim()).toList();
                },
                decoration: const InputDecoration(labelText: 'Ingredients (comma-separated)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                addRecipe(newRecipe);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editRecipeDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Recipe updatedRecipe = Recipe(name: recipes[index].name, ingredients: recipes[index].ingredients);
        return AlertDialog(
          title: const Text('Edit Recipe'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  updatedRecipe.name = value;
                },
                decoration: const InputDecoration(labelText: 'Recipe Name'),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  updatedRecipe.ingredients = value.split(',').map((e) => e.trim()).toList();
                },
                decoration: const InputDecoration(labelText: 'Ingredients (comma-separated)'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                updateRecipe(index, updatedRecipe);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class Recipe {
  String name;
  List<String> ingredients;

  Recipe({required this.name, required this.ingredients});
}
