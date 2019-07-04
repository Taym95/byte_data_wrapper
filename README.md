# byte_data_wrapper

A package to convert you byte data to int(Uint8, Uint16, Uint32, Uint64..)

## Usage
* Add `byte_data_wrapper` to your `pubspec.yaml`file.
* Example:

```
import 'dart:typed_data';
import 'byte_data_wrapper/byte_data_wrapper.dart';

// Get the buffer.
final buffer = Uint16List.fromList(result).buffer;

// Create the byteDataCreator from buffer.
final byteDataCreator = ByteDataCreator.view(buffer);

// Get your data 

int firstData = byteDataCreator.getUint8();
int secondData = byteDataCreator.getUint16();
```