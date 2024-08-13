import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  final String selectedFilter;
  final void Function(String category) onFilterChanged;

  const Filters({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final List<String> filters = const [
    "Cricket",
    "Soccer",
    "Badminton",
    "Tennis",
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = widget.selectedFilter;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filters.length,
      itemBuilder: (BuildContext context, int index) {
        final filter = filters[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = filter;
              });
              widget.onFilterChanged(filter);
            },
            child: Chip(
              label: Text(
                filter,
                style: const TextStyle(fontSize: 18),
              ),
              backgroundColor: selectedFilter == filter
                  ? theme.colorScheme.primary
                  : theme.colorScheme.surface,
              shape: const StadiumBorder(
                 side: BorderSide(color: Colors.transparent, width: 0),
              ),
              padding: const EdgeInsets.all(10),
            ),
          ),
        );
      },
    );
  }
}
