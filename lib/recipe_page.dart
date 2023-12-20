// recipe_page.dart
import 'package:flutter/material.dart';
import 'login_page.dart'; // Import your login page

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildRecipeSection('Breakfast', [
              _buildRecipeCard('Singara Samosa', ' Deep-fried pastry pockets filled with spiced potatoes'),
              _buildRecipeCard('Paratha with Alur Torkari', 'Paratha, a layered flatbread, is commonly served with Alur Torkari, a spiced potato curry'),
            ]),
            _buildRecipeSection('Lunch', [
              _buildRecipeCard('Biriyani', 'Fragrant rice dish cooked with aromatic spices, meat (usually chicken or mutton), and sometimes eggs'),
              _buildRecipeCard('Shorshe Ilish', 'Hilsa fish marinated in a mustard-based sauce and then cooked'),
            ]),
            _buildRecipeSection('Snacks', [
              _buildRecipeCard('Chotpoti', 'Savory street food with peas, boiled eggs, potatoes, and spices, served with tangy tamarind sauce'),
              _buildRecipeCard('Fruit Salad', 'Colorful fruit salad for a quick snack'),
            ]),
            _buildRecipeSection('Dinner', [
              _buildRecipeCard('Fish Curry with Rice', 'Delicately spiced fish curry served with steamed rice'),
              _buildRecipeCard('Grilled Salmon', 'Delicious grilled salmon with herbs'),
            ]),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        child: const Icon(Icons.login),
      ),
    );
  }

  Widget _buildRecipeSection(String category, List<Widget> recipes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            category,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 39, 218, 96), // Change the color as desired
            ),
          ),
        ),
        Column(children: recipes),
      ],
    );
  }

  Widget _buildRecipeCard(String title, String description) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue, // Change the color as desired
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            description,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black54, 
            ),
          ),
        ),
      ),
    );
  }
}
