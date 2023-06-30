import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_viewer/src/features/github/core/domain/github_repo.dart';

class RepoTile extends StatelessWidget {
  const RepoTile({super.key, required this.repo});

  final GithubRepo repo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(repo.fullName),
      subtitle: Text(
        repo.description,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: CachedNetworkImageProvider(repo.owner.avatarUrlSmall),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.star_border),
          Text(
            repo.stargazersCount.toString(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
      onTap: () {
        /// TODO: Implement navigation to repo details page
      },
    );
  }
}
