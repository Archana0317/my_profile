import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

void main() => runApp(MaterialApp(home: SupplierPage()));

class SupplierPage extends StatefulWidget {
  @override
  _SupplierPageState createState() => _SupplierPageState();
}

class _SupplierPageState extends State<SupplierPage> {
  final List<Map<String, String>> _suppliers = [];
  int _supplierIdCounter = 1;
  final List<String> _cities = [];
  final List<String> _mobileNumbers = [];

  void _showAddSupplierDialog() {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _codeController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _cityController = TextEditingController();
    final TextEditingController _zipcodeController = TextEditingController();
    final TextEditingController _contactController = TextEditingController();
    final TextEditingController _mobileController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _vatController = TextEditingController();
    final TextEditingController _notesController = TextEditingController();
    String _status = 'Active';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Add Supplier', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Supplier ID',
                              border: OutlineInputBorder(),
                            ),
                            initialValue: 'SUP${_supplierIdCounter.toString().padLeft(4, '0')}',
                            enabled: false,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _codeController,
                            decoration: InputDecoration(
                              labelText: 'Supplier Code',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Supplier Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _addressController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Supplier Address',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TypeAheadFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: _cityController,
                              decoration: InputDecoration(
                                labelText: 'City',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            suggestionsCallback: (pattern) {
                              return _cities.where((city) => city.toLowerCase().startsWith(pattern.toLowerCase()));
                            },
                            itemBuilder: (context, suggestion) => ListTile(title: Text(suggestion)),
                            onSuggestionSelected: (suggestion) => _cityController.text = suggestion,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _zipcodeController,
                            decoration: InputDecoration(
                              labelText: 'Zipcode',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _contactController,
                            decoration: InputDecoration(
                              labelText: 'Contact Person',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TypeAheadFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: _mobileController,
                              decoration: InputDecoration(
                                labelText: 'Mobile No',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            suggestionsCallback: (pattern) {
                              return _mobileNumbers.where((mob) => mob.startsWith(pattern));
                            },
                            itemBuilder: (context, suggestion) => ListTile(title: Text(suggestion)),
                            onSuggestionSelected: (suggestion) => _mobileController.text = suggestion,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _vatController,
                            decoration: InputDecoration(
                              labelText: 'VAT No',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _status,
                            decoration: InputDecoration(
                              labelText: 'Status',
                              border: OutlineInputBorder(),
                            ),
                            items: ['Active', 'Inactive', 'Blacklisted']
                                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (value) => _status = value!,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _notesController,
                            maxLines: 4,
                            decoration: InputDecoration(
                              labelText: 'Notes',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancel'),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _cities.add(_cityController.text);
                                _mobileNumbers.add(_mobileController.text);
                                _suppliers.add({
                                  'id': 'SUP${_supplierIdCounter.toString().padLeft(4, '0')}',
                                  'code': _codeController.text,
                                  'name': _nameController.text,
                                  'city': _cityController.text,
                                  'contactperson': _contactController.text,
                                  'mobile': _mobileController.text,
                                });
                                _supplierIdCounter++;
                              });
                              Navigator.pop(context);
                            }
                          },
                          child: Text('Add'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supplier Management'),
        backgroundColor: Colors.teal,
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: _showAddSupplierDialog,
                  icon: Icon(Icons.add),
                  label: Text('Add Supplier'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    backgroundColor: Colors.teal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _suppliers.isEmpty
                ? Center(child: Text('No supplier data available.'))
                : Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Supplier ID')),
                    DataColumn(label: Text('Code')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('City')),
                    DataColumn(label: Text('Contact person')),
                    DataColumn(label: Text('Mobile number')),
                  ],
                  rows: _suppliers
                      .map(
                        (supplier) => DataRow(cells: [
                      DataCell(Text(supplier['id'] ?? '')),
                      DataCell(Text(supplier['code'] ?? '')),
                      DataCell(Text(supplier['name'] ?? '')),
                      DataCell(Text(supplier['city'] ?? '')),
                      DataCell(Text(supplier['contactperson'] ?? '')),
                      DataCell(Text(supplier['mobile'] ?? '')),
                    ]),
                  )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
