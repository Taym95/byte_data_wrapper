import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:byte_data_wrapper/src/byte_data.dart';

void main() {
  test('Write to byte buffer and increase writeOffset counter', () {
    final byteDataWrapper = ByteDataWrapper(5);
    byteDataWrapper.setUint8(1);
    byteDataWrapper.setUint16(8);
    expect(byteDataWrapper.length, 5);
    expect(byteDataWrapper.writeOffset, 3);
  });


  test('Read from byte buffer and increase readOffset counter', () {
    final bytes = Uint8List.fromList([14, 0, 2, 197, 105, 0, 0]);
    final byteDataWrapper = ByteDataWrapper.view(bytes.buffer, 0, bytes.length);
    byteDataWrapper.getUint8();
    byteDataWrapper.getUint32();
    expect(byteDataWrapper.length, 7);
    expect(byteDataWrapper.readOffset, 5);
  });
}
