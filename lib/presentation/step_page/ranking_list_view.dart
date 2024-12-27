import 'package:flutter/material.dart';

final class RankingList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<_UserRank> users = [
      _UserRank(name: 'Alice', steps: 12000),
      _UserRank(name: 'Bob', steps: 11000),
      _UserRank(name: 'Charlie', steps: 10500),
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: users.length,
      separatorBuilder: (context, index) => const Divider(color: Colors.white54, thickness: 1),
      itemBuilder: (context, index) {
        final user = users[index];
        final rank = index == 0
            ? "1st"
            : index == 1
            ? "2nd"
            : index == 2
            ? "3rd"
            : "";
        return ListTile(
          leading: rank.isNotEmpty
              ? Text(
            rank,
            style: const TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
          )
              : null,
          title: Text(
            user.name,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          trailing: Text(
            '${user.steps} steps',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        );
      },
    );
  }
}

final class _UserRank {
  final String name;
  final int steps;

  _UserRank({required this.name, required this.steps});
}

