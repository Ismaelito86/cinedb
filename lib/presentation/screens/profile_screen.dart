import 'package:cinedb/presentation/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatelessWidget {
  static const name = 'profile-screen';
  final int? pageIndex;

  const ProfileScreen({super.key, this.pageIndex});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 290,
                  child: _ProfileInfo(profileProvider: profileProvider),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Text(
                    profileProvider.profile.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Text(
                    profileProvider.profile.email,
                  ),
                ),
                const _ProfileInfoExample(),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Favoritos',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Show All',
                        ),
                      ),
                    ],
                  ),
                ),
                const _ProfileBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://source.unsplash.com/random/1280x720?profile&55',
                            width: 190,
                            height: 208,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 4),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://source.unsplash.com/random/1280x720?profile&52',
                                  width: 160,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 4, 0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://source.unsplash.com/random/1280x720?profile&51',
                                  width: 160,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class _ProfileInfoExample extends StatelessWidget {
  const _ProfileInfoExample();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 40, 89, 152),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12, 16, 12, 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Text(
                        '60',
                      ),
                    ),
                    Text(
                      'Series',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Text(
                        '20',
                      ),
                    ),
                    Text(
                      'Movies Fav',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Text(
                        '15',
                      ),
                    ),
                    Text(
                      'Cines',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  const _ProfileInfo({
    required this.profileProvider,
  });

  final ProfileProvider profileProvider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl:
                  'https://source.unsplash.com/random/1280x720?profile&52',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0, 1),
          child: Material(
            color: Colors.transparent,
            elevation: 0,
            shape: const CircleBorder(),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: InkWell(
                  onTap: () async {
                    profileProvider.profile.avatar =
                        await profileProvider.updloadImageToFireStore();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: profileProvider.profile.avatar,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
