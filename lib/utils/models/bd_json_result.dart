import 'dart:convert';

import 'package:flutter/foundation.dart';

class BdJsonResult {
  int key;
  dynamic ref;
  Map<String, dynamic> value;
  BdJsonResult({
    this.key,
    this.ref,
    this.value,
  });

  BdJsonResult copyWith({
    int key,
    dynamic ref,
    Map<String, dynamic> value,
  }) {
    return BdJsonResult(
      key: key ?? this.key,
      ref: ref ?? this.ref,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'ref': ref,
      'value': value,
    };
  }

  factory BdJsonResult.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return BdJsonResult(
      key: map['key'],
      ref: map['ref'],
      value: Map<String, dynamic>.from(map['value']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BdJsonResult.fromJson(String source) => BdJsonResult.fromMap(json.decode(source));

  @override
  String toString() => 'BdJsonResult(key: $key, ref: $ref, value: $value)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is BdJsonResult &&
      o.key == key &&
      o.ref == ref &&
      mapEquals(o.value, value);
  }

  @override
  int get hashCode => key.hashCode ^ ref.hashCode ^ value.hashCode;
}
