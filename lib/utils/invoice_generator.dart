import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../models/product.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// ✅ Web-Specific Imports
import 'dart:html' as html; // Only for Web

// ✅ Mobile/Desktop Imports
import 'dart:io' show File;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

Future<void> generateInvoice(
    String name, String address, List<Product> items) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        children: [
          pw.Text('Invoice', style: pw.TextStyle(fontSize: 30)),
          pw.Text('Customer: $name\nAddress: $address'),
          pw.Divider(),
          ...items.map((e) => pw.Text('${e.name} - ₹${e.price}')),
          pw.Divider(),
          pw.Text(
              'Total: ₹${items.fold(0.0, (sum, item) => sum + item.price).toStringAsFixed(2)}'),
        ],
      ),
    ),
  );

  final Uint8List pdfBytes = await pdf.save();

  if (kIsWeb) {
    // ✅ Web: Download PDF
    final blob = html.Blob([pdfBytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', 'invoice.pdf')
      ..click();
    html.Url.revokeObjectUrl(url);
    print("✅ Invoice downloaded in browser (Web).");
  } else {
    // ✅ Mobile/Desktop: Save & Open
    final directory = await getExternalStorageDirectory();
    final path = '${directory!.path}/invoice.pdf';
    final file = File(path);

    await file.writeAsBytes(pdfBytes);
    print("✅ Invoice saved at: $path");

    OpenFile.open(path); // ✅ Opens PDF
  }
}
