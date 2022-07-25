



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/search_cubit/search_cubit.dart';
import '../widgets/components/screen_component/search_display.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _query = TextEditingController();

  @override
  void initState() {
    context.read<SearchCubit>().getSearch(
          query: 'one piece',
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              enableSuggestions: true,
              controller: _query,
              onChanged: (value) {
                context.read<SearchCubit>().getSearch(query: value);
              },
              style: const TextStyle(color: Colors.white, fontSize: 15),
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: InkWell(
                  onTap: () {
                    context.read<SearchCubit>().getSearch(query: _query.text);
                  },
                  child: const Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                hintStyle: const TextStyle(color: Colors.white),
                labelStyle: const TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: Colors.white60),
                    borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 2, color: Colors.white60),
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          const Expanded(
              child: SearchDisplayWidget(
            movie: [],
          ))
        ],
      ),
    );
  }
}
