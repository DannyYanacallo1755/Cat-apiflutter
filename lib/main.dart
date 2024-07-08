import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/pokemon_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter HTTP Cat Demo',
        home: PokemonListScreen(),
      ),
    );
  }
}

class PokemonListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Cat List'),
      ),
      body: Consumer<PokemonProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: provider.httpCatList.length,
            itemBuilder: (context, index) {
              final cat = provider.httpCatList[index];
              return ListTile(
                title: Text('HTTP ${cat['statusCode'] ?? 'Unknown'}'),
                leading: Image.network(cat['url'] ?? ''),
                onTap: () {
                  // Puedes agregar una navegación a un detalle de HTTP Cat aquí
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<PokemonProvider>(context, listen: false).fetchHttpCats();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
