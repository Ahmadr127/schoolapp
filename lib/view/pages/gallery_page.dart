import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/gallery_models.dart';
import '../../services/api_service.dart';

class GaleryScreen extends StatefulWidget {
  @override
  _GaleryScreenState createState() => _GaleryScreenState();
}

class _GaleryScreenState extends State<GaleryScreen> {
  List<GalleryModel> _galleries = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGalleries();
  }

  Future<void> _loadGalleries() async {
    try {
      final galleries = await ApiService.getAllGalleries();
      print('Galleries loaded: ${galleries.length}');
      setState(() {
        _galleries = galleries;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading galleries: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshGalleries() async {
    setState(() {
      _isLoading = true;
    });
    await _loadGalleries();
  }

  @override
  Widget build(BuildContext context) {
    print('Is loading: $_isLoading');
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshGalleries,
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _galleries.isEmpty
                ? Center(child: Text('Tidak ada galeri yang tersedia'))
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: _galleries.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _showFullScreenImage(context, _galleries[index]);
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  child: CachedNetworkImage(
                                    imageUrl: _galleries[index].images,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Center(child: Icon(Icons.error)),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).brightness == Brightness.dark
                                        ? Colors.grey[900]  // Warna gelap untuk mode gelap
                                        : Colors.white,     // Warna putih untuk mode terang
                                  borderRadius: BorderRadius.vertical(
                                      bottom: Radius.circular(12)),
                                ),
                                child: Text(
                                  _galleries[index].judulGalery,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white      // Warna teks putih untuk mode gelap
                                        : Colors.black,     // Warna teks hitam untuk mode terang
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, GalleryModel gallery) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              gallery.judulGalery,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.white,
              ),
            ),
            backgroundColor: Colors.black,
          ),
          body: Container(
            color: Colors.black,
            child: Center(
              child: InteractiveViewer(
                panEnabled: true,
                boundaryMargin: const EdgeInsets.all(20),
                minScale: 0.5,
                maxScale: 4,
                child: Image.network(
                  gallery.images,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
