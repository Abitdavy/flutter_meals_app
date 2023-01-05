import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFIlter;

  FilterScreen(this.currentFIlter, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFIlter['gluten']!;
    _vegetarian = widget.currentFIlter['vegetarian']!;
    _vegan = widget.currentFIlter['vegan']!;
    _lactoseFree = widget.currentFIlter['lactose']!;
    super.initState();
  }

  Widget _buildSwitchTile(
    String title,
    String desc,
    bool CurrValue,
    Function(bool) updateValue,
  ) {
    return SwitchListTile(
      value: CurrValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(
        desc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        // actions: [
        //   IconButton(onPressed: () {
        //     final selectedFilters = {
        //       'gluten' : _glutenFree,
        //       'lactose' : _lactoseFree,
        //       'vegan' : _vegan,
        //       'vegetarian' : _vegetarian,
        //     };
        //     widget.saveFilters(selectedFilters);
        //   }, icon: Icon(Icons.save))
        // ],
      ),
      drawer: DrawerItem(),
      body: Center(
        child: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.all(20),
            //   child: Text(
            //     'Meals Filter',
            //     style: Theme.of(context).textTheme.headline6,
            //   ),
            // ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchTile(
                    'Gluten Free',
                    'Only include gluten free meals',
                    _glutenFree,
                    (p0) {
                      setState(() {
                        _glutenFree = p0;
                        final selectedFilters = {
                          'gluten': _glutenFree,
                          'lactose': _lactoseFree,
                          'vegan': _vegan,
                          'vegetarian': _vegetarian,
                        };
                        widget.saveFilters(selectedFilters);
                      });
                    },
                  ),
                  _buildSwitchTile(
                    'Lactose Free',
                    'Only include lactose free meals',
                    _lactoseFree,
                    (p0) {
                      setState(() {
                        _lactoseFree = p0;
                        final selectedFilters = {
                          'gluten': _glutenFree,
                          'lactose': _lactoseFree,
                          'vegan': _vegan,
                          'vegetarian': _vegetarian,
                        };
                        widget.saveFilters(selectedFilters);
                      });
                    },
                  ),
                  _buildSwitchTile(
                    'Vegetarian',
                    'Only include vegetarian meals',
                    _vegetarian,
                    (p0) {
                      setState(() {
                        _vegetarian = p0;
                        final selectedFilters = {
                          'gluten': _glutenFree,
                          'lactose': _lactoseFree,
                          'vegan': _vegan,
                          'vegetarian': _vegetarian,
                        };
                        widget.saveFilters(selectedFilters);
                      });
                    },
                  ),
                  _buildSwitchTile(
                    'Vegan',
                    'Only include vegan meals',
                    _vegan,
                    (p0) {
                      setState(
                        () {
                          _vegan = p0;
                          final selectedFilters = {
                            'gluten': _glutenFree,
                            'lactose': _lactoseFree,
                            'vegan': _vegan,
                            'vegetarian': _vegetarian,
                          };
                          widget.saveFilters(selectedFilters);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
