import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/agenda_models.dart';
import '../../services/api_service.dart';

class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  late Future<List<AgendaModel>> _agendaItems;

  @override
  void initState() {
    super.initState();
    _agendaItems = ApiService.getAgendaItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<AgendaModel>>(
        future: _agendaItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada data agenda'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(_getIconForAgenda(index), color: Colors.white),
                      backgroundColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white12
                          : Colors.blue,
                    ),
                    title: Text(
                      item.judulAgenda, // Ubah dari item.judul menjadi item.judulAgenda
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text(item.isiAgenda), // Ubah dari item.isi menjadi item.isiAgenda
                        SizedBox(height: 4),
                        Text(
                          'Tanggal: ${DateFormat('dd MMMM yyyy').format(DateTime.parse(item.tglAgenda))}', // Ubah dari item.tanggal menjadi item.tglAgenda
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  IconData _getIconForAgenda(int index) {
    List<IconData> icons = [
      Icons.event,
      Icons.people,
      Icons.volunteer_activism,
      Icons.school,
      Icons.cast_for_education,
      Icons.nature_people,
    ];
    return icons[index % icons.length];
  }
}

