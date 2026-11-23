// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TechniciansTable extends Technicians
    with TableInfo<$TechniciansTable, Technician> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TechniciansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, name, active];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'technicians';
  @override
  VerificationContext validateIntegrity(Insertable<Technician> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Technician map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Technician(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
    );
  }

  @override
  $TechniciansTable createAlias(String alias) {
    return $TechniciansTable(attachedDatabase, alias);
  }
}

class Technician extends DataClass implements Insertable<Technician> {
  final int id;
  final String name;
  final bool active;
  const Technician(
      {required this.id, required this.name, required this.active});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['active'] = Variable<bool>(active);
    return map;
  }

  TechniciansCompanion toCompanion(bool nullToAbsent) {
    return TechniciansCompanion(
      id: Value(id),
      name: Value(name),
      active: Value(active),
    );
  }

  factory Technician.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Technician(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'active': serializer.toJson<bool>(active),
    };
  }

  Technician copyWith({int? id, String? name, bool? active}) => Technician(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
      );
  Technician copyWithCompanion(TechniciansCompanion data) {
    return Technician(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Technician(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Technician &&
          other.id == this.id &&
          other.name == this.name &&
          other.active == this.active);
}

class TechniciansCompanion extends UpdateCompanion<Technician> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> active;
  const TechniciansCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.active = const Value.absent(),
  });
  TechniciansCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.active = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Technician> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (active != null) 'active': active,
    });
  }

  TechniciansCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<bool>? active}) {
    return TechniciansCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TechniciansCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $ClientsTable extends Clients with TableInfo<$ClientsTable, Client> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, fullName, phone, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(Insertable<Client> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }
}

class Client extends DataClass implements Insertable<Client> {
  final int id;
  final String fullName;
  final String phone;
  final DateTime createdAt;
  const Client(
      {required this.id,
      required this.fullName,
      required this.phone,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['full_name'] = Variable<String>(fullName);
    map['phone'] = Variable<String>(phone);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: Value(id),
      fullName: Value(fullName),
      phone: Value(phone),
      createdAt: Value(createdAt),
    );
  }

  factory Client.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Client(
      id: serializer.fromJson<int>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      phone: serializer.fromJson<String>(json['phone']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'fullName': serializer.toJson<String>(fullName),
      'phone': serializer.toJson<String>(phone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Client copyWith(
          {int? id, String? fullName, String? phone, DateTime? createdAt}) =>
      Client(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
      );
  Client copyWithCompanion(ClientsCompanion data) {
    return Client(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      phone: data.phone.present ? data.phone.value : this.phone,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Client(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, fullName, phone, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Client &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.phone == this.phone &&
          other.createdAt == this.createdAt);
}

class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<int> id;
  final Value<String> fullName;
  final Value<String> phone;
  final Value<DateTime> createdAt;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phone = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    required String fullName,
    required String phone,
    this.createdAt = const Value.absent(),
  })  : fullName = Value(fullName),
        phone = Value(phone);
  static Insertable<Client> custom({
    Expression<int>? id,
    Expression<String>? fullName,
    Expression<String>? phone,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (phone != null) 'phone': phone,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ClientsCompanion copyWith(
      {Value<int>? id,
      Value<String>? fullName,
      Value<String>? phone,
      Value<DateTime>? createdAt}) {
    return ClientsCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DevicesTable extends Devices with TableInfo<$DevicesTable, Device> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clients (id)'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
      'model', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _serialNumberMeta =
      const VerificationMeta('serialNumber');
  @override
  late final GeneratedColumn<String> serialNumber = GeneratedColumn<String>(
      'serial_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, clientId, type, brand, model, serialNumber, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'devices';
  @override
  VerificationContext validateIntegrity(Insertable<Device> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    } else if (isInserting) {
      context.missing(_brandMeta);
    }
    if (data.containsKey('model')) {
      context.handle(
          _modelMeta, model.isAcceptableOrUnknown(data['model']!, _modelMeta));
    } else if (isInserting) {
      context.missing(_modelMeta);
    }
    if (data.containsKey('serial_number')) {
      context.handle(
          _serialNumberMeta,
          serialNumber.isAcceptableOrUnknown(
              data['serial_number']!, _serialNumberMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Device map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Device(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand'])!,
      model: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}model'])!,
      serialNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}serial_number']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $DevicesTable createAlias(String alias) {
    return $DevicesTable(attachedDatabase, alias);
  }
}

class Device extends DataClass implements Insertable<Device> {
  final int id;
  final int clientId;
  final String type;
  final String brand;
  final String model;
  final String? serialNumber;
  final DateTime createdAt;
  const Device(
      {required this.id,
      required this.clientId,
      required this.type,
      required this.brand,
      required this.model,
      this.serialNumber,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['type'] = Variable<String>(type);
    map['brand'] = Variable<String>(brand);
    map['model'] = Variable<String>(model);
    if (!nullToAbsent || serialNumber != null) {
      map['serial_number'] = Variable<String>(serialNumber);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DevicesCompanion toCompanion(bool nullToAbsent) {
    return DevicesCompanion(
      id: Value(id),
      clientId: Value(clientId),
      type: Value(type),
      brand: Value(brand),
      model: Value(model),
      serialNumber: serialNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(serialNumber),
      createdAt: Value(createdAt),
    );
  }

  factory Device.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Device(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      type: serializer.fromJson<String>(json['type']),
      brand: serializer.fromJson<String>(json['brand']),
      model: serializer.fromJson<String>(json['model']),
      serialNumber: serializer.fromJson<String?>(json['serialNumber']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'type': serializer.toJson<String>(type),
      'brand': serializer.toJson<String>(brand),
      'model': serializer.toJson<String>(model),
      'serialNumber': serializer.toJson<String?>(serialNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Device copyWith(
          {int? id,
          int? clientId,
          String? type,
          String? brand,
          String? model,
          Value<String?> serialNumber = const Value.absent(),
          DateTime? createdAt}) =>
      Device(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        type: type ?? this.type,
        brand: brand ?? this.brand,
        model: model ?? this.model,
        serialNumber:
            serialNumber.present ? serialNumber.value : this.serialNumber,
        createdAt: createdAt ?? this.createdAt,
      );
  Device copyWithCompanion(DevicesCompanion data) {
    return Device(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      type: data.type.present ? data.type.value : this.type,
      brand: data.brand.present ? data.brand.value : this.brand,
      model: data.model.present ? data.model.value : this.model,
      serialNumber: data.serialNumber.present
          ? data.serialNumber.value
          : this.serialNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Device(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('type: $type, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, clientId, type, brand, model, serialNumber, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Device &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.type == this.type &&
          other.brand == this.brand &&
          other.model == this.model &&
          other.serialNumber == this.serialNumber &&
          other.createdAt == this.createdAt);
}

class DevicesCompanion extends UpdateCompanion<Device> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<String> type;
  final Value<String> brand;
  final Value<String> model;
  final Value<String?> serialNumber;
  final Value<DateTime> createdAt;
  const DevicesCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.type = const Value.absent(),
    this.brand = const Value.absent(),
    this.model = const Value.absent(),
    this.serialNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DevicesCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required String type,
    required String brand,
    required String model,
    this.serialNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : clientId = Value(clientId),
        type = Value(type),
        brand = Value(brand),
        model = Value(model);
  static Insertable<Device> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<String>? type,
    Expression<String>? brand,
    Expression<String>? model,
    Expression<String>? serialNumber,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (type != null) 'type': type,
      if (brand != null) 'brand': brand,
      if (model != null) 'model': model,
      if (serialNumber != null) 'serial_number': serialNumber,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DevicesCompanion copyWith(
      {Value<int>? id,
      Value<int>? clientId,
      Value<String>? type,
      Value<String>? brand,
      Value<String>? model,
      Value<String?>? serialNumber,
      Value<DateTime>? createdAt}) {
    return DevicesCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      type: type ?? this.type,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      serialNumber: serialNumber ?? this.serialNumber,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (serialNumber.present) {
      map['serial_number'] = Variable<String>(serialNumber.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevicesCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('type: $type, ')
          ..write('brand: $brand, ')
          ..write('model: $model, ')
          ..write('serialNumber: $serialNumber, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RepairOrdersTable extends RepairOrders
    with TableInfo<$RepairOrdersTable, RepairOrder> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RepairOrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES clients (id)'));
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<int> deviceId = GeneratedColumn<int>(
      'device_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES devices (id)'));
  static const VerificationMeta _technicianIdMeta =
      const VerificationMeta('technicianId');
  @override
  late final GeneratedColumn<int> technicianId = GeneratedColumn<int>(
      'technician_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES technicians (id)'));
  static const VerificationMeta _reportedIssueMeta =
      const VerificationMeta('reportedIssue');
  @override
  late final GeneratedColumn<String> reportedIssue = GeneratedColumn<String>(
      'reported_issue', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Recibida'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _receivedAtMeta =
      const VerificationMeta('receivedAt');
  @override
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
      'received_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _deliveredAtMeta =
      const VerificationMeta('deliveredAt');
  @override
  late final GeneratedColumn<DateTime> deliveredAt = GeneratedColumn<DateTime>(
      'delivered_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        code,
        clientId,
        deviceId,
        technicianId,
        reportedIssue,
        status,
        notes,
        receivedAt,
        updatedAt,
        deliveredAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'repair_orders';
  @override
  VerificationContext validateIntegrity(Insertable<RepairOrder> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('technician_id')) {
      context.handle(
          _technicianIdMeta,
          technicianId.isAcceptableOrUnknown(
              data['technician_id']!, _technicianIdMeta));
    }
    if (data.containsKey('reported_issue')) {
      context.handle(
          _reportedIssueMeta,
          reportedIssue.isAcceptableOrUnknown(
              data['reported_issue']!, _reportedIssueMeta));
    } else if (isInserting) {
      context.missing(_reportedIssueMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('received_at')) {
      context.handle(
          _receivedAtMeta,
          receivedAt.isAcceptableOrUnknown(
              data['received_at']!, _receivedAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('delivered_at')) {
      context.handle(
          _deliveredAtMeta,
          deliveredAt.isAcceptableOrUnknown(
              data['delivered_at']!, _deliveredAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RepairOrder map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RepairOrder(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id'])!,
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}device_id'])!,
      technicianId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}technician_id']),
      reportedIssue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reported_issue'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      receivedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}received_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deliveredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}delivered_at']),
    );
  }

  @override
  $RepairOrdersTable createAlias(String alias) {
    return $RepairOrdersTable(attachedDatabase, alias);
  }
}

class RepairOrder extends DataClass implements Insertable<RepairOrder> {
  final int id;
  final String code;
  final int clientId;
  final int deviceId;
  final int? technicianId;
  final String reportedIssue;
  final String status;
  final String? notes;
  final DateTime receivedAt;
  final DateTime updatedAt;
  final DateTime? deliveredAt;
  const RepairOrder(
      {required this.id,
      required this.code,
      required this.clientId,
      required this.deviceId,
      this.technicianId,
      required this.reportedIssue,
      required this.status,
      this.notes,
      required this.receivedAt,
      required this.updatedAt,
      this.deliveredAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['client_id'] = Variable<int>(clientId);
    map['device_id'] = Variable<int>(deviceId);
    if (!nullToAbsent || technicianId != null) {
      map['technician_id'] = Variable<int>(technicianId);
    }
    map['reported_issue'] = Variable<String>(reportedIssue);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['received_at'] = Variable<DateTime>(receivedAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deliveredAt != null) {
      map['delivered_at'] = Variable<DateTime>(deliveredAt);
    }
    return map;
  }

  RepairOrdersCompanion toCompanion(bool nullToAbsent) {
    return RepairOrdersCompanion(
      id: Value(id),
      code: Value(code),
      clientId: Value(clientId),
      deviceId: Value(deviceId),
      technicianId: technicianId == null && nullToAbsent
          ? const Value.absent()
          : Value(technicianId),
      reportedIssue: Value(reportedIssue),
      status: Value(status),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      receivedAt: Value(receivedAt),
      updatedAt: Value(updatedAt),
      deliveredAt: deliveredAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveredAt),
    );
  }

  factory RepairOrder.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RepairOrder(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      clientId: serializer.fromJson<int>(json['clientId']),
      deviceId: serializer.fromJson<int>(json['deviceId']),
      technicianId: serializer.fromJson<int?>(json['technicianId']),
      reportedIssue: serializer.fromJson<String>(json['reportedIssue']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      receivedAt: serializer.fromJson<DateTime>(json['receivedAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deliveredAt: serializer.fromJson<DateTime?>(json['deliveredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'clientId': serializer.toJson<int>(clientId),
      'deviceId': serializer.toJson<int>(deviceId),
      'technicianId': serializer.toJson<int?>(technicianId),
      'reportedIssue': serializer.toJson<String>(reportedIssue),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'receivedAt': serializer.toJson<DateTime>(receivedAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deliveredAt': serializer.toJson<DateTime?>(deliveredAt),
    };
  }

  RepairOrder copyWith(
          {int? id,
          String? code,
          int? clientId,
          int? deviceId,
          Value<int?> technicianId = const Value.absent(),
          String? reportedIssue,
          String? status,
          Value<String?> notes = const Value.absent(),
          DateTime? receivedAt,
          DateTime? updatedAt,
          Value<DateTime?> deliveredAt = const Value.absent()}) =>
      RepairOrder(
        id: id ?? this.id,
        code: code ?? this.code,
        clientId: clientId ?? this.clientId,
        deviceId: deviceId ?? this.deviceId,
        technicianId:
            technicianId.present ? technicianId.value : this.technicianId,
        reportedIssue: reportedIssue ?? this.reportedIssue,
        status: status ?? this.status,
        notes: notes.present ? notes.value : this.notes,
        receivedAt: receivedAt ?? this.receivedAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deliveredAt: deliveredAt.present ? deliveredAt.value : this.deliveredAt,
      );
  RepairOrder copyWithCompanion(RepairOrdersCompanion data) {
    return RepairOrder(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      technicianId: data.technicianId.present
          ? data.technicianId.value
          : this.technicianId,
      reportedIssue: data.reportedIssue.present
          ? data.reportedIssue.value
          : this.reportedIssue,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      receivedAt:
          data.receivedAt.present ? data.receivedAt.value : this.receivedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deliveredAt:
          data.deliveredAt.present ? data.deliveredAt.value : this.deliveredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RepairOrder(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('clientId: $clientId, ')
          ..write('deviceId: $deviceId, ')
          ..write('technicianId: $technicianId, ')
          ..write('reportedIssue: $reportedIssue, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deliveredAt: $deliveredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, clientId, deviceId, technicianId,
      reportedIssue, status, notes, receivedAt, updatedAt, deliveredAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RepairOrder &&
          other.id == this.id &&
          other.code == this.code &&
          other.clientId == this.clientId &&
          other.deviceId == this.deviceId &&
          other.technicianId == this.technicianId &&
          other.reportedIssue == this.reportedIssue &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.receivedAt == this.receivedAt &&
          other.updatedAt == this.updatedAt &&
          other.deliveredAt == this.deliveredAt);
}

class RepairOrdersCompanion extends UpdateCompanion<RepairOrder> {
  final Value<int> id;
  final Value<String> code;
  final Value<int> clientId;
  final Value<int> deviceId;
  final Value<int?> technicianId;
  final Value<String> reportedIssue;
  final Value<String> status;
  final Value<String?> notes;
  final Value<DateTime> receivedAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deliveredAt;
  const RepairOrdersCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.clientId = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.technicianId = const Value.absent(),
    this.reportedIssue = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deliveredAt = const Value.absent(),
  });
  RepairOrdersCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required int clientId,
    required int deviceId,
    this.technicianId = const Value.absent(),
    required String reportedIssue,
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deliveredAt = const Value.absent(),
  })  : code = Value(code),
        clientId = Value(clientId),
        deviceId = Value(deviceId),
        reportedIssue = Value(reportedIssue);
  static Insertable<RepairOrder> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<int>? clientId,
    Expression<int>? deviceId,
    Expression<int>? technicianId,
    Expression<String>? reportedIssue,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<DateTime>? receivedAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deliveredAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (clientId != null) 'client_id': clientId,
      if (deviceId != null) 'device_id': deviceId,
      if (technicianId != null) 'technician_id': technicianId,
      if (reportedIssue != null) 'reported_issue': reportedIssue,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (receivedAt != null) 'received_at': receivedAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deliveredAt != null) 'delivered_at': deliveredAt,
    });
  }

  RepairOrdersCompanion copyWith(
      {Value<int>? id,
      Value<String>? code,
      Value<int>? clientId,
      Value<int>? deviceId,
      Value<int?>? technicianId,
      Value<String>? reportedIssue,
      Value<String>? status,
      Value<String?>? notes,
      Value<DateTime>? receivedAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deliveredAt}) {
    return RepairOrdersCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      clientId: clientId ?? this.clientId,
      deviceId: deviceId ?? this.deviceId,
      technicianId: technicianId ?? this.technicianId,
      reportedIssue: reportedIssue ?? this.reportedIssue,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      receivedAt: receivedAt ?? this.receivedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deliveredAt: deliveredAt ?? this.deliveredAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<int>(deviceId.value);
    }
    if (technicianId.present) {
      map['technician_id'] = Variable<int>(technicianId.value);
    }
    if (reportedIssue.present) {
      map['reported_issue'] = Variable<String>(reportedIssue.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deliveredAt.present) {
      map['delivered_at'] = Variable<DateTime>(deliveredAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RepairOrdersCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('clientId: $clientId, ')
          ..write('deviceId: $deviceId, ')
          ..write('technicianId: $technicianId, ')
          ..write('reportedIssue: $reportedIssue, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deliveredAt: $deliveredAt')
          ..write(')'))
        .toString();
  }
}

class $RepairJobsTable extends RepairJobs
    with TableInfo<$RepairJobsTable, RepairJob> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RepairJobsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES repair_orders (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _laborCostCentsMeta =
      const VerificationMeta('laborCostCents');
  @override
  late final GeneratedColumn<int> laborCostCents = GeneratedColumn<int>(
      'labor_cost_cents', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, orderId, description, laborCostCents, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'repair_jobs';
  @override
  VerificationContext validateIntegrity(Insertable<RepairJob> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('labor_cost_cents')) {
      context.handle(
          _laborCostCentsMeta,
          laborCostCents.isAcceptableOrUnknown(
              data['labor_cost_cents']!, _laborCostCentsMeta));
    } else if (isInserting) {
      context.missing(_laborCostCentsMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RepairJob map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RepairJob(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      laborCostCents: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}labor_cost_cents'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $RepairJobsTable createAlias(String alias) {
    return $RepairJobsTable(attachedDatabase, alias);
  }
}

class RepairJob extends DataClass implements Insertable<RepairJob> {
  final int id;
  final int orderId;
  final String description;
  final int laborCostCents;
  final DateTime createdAt;
  const RepairJob(
      {required this.id,
      required this.orderId,
      required this.description,
      required this.laborCostCents,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['description'] = Variable<String>(description);
    map['labor_cost_cents'] = Variable<int>(laborCostCents);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RepairJobsCompanion toCompanion(bool nullToAbsent) {
    return RepairJobsCompanion(
      id: Value(id),
      orderId: Value(orderId),
      description: Value(description),
      laborCostCents: Value(laborCostCents),
      createdAt: Value(createdAt),
    );
  }

  factory RepairJob.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RepairJob(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      description: serializer.fromJson<String>(json['description']),
      laborCostCents: serializer.fromJson<int>(json['laborCostCents']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'description': serializer.toJson<String>(description),
      'laborCostCents': serializer.toJson<int>(laborCostCents),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RepairJob copyWith(
          {int? id,
          int? orderId,
          String? description,
          int? laborCostCents,
          DateTime? createdAt}) =>
      RepairJob(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        description: description ?? this.description,
        laborCostCents: laborCostCents ?? this.laborCostCents,
        createdAt: createdAt ?? this.createdAt,
      );
  RepairJob copyWithCompanion(RepairJobsCompanion data) {
    return RepairJob(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      description:
          data.description.present ? data.description.value : this.description,
      laborCostCents: data.laborCostCents.present
          ? data.laborCostCents.value
          : this.laborCostCents,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RepairJob(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('description: $description, ')
          ..write('laborCostCents: $laborCostCents, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, orderId, description, laborCostCents, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RepairJob &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.description == this.description &&
          other.laborCostCents == this.laborCostCents &&
          other.createdAt == this.createdAt);
}

class RepairJobsCompanion extends UpdateCompanion<RepairJob> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<String> description;
  final Value<int> laborCostCents;
  final Value<DateTime> createdAt;
  const RepairJobsCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.description = const Value.absent(),
    this.laborCostCents = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RepairJobsCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required String description,
    required int laborCostCents,
    this.createdAt = const Value.absent(),
  })  : orderId = Value(orderId),
        description = Value(description),
        laborCostCents = Value(laborCostCents);
  static Insertable<RepairJob> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<String>? description,
    Expression<int>? laborCostCents,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (description != null) 'description': description,
      if (laborCostCents != null) 'labor_cost_cents': laborCostCents,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RepairJobsCompanion copyWith(
      {Value<int>? id,
      Value<int>? orderId,
      Value<String>? description,
      Value<int>? laborCostCents,
      Value<DateTime>? createdAt}) {
    return RepairJobsCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      description: description ?? this.description,
      laborCostCents: laborCostCents ?? this.laborCostCents,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (laborCostCents.present) {
      map['labor_cost_cents'] = Variable<int>(laborCostCents.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RepairJobsCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('description: $description, ')
          ..write('laborCostCents: $laborCostCents, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SparePartsTable extends SpareParts
    with TableInfo<$SparePartsTable, SparePart> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SparePartsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _unitPriceCentsMeta =
      const VerificationMeta('unitPriceCents');
  @override
  late final GeneratedColumn<int> unitPriceCents = GeneratedColumn<int>(
      'unit_price_cents', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _minimumStockMeta =
      const VerificationMeta('minimumStock');
  @override
  late final GeneratedColumn<int> minimumStock = GeneratedColumn<int>(
      'minimum_stock', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        code,
        description,
        unitPriceCents,
        quantity,
        minimumStock,
        active
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'spare_parts';
  @override
  VerificationContext validateIntegrity(Insertable<SparePart> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('unit_price_cents')) {
      context.handle(
          _unitPriceCentsMeta,
          unitPriceCents.isAcceptableOrUnknown(
              data['unit_price_cents']!, _unitPriceCentsMeta));
    } else if (isInserting) {
      context.missing(_unitPriceCentsMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    if (data.containsKey('minimum_stock')) {
      context.handle(
          _minimumStockMeta,
          minimumStock.isAcceptableOrUnknown(
              data['minimum_stock']!, _minimumStockMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SparePart map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SparePart(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      unitPriceCents: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_price_cents'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      minimumStock: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}minimum_stock'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
    );
  }

  @override
  $SparePartsTable createAlias(String alias) {
    return $SparePartsTable(attachedDatabase, alias);
  }
}

class SparePart extends DataClass implements Insertable<SparePart> {
  final int id;
  final String name;
  final String code;
  final String? description;
  final int unitPriceCents;
  final int quantity;
  final int minimumStock;
  final bool active;
  const SparePart(
      {required this.id,
      required this.name,
      required this.code,
      this.description,
      required this.unitPriceCents,
      required this.quantity,
      required this.minimumStock,
      required this.active});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['code'] = Variable<String>(code);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['unit_price_cents'] = Variable<int>(unitPriceCents);
    map['quantity'] = Variable<int>(quantity);
    map['minimum_stock'] = Variable<int>(minimumStock);
    map['active'] = Variable<bool>(active);
    return map;
  }

  SparePartsCompanion toCompanion(bool nullToAbsent) {
    return SparePartsCompanion(
      id: Value(id),
      name: Value(name),
      code: Value(code),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      unitPriceCents: Value(unitPriceCents),
      quantity: Value(quantity),
      minimumStock: Value(minimumStock),
      active: Value(active),
    );
  }

  factory SparePart.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SparePart(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
      description: serializer.fromJson<String?>(json['description']),
      unitPriceCents: serializer.fromJson<int>(json['unitPriceCents']),
      quantity: serializer.fromJson<int>(json['quantity']),
      minimumStock: serializer.fromJson<int>(json['minimumStock']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
      'description': serializer.toJson<String?>(description),
      'unitPriceCents': serializer.toJson<int>(unitPriceCents),
      'quantity': serializer.toJson<int>(quantity),
      'minimumStock': serializer.toJson<int>(minimumStock),
      'active': serializer.toJson<bool>(active),
    };
  }

  SparePart copyWith(
          {int? id,
          String? name,
          String? code,
          Value<String?> description = const Value.absent(),
          int? unitPriceCents,
          int? quantity,
          int? minimumStock,
          bool? active}) =>
      SparePart(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        description: description.present ? description.value : this.description,
        unitPriceCents: unitPriceCents ?? this.unitPriceCents,
        quantity: quantity ?? this.quantity,
        minimumStock: minimumStock ?? this.minimumStock,
        active: active ?? this.active,
      );
  SparePart copyWithCompanion(SparePartsCompanion data) {
    return SparePart(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      description:
          data.description.present ? data.description.value : this.description,
      unitPriceCents: data.unitPriceCents.present
          ? data.unitPriceCents.value
          : this.unitPriceCents,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      minimumStock: data.minimumStock.present
          ? data.minimumStock.value
          : this.minimumStock,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SparePart(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('unitPriceCents: $unitPriceCents, ')
          ..write('quantity: $quantity, ')
          ..write('minimumStock: $minimumStock, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, code, description, unitPriceCents,
      quantity, minimumStock, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SparePart &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.description == this.description &&
          other.unitPriceCents == this.unitPriceCents &&
          other.quantity == this.quantity &&
          other.minimumStock == this.minimumStock &&
          other.active == this.active);
}

class SparePartsCompanion extends UpdateCompanion<SparePart> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> code;
  final Value<String?> description;
  final Value<int> unitPriceCents;
  final Value<int> quantity;
  final Value<int> minimumStock;
  final Value<bool> active;
  const SparePartsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.description = const Value.absent(),
    this.unitPriceCents = const Value.absent(),
    this.quantity = const Value.absent(),
    this.minimumStock = const Value.absent(),
    this.active = const Value.absent(),
  });
  SparePartsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String code,
    this.description = const Value.absent(),
    required int unitPriceCents,
    this.quantity = const Value.absent(),
    this.minimumStock = const Value.absent(),
    this.active = const Value.absent(),
  })  : name = Value(name),
        code = Value(code),
        unitPriceCents = Value(unitPriceCents);
  static Insertable<SparePart> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? description,
    Expression<int>? unitPriceCents,
    Expression<int>? quantity,
    Expression<int>? minimumStock,
    Expression<bool>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (description != null) 'description': description,
      if (unitPriceCents != null) 'unit_price_cents': unitPriceCents,
      if (quantity != null) 'quantity': quantity,
      if (minimumStock != null) 'minimum_stock': minimumStock,
      if (active != null) 'active': active,
    });
  }

  SparePartsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? code,
      Value<String?>? description,
      Value<int>? unitPriceCents,
      Value<int>? quantity,
      Value<int>? minimumStock,
      Value<bool>? active}) {
    return SparePartsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      unitPriceCents: unitPriceCents ?? this.unitPriceCents,
      quantity: quantity ?? this.quantity,
      minimumStock: minimumStock ?? this.minimumStock,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (unitPriceCents.present) {
      map['unit_price_cents'] = Variable<int>(unitPriceCents.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (minimumStock.present) {
      map['minimum_stock'] = Variable<int>(minimumStock.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SparePartsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('description: $description, ')
          ..write('unitPriceCents: $unitPriceCents, ')
          ..write('quantity: $quantity, ')
          ..write('minimumStock: $minimumStock, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $OrderSparePartsTable extends OrderSpareParts
    with TableInfo<$OrderSparePartsTable, OrderSparePart> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderSparePartsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES repair_orders (id)'));
  static const VerificationMeta _sparePartIdMeta =
      const VerificationMeta('sparePartId');
  @override
  late final GeneratedColumn<int> sparePartId = GeneratedColumn<int>(
      'spare_part_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES spare_parts (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitPriceCentsMeta =
      const VerificationMeta('unitPriceCents');
  @override
  late final GeneratedColumn<int> unitPriceCents = GeneratedColumn<int>(
      'unit_price_cents', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, orderId, sparePartId, quantity, unitPriceCents];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_spare_parts';
  @override
  VerificationContext validateIntegrity(Insertable<OrderSparePart> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('spare_part_id')) {
      context.handle(
          _sparePartIdMeta,
          sparePartId.isAcceptableOrUnknown(
              data['spare_part_id']!, _sparePartIdMeta));
    } else if (isInserting) {
      context.missing(_sparePartIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price_cents')) {
      context.handle(
          _unitPriceCentsMeta,
          unitPriceCents.isAcceptableOrUnknown(
              data['unit_price_cents']!, _unitPriceCentsMeta));
    } else if (isInserting) {
      context.missing(_unitPriceCentsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderSparePart map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderSparePart(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id'])!,
      sparePartId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}spare_part_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      unitPriceCents: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_price_cents'])!,
    );
  }

  @override
  $OrderSparePartsTable createAlias(String alias) {
    return $OrderSparePartsTable(attachedDatabase, alias);
  }
}

class OrderSparePart extends DataClass implements Insertable<OrderSparePart> {
  final int id;
  final int orderId;
  final int sparePartId;
  final int quantity;
  final int unitPriceCents;
  const OrderSparePart(
      {required this.id,
      required this.orderId,
      required this.sparePartId,
      required this.quantity,
      required this.unitPriceCents});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['order_id'] = Variable<int>(orderId);
    map['spare_part_id'] = Variable<int>(sparePartId);
    map['quantity'] = Variable<int>(quantity);
    map['unit_price_cents'] = Variable<int>(unitPriceCents);
    return map;
  }

  OrderSparePartsCompanion toCompanion(bool nullToAbsent) {
    return OrderSparePartsCompanion(
      id: Value(id),
      orderId: Value(orderId),
      sparePartId: Value(sparePartId),
      quantity: Value(quantity),
      unitPriceCents: Value(unitPriceCents),
    );
  }

  factory OrderSparePart.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderSparePart(
      id: serializer.fromJson<int>(json['id']),
      orderId: serializer.fromJson<int>(json['orderId']),
      sparePartId: serializer.fromJson<int>(json['sparePartId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPriceCents: serializer.fromJson<int>(json['unitPriceCents']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'orderId': serializer.toJson<int>(orderId),
      'sparePartId': serializer.toJson<int>(sparePartId),
      'quantity': serializer.toJson<int>(quantity),
      'unitPriceCents': serializer.toJson<int>(unitPriceCents),
    };
  }

  OrderSparePart copyWith(
          {int? id,
          int? orderId,
          int? sparePartId,
          int? quantity,
          int? unitPriceCents}) =>
      OrderSparePart(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        sparePartId: sparePartId ?? this.sparePartId,
        quantity: quantity ?? this.quantity,
        unitPriceCents: unitPriceCents ?? this.unitPriceCents,
      );
  OrderSparePart copyWithCompanion(OrderSparePartsCompanion data) {
    return OrderSparePart(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      sparePartId:
          data.sparePartId.present ? data.sparePartId.value : this.sparePartId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPriceCents: data.unitPriceCents.present
          ? data.unitPriceCents.value
          : this.unitPriceCents,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderSparePart(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('sparePartId: $sparePartId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPriceCents: $unitPriceCents')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, orderId, sparePartId, quantity, unitPriceCents);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderSparePart &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.sparePartId == this.sparePartId &&
          other.quantity == this.quantity &&
          other.unitPriceCents == this.unitPriceCents);
}

class OrderSparePartsCompanion extends UpdateCompanion<OrderSparePart> {
  final Value<int> id;
  final Value<int> orderId;
  final Value<int> sparePartId;
  final Value<int> quantity;
  final Value<int> unitPriceCents;
  const OrderSparePartsCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.sparePartId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPriceCents = const Value.absent(),
  });
  OrderSparePartsCompanion.insert({
    this.id = const Value.absent(),
    required int orderId,
    required int sparePartId,
    required int quantity,
    required int unitPriceCents,
  })  : orderId = Value(orderId),
        sparePartId = Value(sparePartId),
        quantity = Value(quantity),
        unitPriceCents = Value(unitPriceCents);
  static Insertable<OrderSparePart> custom({
    Expression<int>? id,
    Expression<int>? orderId,
    Expression<int>? sparePartId,
    Expression<int>? quantity,
    Expression<int>? unitPriceCents,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (sparePartId != null) 'spare_part_id': sparePartId,
      if (quantity != null) 'quantity': quantity,
      if (unitPriceCents != null) 'unit_price_cents': unitPriceCents,
    });
  }

  OrderSparePartsCompanion copyWith(
      {Value<int>? id,
      Value<int>? orderId,
      Value<int>? sparePartId,
      Value<int>? quantity,
      Value<int>? unitPriceCents}) {
    return OrderSparePartsCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      sparePartId: sparePartId ?? this.sparePartId,
      quantity: quantity ?? this.quantity,
      unitPriceCents: unitPriceCents ?? this.unitPriceCents,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (sparePartId.present) {
      map['spare_part_id'] = Variable<int>(sparePartId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPriceCents.present) {
      map['unit_price_cents'] = Variable<int>(unitPriceCents.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderSparePartsCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('sparePartId: $sparePartId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPriceCents: $unitPriceCents')
          ..write(')'))
        .toString();
  }
}

class $InventoryMovementsTable extends InventoryMovements
    with TableInfo<$InventoryMovementsTable, InventoryMovement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventoryMovementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _sparePartIdMeta =
      const VerificationMeta('sparePartId');
  @override
  late final GeneratedColumn<int> sparePartId = GeneratedColumn<int>(
      'spare_part_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES spare_parts (id)'));
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<int> orderId = GeneratedColumn<int>(
      'order_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES repair_orders (id)'));
  static const VerificationMeta _quantityDeltaMeta =
      const VerificationMeta('quantityDelta');
  @override
  late final GeneratedColumn<int> quantityDelta = GeneratedColumn<int>(
      'quantity_delta', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, sparePartId, orderId, quantityDelta, reason, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventory_movements';
  @override
  VerificationContext validateIntegrity(Insertable<InventoryMovement> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('spare_part_id')) {
      context.handle(
          _sparePartIdMeta,
          sparePartId.isAcceptableOrUnknown(
              data['spare_part_id']!, _sparePartIdMeta));
    } else if (isInserting) {
      context.missing(_sparePartIdMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    }
    if (data.containsKey('quantity_delta')) {
      context.handle(
          _quantityDeltaMeta,
          quantityDelta.isAcceptableOrUnknown(
              data['quantity_delta']!, _quantityDeltaMeta));
    } else if (isInserting) {
      context.missing(_quantityDeltaMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InventoryMovement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventoryMovement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sparePartId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}spare_part_id'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order_id']),
      quantityDelta: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity_delta'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $InventoryMovementsTable createAlias(String alias) {
    return $InventoryMovementsTable(attachedDatabase, alias);
  }
}

class InventoryMovement extends DataClass
    implements Insertable<InventoryMovement> {
  final int id;
  final int sparePartId;
  final int? orderId;
  final int quantityDelta;
  final String reason;
  final DateTime createdAt;
  const InventoryMovement(
      {required this.id,
      required this.sparePartId,
      this.orderId,
      required this.quantityDelta,
      required this.reason,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['spare_part_id'] = Variable<int>(sparePartId);
    if (!nullToAbsent || orderId != null) {
      map['order_id'] = Variable<int>(orderId);
    }
    map['quantity_delta'] = Variable<int>(quantityDelta);
    map['reason'] = Variable<String>(reason);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  InventoryMovementsCompanion toCompanion(bool nullToAbsent) {
    return InventoryMovementsCompanion(
      id: Value(id),
      sparePartId: Value(sparePartId),
      orderId: orderId == null && nullToAbsent
          ? const Value.absent()
          : Value(orderId),
      quantityDelta: Value(quantityDelta),
      reason: Value(reason),
      createdAt: Value(createdAt),
    );
  }

  factory InventoryMovement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventoryMovement(
      id: serializer.fromJson<int>(json['id']),
      sparePartId: serializer.fromJson<int>(json['sparePartId']),
      orderId: serializer.fromJson<int?>(json['orderId']),
      quantityDelta: serializer.fromJson<int>(json['quantityDelta']),
      reason: serializer.fromJson<String>(json['reason']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sparePartId': serializer.toJson<int>(sparePartId),
      'orderId': serializer.toJson<int?>(orderId),
      'quantityDelta': serializer.toJson<int>(quantityDelta),
      'reason': serializer.toJson<String>(reason),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  InventoryMovement copyWith(
          {int? id,
          int? sparePartId,
          Value<int?> orderId = const Value.absent(),
          int? quantityDelta,
          String? reason,
          DateTime? createdAt}) =>
      InventoryMovement(
        id: id ?? this.id,
        sparePartId: sparePartId ?? this.sparePartId,
        orderId: orderId.present ? orderId.value : this.orderId,
        quantityDelta: quantityDelta ?? this.quantityDelta,
        reason: reason ?? this.reason,
        createdAt: createdAt ?? this.createdAt,
      );
  InventoryMovement copyWithCompanion(InventoryMovementsCompanion data) {
    return InventoryMovement(
      id: data.id.present ? data.id.value : this.id,
      sparePartId:
          data.sparePartId.present ? data.sparePartId.value : this.sparePartId,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      quantityDelta: data.quantityDelta.present
          ? data.quantityDelta.value
          : this.quantityDelta,
      reason: data.reason.present ? data.reason.value : this.reason,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventoryMovement(')
          ..write('id: $id, ')
          ..write('sparePartId: $sparePartId, ')
          ..write('orderId: $orderId, ')
          ..write('quantityDelta: $quantityDelta, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, sparePartId, orderId, quantityDelta, reason, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventoryMovement &&
          other.id == this.id &&
          other.sparePartId == this.sparePartId &&
          other.orderId == this.orderId &&
          other.quantityDelta == this.quantityDelta &&
          other.reason == this.reason &&
          other.createdAt == this.createdAt);
}

class InventoryMovementsCompanion extends UpdateCompanion<InventoryMovement> {
  final Value<int> id;
  final Value<int> sparePartId;
  final Value<int?> orderId;
  final Value<int> quantityDelta;
  final Value<String> reason;
  final Value<DateTime> createdAt;
  const InventoryMovementsCompanion({
    this.id = const Value.absent(),
    this.sparePartId = const Value.absent(),
    this.orderId = const Value.absent(),
    this.quantityDelta = const Value.absent(),
    this.reason = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  InventoryMovementsCompanion.insert({
    this.id = const Value.absent(),
    required int sparePartId,
    this.orderId = const Value.absent(),
    required int quantityDelta,
    required String reason,
    this.createdAt = const Value.absent(),
  })  : sparePartId = Value(sparePartId),
        quantityDelta = Value(quantityDelta),
        reason = Value(reason);
  static Insertable<InventoryMovement> custom({
    Expression<int>? id,
    Expression<int>? sparePartId,
    Expression<int>? orderId,
    Expression<int>? quantityDelta,
    Expression<String>? reason,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sparePartId != null) 'spare_part_id': sparePartId,
      if (orderId != null) 'order_id': orderId,
      if (quantityDelta != null) 'quantity_delta': quantityDelta,
      if (reason != null) 'reason': reason,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  InventoryMovementsCompanion copyWith(
      {Value<int>? id,
      Value<int>? sparePartId,
      Value<int?>? orderId,
      Value<int>? quantityDelta,
      Value<String>? reason,
      Value<DateTime>? createdAt}) {
    return InventoryMovementsCompanion(
      id: id ?? this.id,
      sparePartId: sparePartId ?? this.sparePartId,
      orderId: orderId ?? this.orderId,
      quantityDelta: quantityDelta ?? this.quantityDelta,
      reason: reason ?? this.reason,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sparePartId.present) {
      map['spare_part_id'] = Variable<int>(sparePartId.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<int>(orderId.value);
    }
    if (quantityDelta.present) {
      map['quantity_delta'] = Variable<int>(quantityDelta.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventoryMovementsCompanion(')
          ..write('id: $id, ')
          ..write('sparePartId: $sparePartId, ')
          ..write('orderId: $orderId, ')
          ..write('quantityDelta: $quantityDelta, ')
          ..write('reason: $reason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TechniciansTable technicians = $TechniciansTable(this);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $DevicesTable devices = $DevicesTable(this);
  late final $RepairOrdersTable repairOrders = $RepairOrdersTable(this);
  late final $RepairJobsTable repairJobs = $RepairJobsTable(this);
  late final $SparePartsTable spareParts = $SparePartsTable(this);
  late final $OrderSparePartsTable orderSpareParts =
      $OrderSparePartsTable(this);
  late final $InventoryMovementsTable inventoryMovements =
      $InventoryMovementsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        technicians,
        clients,
        devices,
        repairOrders,
        repairJobs,
        spareParts,
        orderSpareParts,
        inventoryMovements
      ];
}

typedef $$TechniciansTableCreateCompanionBuilder = TechniciansCompanion
    Function({
  Value<int> id,
  required String name,
  Value<bool> active,
});
typedef $$TechniciansTableUpdateCompanionBuilder = TechniciansCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<bool> active,
});

final class $$TechniciansTableReferences
    extends BaseReferences<_$AppDatabase, $TechniciansTable, Technician> {
  $$TechniciansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RepairOrdersTable, List<RepairOrder>>
      _repairOrdersRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.repairOrders,
              aliasName: 'technicians__id__repair_orders__technician_id');

  $$RepairOrdersTableProcessedTableManager get repairOrdersRefs {
    final manager = $$RepairOrdersTableTableManager($_db, $_db.repairOrders)
        .filter((f) => f.technicianId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_repairOrdersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TechniciansTableFilterComposer
    extends Composer<_$AppDatabase, $TechniciansTable> {
  $$TechniciansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  Expression<bool> repairOrdersRefs(
      Expression<bool> Function($$RepairOrdersTableFilterComposer f) f) {
    final $$RepairOrdersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.technicianId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableFilterComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TechniciansTableOrderingComposer
    extends Composer<_$AppDatabase, $TechniciansTable> {
  $$TechniciansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));
}

class $$TechniciansTableAnnotationComposer
    extends Composer<_$AppDatabase, $TechniciansTable> {
  $$TechniciansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  Expression<T> repairOrdersRefs<T extends Object>(
      Expression<T> Function($$RepairOrdersTableAnnotationComposer a) f) {
    final $$RepairOrdersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.technicianId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableAnnotationComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TechniciansTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TechniciansTable,
    Technician,
    $$TechniciansTableFilterComposer,
    $$TechniciansTableOrderingComposer,
    $$TechniciansTableAnnotationComposer,
    $$TechniciansTableCreateCompanionBuilder,
    $$TechniciansTableUpdateCompanionBuilder,
    (Technician, $$TechniciansTableReferences),
    Technician,
    PrefetchHooks Function({bool repairOrdersRefs})> {
  $$TechniciansTableTableManager(_$AppDatabase db, $TechniciansTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TechniciansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TechniciansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TechniciansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> active = const Value.absent(),
          }) =>
              TechniciansCompanion(
            id: id,
            name: name,
            active: active,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<bool> active = const Value.absent(),
          }) =>
              TechniciansCompanion.insert(
            id: id,
            name: name,
            active: active,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$TechniciansTable, Technician>(table),
                    $$TechniciansTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({repairOrdersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (repairOrdersRefs) db.repairOrders],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (repairOrdersRefs)
                    await $_getPrefetchedDataByColumns<Technician,
                            $TechniciansTable, RepairOrder, $RepairOrdersTable>(
                        currentTable: table,
                        referencedTable: $$TechniciansTableReferences
                            ._repairOrdersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TechniciansTableReferences(db, table, p0)
                                .repairOrdersRefs,
                        currentColumn: 'id',
                        referencedColumn: 'technician_id',
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TechniciansTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TechniciansTable,
    Technician,
    $$TechniciansTableFilterComposer,
    $$TechniciansTableOrderingComposer,
    $$TechniciansTableAnnotationComposer,
    $$TechniciansTableCreateCompanionBuilder,
    $$TechniciansTableUpdateCompanionBuilder,
    (Technician, $$TechniciansTableReferences),
    Technician,
    PrefetchHooks Function({bool repairOrdersRefs})>;
typedef $$ClientsTableCreateCompanionBuilder = ClientsCompanion Function({
  Value<int> id,
  required String fullName,
  required String phone,
  Value<DateTime> createdAt,
});
typedef $$ClientsTableUpdateCompanionBuilder = ClientsCompanion Function({
  Value<int> id,
  Value<String> fullName,
  Value<String> phone,
  Value<DateTime> createdAt,
});

final class $$ClientsTableReferences
    extends BaseReferences<_$AppDatabase, $ClientsTable, Client> {
  $$ClientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DevicesTable, List<Device>> _devicesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.devices,
          aliasName: 'clients__id__devices__client_id');

  $$DevicesTableProcessedTableManager get devicesRefs {
    final manager = $$DevicesTableTableManager($_db, $_db.devices)
        .filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_devicesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$RepairOrdersTable, List<RepairOrder>>
      _repairOrdersRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.repairOrders,
              aliasName: 'clients__id__repair_orders__client_id');

  $$RepairOrdersTableProcessedTableManager get repairOrdersRefs {
    final manager = $$RepairOrdersTableTableManager($_db, $_db.repairOrders)
        .filter((f) => f.clientId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_repairOrdersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ClientsTableFilterComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  Expression<bool> devicesRefs(
      Expression<bool> Function($$DevicesTableFilterComposer f) f) {
    final $$DevicesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.clientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableFilterComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> repairOrdersRefs(
      Expression<bool> Function($$RepairOrdersTableFilterComposer f) f) {
    final $$RepairOrdersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.clientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableFilterComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ClientsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ClientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> devicesRefs<T extends Object>(
      Expression<T> Function($$DevicesTableAnnotationComposer a) f) {
    final $$DevicesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.clientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableAnnotationComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> repairOrdersRefs<T extends Object>(
      Expression<T> Function($$RepairOrdersTableAnnotationComposer a) f) {
    final $$RepairOrdersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.clientId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableAnnotationComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ClientsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClientsTable,
    Client,
    $$ClientsTableFilterComposer,
    $$ClientsTableOrderingComposer,
    $$ClientsTableAnnotationComposer,
    $$ClientsTableCreateCompanionBuilder,
    $$ClientsTableUpdateCompanionBuilder,
    (Client, $$ClientsTableReferences),
    Client,
    PrefetchHooks Function({bool devicesRefs, bool repairOrdersRefs})> {
  $$ClientsTableTableManager(_$AppDatabase db, $ClientsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> phone = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ClientsCompanion(
            id: id,
            fullName: fullName,
            phone: phone,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String fullName,
            required String phone,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ClientsCompanion.insert(
            id: id,
            fullName: fullName,
            phone: phone,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$ClientsTable, Client>(table),
                    $$ClientsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {devicesRefs = false, repairOrdersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (devicesRefs) db.devices,
                if (repairOrdersRefs) db.repairOrders
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (devicesRefs)
                    await $_getPrefetchedDataByColumns<Client, $ClientsTable,
                            Device, $DevicesTable>(
                        currentTable: table,
                        referencedTable:
                            $$ClientsTableReferences._devicesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ClientsTableReferences(db, table, p0).devicesRefs,
                        currentColumn: 'id',
                        referencedColumn: 'client_id',
                        typedResults: items),
                  if (repairOrdersRefs)
                    await $_getPrefetchedDataByColumns<Client, $ClientsTable,
                            RepairOrder, $RepairOrdersTable>(
                        currentTable: table,
                        referencedTable:
                            $$ClientsTableReferences._repairOrdersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ClientsTableReferences(db, table, p0)
                                .repairOrdersRefs,
                        currentColumn: 'id',
                        referencedColumn: 'client_id',
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ClientsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ClientsTable,
    Client,
    $$ClientsTableFilterComposer,
    $$ClientsTableOrderingComposer,
    $$ClientsTableAnnotationComposer,
    $$ClientsTableCreateCompanionBuilder,
    $$ClientsTableUpdateCompanionBuilder,
    (Client, $$ClientsTableReferences),
    Client,
    PrefetchHooks Function({bool devicesRefs, bool repairOrdersRefs})>;
typedef $$DevicesTableCreateCompanionBuilder = DevicesCompanion Function({
  Value<int> id,
  required int clientId,
  required String type,
  required String brand,
  required String model,
  Value<String?> serialNumber,
  Value<DateTime> createdAt,
});
typedef $$DevicesTableUpdateCompanionBuilder = DevicesCompanion Function({
  Value<int> id,
  Value<int> clientId,
  Value<String> type,
  Value<String> brand,
  Value<String> model,
  Value<String?> serialNumber,
  Value<DateTime> createdAt,
});

final class $$DevicesTableReferences
    extends BaseReferences<_$AppDatabase, $DevicesTable, Device> {
  $$DevicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$AppDatabase db) =>
      db.clients.createAlias('devices__client_id__clients__id');

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<int>('client_id')!;

    final manager = $$ClientsTableTableManager($_db, $_db.clients)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RepairOrdersTable, List<RepairOrder>>
      _repairOrdersRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.repairOrders,
              aliasName: 'devices__id__repair_orders__device_id');

  $$RepairOrdersTableProcessedTableManager get repairOrdersRefs {
    final manager = $$RepairOrdersTableTableManager($_db, $_db.repairOrders)
        .filter((f) => f.deviceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_repairOrdersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DevicesTableFilterComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get serialNumber => $composableBuilder(
      column: $table.serialNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clientId,
        referencedTable: $db.clients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClientsTableFilterComposer(
              $db: $db,
              $table: $db.clients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> repairOrdersRefs(
      Expression<bool> Function($$RepairOrdersTableFilterComposer f) f) {
    final $$RepairOrdersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.deviceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableFilterComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DevicesTableOrderingComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get model => $composableBuilder(
      column: $table.model, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get serialNumber => $composableBuilder(
      column: $table.serialNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clientId,
        referencedTable: $db.clients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClientsTableOrderingComposer(
              $db: $db,
              $table: $db.clients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DevicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<String> get serialNumber => $composableBuilder(
      column: $table.serialNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clientId,
        referencedTable: $db.clients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClientsTableAnnotationComposer(
              $db: $db,
              $table: $db.clients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> repairOrdersRefs<T extends Object>(
      Expression<T> Function($$RepairOrdersTableAnnotationComposer a) f) {
    final $$RepairOrdersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.deviceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableAnnotationComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DevicesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DevicesTable,
    Device,
    $$DevicesTableFilterComposer,
    $$DevicesTableOrderingComposer,
    $$DevicesTableAnnotationComposer,
    $$DevicesTableCreateCompanionBuilder,
    $$DevicesTableUpdateCompanionBuilder,
    (Device, $$DevicesTableReferences),
    Device,
    PrefetchHooks Function({bool clientId, bool repairOrdersRefs})> {
  $$DevicesTableTableManager(_$AppDatabase db, $DevicesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DevicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DevicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DevicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> clientId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> brand = const Value.absent(),
            Value<String> model = const Value.absent(),
            Value<String?> serialNumber = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              DevicesCompanion(
            id: id,
            clientId: clientId,
            type: type,
            brand: brand,
            model: model,
            serialNumber: serialNumber,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int clientId,
            required String type,
            required String brand,
            required String model,
            Value<String?> serialNumber = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              DevicesCompanion.insert(
            id: id,
            clientId: clientId,
            type: type,
            brand: brand,
            model: model,
            serialNumber: serialNumber,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$DevicesTable, Device>(table),
                    $$DevicesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {clientId = false, repairOrdersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (repairOrdersRefs) db.repairOrders],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (clientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.clientId,
                    referencedTable:
                        $$DevicesTableReferences._clientIdTable(db),
                    referencedColumn:
                        $$DevicesTableReferences._clientIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (repairOrdersRefs)
                    await $_getPrefetchedDataByColumns<Device, $DevicesTable,
                            RepairOrder, $RepairOrdersTable>(
                        currentTable: table,
                        referencedTable:
                            $$DevicesTableReferences._repairOrdersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DevicesTableReferences(db, table, p0)
                                .repairOrdersRefs,
                        currentColumn: 'id',
                        referencedColumn: 'device_id',
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DevicesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DevicesTable,
    Device,
    $$DevicesTableFilterComposer,
    $$DevicesTableOrderingComposer,
    $$DevicesTableAnnotationComposer,
    $$DevicesTableCreateCompanionBuilder,
    $$DevicesTableUpdateCompanionBuilder,
    (Device, $$DevicesTableReferences),
    Device,
    PrefetchHooks Function({bool clientId, bool repairOrdersRefs})>;
typedef $$RepairOrdersTableCreateCompanionBuilder = RepairOrdersCompanion
    Function({
  Value<int> id,
  required String code,
  required int clientId,
  required int deviceId,
  Value<int?> technicianId,
  required String reportedIssue,
  Value<String> status,
  Value<String?> notes,
  Value<DateTime> receivedAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deliveredAt,
});
typedef $$RepairOrdersTableUpdateCompanionBuilder = RepairOrdersCompanion
    Function({
  Value<int> id,
  Value<String> code,
  Value<int> clientId,
  Value<int> deviceId,
  Value<int?> technicianId,
  Value<String> reportedIssue,
  Value<String> status,
  Value<String?> notes,
  Value<DateTime> receivedAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deliveredAt,
});

final class $$RepairOrdersTableReferences
    extends BaseReferences<_$AppDatabase, $RepairOrdersTable, RepairOrder> {
  $$RepairOrdersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientsTable _clientIdTable(_$AppDatabase db) =>
      db.clients.createAlias('repair_orders__client_id__clients__id');

  $$ClientsTableProcessedTableManager get clientId {
    final $_column = $_itemColumn<int>('client_id')!;

    final manager = $$ClientsTableTableManager($_db, $_db.clients)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DevicesTable _deviceIdTable(_$AppDatabase db) =>
      db.devices.createAlias('repair_orders__device_id__devices__id');

  $$DevicesTableProcessedTableManager get deviceId {
    final $_column = $_itemColumn<int>('device_id')!;

    final manager = $$DevicesTableTableManager($_db, $_db.devices)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_deviceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TechniciansTable _technicianIdTable(_$AppDatabase db) =>
      db.technicians
          .createAlias('repair_orders__technician_id__technicians__id');

  $$TechniciansTableProcessedTableManager? get technicianId {
    final $_column = $_itemColumn<int>('technician_id');
    if ($_column == null) return null;
    final manager = $$TechniciansTableTableManager($_db, $_db.technicians)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_technicianIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$RepairJobsTable, List<RepairJob>>
      _repairJobsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.repairJobs,
              aliasName: 'repair_orders__id__repair_jobs__order_id');

  $$RepairJobsTableProcessedTableManager get repairJobsRefs {
    final manager = $$RepairJobsTableTableManager($_db, $_db.repairJobs)
        .filter((f) => f.orderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_repairJobsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$OrderSparePartsTable, List<OrderSparePart>>
      _orderSparePartsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.orderSpareParts,
              aliasName: 'repair_orders__id__order_spare_parts__order_id');

  $$OrderSparePartsTableProcessedTableManager get orderSparePartsRefs {
    final manager =
        $$OrderSparePartsTableTableManager($_db, $_db.orderSpareParts)
            .filter((f) => f.orderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_orderSparePartsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$InventoryMovementsTable, List<InventoryMovement>>
      _inventoryMovementsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.inventoryMovements,
              aliasName: 'repair_orders__id__inventory_movements__order_id');

  $$InventoryMovementsTableProcessedTableManager get inventoryMovementsRefs {
    final manager =
        $$InventoryMovementsTableTableManager($_db, $_db.inventoryMovements)
            .filter((f) => f.orderId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_inventoryMovementsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RepairOrdersTableFilterComposer
    extends Composer<_$AppDatabase, $RepairOrdersTable> {
  $$RepairOrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reportedIssue => $composableBuilder(
      column: $table.reportedIssue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get receivedAt => $composableBuilder(
      column: $table.receivedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deliveredAt => $composableBuilder(
      column: $table.deliveredAt, builder: (column) => ColumnFilters(column));

  $$ClientsTableFilterComposer get clientId {
    final $$ClientsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clientId,
        referencedTable: $db.clients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClientsTableFilterComposer(
              $db: $db,
              $table: $db.clients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DevicesTableFilterComposer get deviceId {
    final $$DevicesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deviceId,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableFilterComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TechniciansTableFilterComposer get technicianId {
    final $$TechniciansTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.technicianId,
        referencedTable: $db.technicians,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TechniciansTableFilterComposer(
              $db: $db,
              $table: $db.technicians,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> repairJobsRefs(
      Expression<bool> Function($$RepairJobsTableFilterComposer f) f) {
    final $$RepairJobsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.repairJobs,
        getReferencedColumn: (t) => t.orderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairJobsTableFilterComposer(
              $db: $db,
              $table: $db.repairJobs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> orderSparePartsRefs(
      Expression<bool> Function($$OrderSparePartsTableFilterComposer f) f) {
    final $$OrderSparePartsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.orderSpareParts,
        getReferencedColumn: (t) => t.orderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderSparePartsTableFilterComposer(
              $db: $db,
              $table: $db.orderSpareParts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> inventoryMovementsRefs(
      Expression<bool> Function($$InventoryMovementsTableFilterComposer f) f) {
    final $$InventoryMovementsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.inventoryMovements,
        getReferencedColumn: (t) => t.orderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InventoryMovementsTableFilterComposer(
              $db: $db,
              $table: $db.inventoryMovements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RepairOrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $RepairOrdersTable> {
  $$RepairOrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reportedIssue => $composableBuilder(
      column: $table.reportedIssue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get receivedAt => $composableBuilder(
      column: $table.receivedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deliveredAt => $composableBuilder(
      column: $table.deliveredAt, builder: (column) => ColumnOrderings(column));

  $$ClientsTableOrderingComposer get clientId {
    final $$ClientsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clientId,
        referencedTable: $db.clients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClientsTableOrderingComposer(
              $db: $db,
              $table: $db.clients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DevicesTableOrderingComposer get deviceId {
    final $$DevicesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deviceId,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableOrderingComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TechniciansTableOrderingComposer get technicianId {
    final $$TechniciansTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.technicianId,
        referencedTable: $db.technicians,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TechniciansTableOrderingComposer(
              $db: $db,
              $table: $db.technicians,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RepairOrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $RepairOrdersTable> {
  $$RepairOrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get reportedIssue => $composableBuilder(
      column: $table.reportedIssue, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<DateTime> get receivedAt => $composableBuilder(
      column: $table.receivedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deliveredAt => $composableBuilder(
      column: $table.deliveredAt, builder: (column) => column);

  $$ClientsTableAnnotationComposer get clientId {
    final $$ClientsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.clientId,
        referencedTable: $db.clients,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ClientsTableAnnotationComposer(
              $db: $db,
              $table: $db.clients,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DevicesTableAnnotationComposer get deviceId {
    final $$DevicesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deviceId,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableAnnotationComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TechniciansTableAnnotationComposer get technicianId {
    final $$TechniciansTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.technicianId,
        referencedTable: $db.technicians,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TechniciansTableAnnotationComposer(
              $db: $db,
              $table: $db.technicians,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> repairJobsRefs<T extends Object>(
      Expression<T> Function($$RepairJobsTableAnnotationComposer a) f) {
    final $$RepairJobsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.repairJobs,
        getReferencedColumn: (t) => t.orderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairJobsTableAnnotationComposer(
              $db: $db,
              $table: $db.repairJobs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> orderSparePartsRefs<T extends Object>(
      Expression<T> Function($$OrderSparePartsTableAnnotationComposer a) f) {
    final $$OrderSparePartsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.orderSpareParts,
        getReferencedColumn: (t) => t.orderId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderSparePartsTableAnnotationComposer(
              $db: $db,
              $table: $db.orderSpareParts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> inventoryMovementsRefs<T extends Object>(
      Expression<T> Function($$InventoryMovementsTableAnnotationComposer a) f) {
    final $$InventoryMovementsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryMovements,
            getReferencedColumn: (t) => t.orderId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryMovementsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.inventoryMovements,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$RepairOrdersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RepairOrdersTable,
    RepairOrder,
    $$RepairOrdersTableFilterComposer,
    $$RepairOrdersTableOrderingComposer,
    $$RepairOrdersTableAnnotationComposer,
    $$RepairOrdersTableCreateCompanionBuilder,
    $$RepairOrdersTableUpdateCompanionBuilder,
    (RepairOrder, $$RepairOrdersTableReferences),
    RepairOrder,
    PrefetchHooks Function(
        {bool clientId,
        bool deviceId,
        bool technicianId,
        bool repairJobsRefs,
        bool orderSparePartsRefs,
        bool inventoryMovementsRefs})> {
  $$RepairOrdersTableTableManager(_$AppDatabase db, $RepairOrdersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RepairOrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RepairOrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RepairOrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<int> clientId = const Value.absent(),
            Value<int> deviceId = const Value.absent(),
            Value<int?> technicianId = const Value.absent(),
            Value<String> reportedIssue = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> receivedAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deliveredAt = const Value.absent(),
          }) =>
              RepairOrdersCompanion(
            id: id,
            code: code,
            clientId: clientId,
            deviceId: deviceId,
            technicianId: technicianId,
            reportedIssue: reportedIssue,
            status: status,
            notes: notes,
            receivedAt: receivedAt,
            updatedAt: updatedAt,
            deliveredAt: deliveredAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String code,
            required int clientId,
            required int deviceId,
            Value<int?> technicianId = const Value.absent(),
            required String reportedIssue,
            Value<String> status = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<DateTime> receivedAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deliveredAt = const Value.absent(),
          }) =>
              RepairOrdersCompanion.insert(
            id: id,
            code: code,
            clientId: clientId,
            deviceId: deviceId,
            technicianId: technicianId,
            reportedIssue: reportedIssue,
            status: status,
            notes: notes,
            receivedAt: receivedAt,
            updatedAt: updatedAt,
            deliveredAt: deliveredAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$RepairOrdersTable, RepairOrder>(table),
                    $$RepairOrdersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {clientId = false,
              deviceId = false,
              technicianId = false,
              repairJobsRefs = false,
              orderSparePartsRefs = false,
              inventoryMovementsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (repairJobsRefs) db.repairJobs,
                if (orderSparePartsRefs) db.orderSpareParts,
                if (inventoryMovementsRefs) db.inventoryMovements
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (clientId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.clientId,
                    referencedTable:
                        $$RepairOrdersTableReferences._clientIdTable(db),
                    referencedColumn:
                        $$RepairOrdersTableReferences._clientIdTable(db).id,
                  ) as T;
                }
                if (deviceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.deviceId,
                    referencedTable:
                        $$RepairOrdersTableReferences._deviceIdTable(db),
                    referencedColumn:
                        $$RepairOrdersTableReferences._deviceIdTable(db).id,
                  ) as T;
                }
                if (technicianId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.technicianId,
                    referencedTable:
                        $$RepairOrdersTableReferences._technicianIdTable(db),
                    referencedColumn:
                        $$RepairOrdersTableReferences._technicianIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (repairJobsRefs)
                    await $_getPrefetchedDataByColumns<RepairOrder,
                            $RepairOrdersTable, RepairJob, $RepairJobsTable>(
                        currentTable: table,
                        referencedTable: $$RepairOrdersTableReferences
                            ._repairJobsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RepairOrdersTableReferences(db, table, p0)
                                .repairJobsRefs,
                        currentColumn: 'id',
                        referencedColumn: 'order_id',
                        typedResults: items),
                  if (orderSparePartsRefs)
                    await $_getPrefetchedDataByColumns<
                            RepairOrder,
                            $RepairOrdersTable,
                            OrderSparePart,
                            $OrderSparePartsTable>(
                        currentTable: table,
                        referencedTable: $$RepairOrdersTableReferences
                            ._orderSparePartsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RepairOrdersTableReferences(db, table, p0)
                                .orderSparePartsRefs,
                        currentColumn: 'id',
                        referencedColumn: 'order_id',
                        typedResults: items),
                  if (inventoryMovementsRefs)
                    await $_getPrefetchedDataByColumns<
                            RepairOrder,
                            $RepairOrdersTable,
                            InventoryMovement,
                            $InventoryMovementsTable>(
                        currentTable: table,
                        referencedTable: $$RepairOrdersTableReferences
                            ._inventoryMovementsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RepairOrdersTableReferences(db, table, p0)
                                .inventoryMovementsRefs,
                        currentColumn: 'id',
                        referencedColumn: 'order_id',
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RepairOrdersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RepairOrdersTable,
    RepairOrder,
    $$RepairOrdersTableFilterComposer,
    $$RepairOrdersTableOrderingComposer,
    $$RepairOrdersTableAnnotationComposer,
    $$RepairOrdersTableCreateCompanionBuilder,
    $$RepairOrdersTableUpdateCompanionBuilder,
    (RepairOrder, $$RepairOrdersTableReferences),
    RepairOrder,
    PrefetchHooks Function(
        {bool clientId,
        bool deviceId,
        bool technicianId,
        bool repairJobsRefs,
        bool orderSparePartsRefs,
        bool inventoryMovementsRefs})>;
typedef $$RepairJobsTableCreateCompanionBuilder = RepairJobsCompanion Function({
  Value<int> id,
  required int orderId,
  required String description,
  required int laborCostCents,
  Value<DateTime> createdAt,
});
typedef $$RepairJobsTableUpdateCompanionBuilder = RepairJobsCompanion Function({
  Value<int> id,
  Value<int> orderId,
  Value<String> description,
  Value<int> laborCostCents,
  Value<DateTime> createdAt,
});

final class $$RepairJobsTableReferences
    extends BaseReferences<_$AppDatabase, $RepairJobsTable, RepairJob> {
  $$RepairJobsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RepairOrdersTable _orderIdTable(_$AppDatabase db) =>
      db.repairOrders.createAlias('repair_jobs__order_id__repair_orders__id');

  $$RepairOrdersTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<int>('order_id')!;

    final manager = $$RepairOrdersTableTableManager($_db, $_db.repairOrders)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RepairJobsTableFilterComposer
    extends Composer<_$AppDatabase, $RepairJobsTable> {
  $$RepairJobsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get laborCostCents => $composableBuilder(
      column: $table.laborCostCents,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$RepairOrdersTableFilterComposer get orderId {
    final $$RepairOrdersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableFilterComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RepairJobsTableOrderingComposer
    extends Composer<_$AppDatabase, $RepairJobsTable> {
  $$RepairJobsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get laborCostCents => $composableBuilder(
      column: $table.laborCostCents,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$RepairOrdersTableOrderingComposer get orderId {
    final $$RepairOrdersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableOrderingComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RepairJobsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RepairJobsTable> {
  $$RepairJobsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get laborCostCents => $composableBuilder(
      column: $table.laborCostCents, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$RepairOrdersTableAnnotationComposer get orderId {
    final $$RepairOrdersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableAnnotationComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RepairJobsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RepairJobsTable,
    RepairJob,
    $$RepairJobsTableFilterComposer,
    $$RepairJobsTableOrderingComposer,
    $$RepairJobsTableAnnotationComposer,
    $$RepairJobsTableCreateCompanionBuilder,
    $$RepairJobsTableUpdateCompanionBuilder,
    (RepairJob, $$RepairJobsTableReferences),
    RepairJob,
    PrefetchHooks Function({bool orderId})> {
  $$RepairJobsTableTableManager(_$AppDatabase db, $RepairJobsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RepairJobsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RepairJobsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RepairJobsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> orderId = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> laborCostCents = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              RepairJobsCompanion(
            id: id,
            orderId: orderId,
            description: description,
            laborCostCents: laborCostCents,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int orderId,
            required String description,
            required int laborCostCents,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              RepairJobsCompanion.insert(
            id: id,
            orderId: orderId,
            description: description,
            laborCostCents: laborCostCents,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$RepairJobsTable, RepairJob>(table),
                    $$RepairJobsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({orderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (orderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.orderId,
                    referencedTable:
                        $$RepairJobsTableReferences._orderIdTable(db),
                    referencedColumn:
                        $$RepairJobsTableReferences._orderIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RepairJobsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RepairJobsTable,
    RepairJob,
    $$RepairJobsTableFilterComposer,
    $$RepairJobsTableOrderingComposer,
    $$RepairJobsTableAnnotationComposer,
    $$RepairJobsTableCreateCompanionBuilder,
    $$RepairJobsTableUpdateCompanionBuilder,
    (RepairJob, $$RepairJobsTableReferences),
    RepairJob,
    PrefetchHooks Function({bool orderId})>;
typedef $$SparePartsTableCreateCompanionBuilder = SparePartsCompanion Function({
  Value<int> id,
  required String name,
  required String code,
  Value<String?> description,
  required int unitPriceCents,
  Value<int> quantity,
  Value<int> minimumStock,
  Value<bool> active,
});
typedef $$SparePartsTableUpdateCompanionBuilder = SparePartsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> code,
  Value<String?> description,
  Value<int> unitPriceCents,
  Value<int> quantity,
  Value<int> minimumStock,
  Value<bool> active,
});

final class $$SparePartsTableReferences
    extends BaseReferences<_$AppDatabase, $SparePartsTable, SparePart> {
  $$SparePartsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OrderSparePartsTable, List<OrderSparePart>>
      _orderSparePartsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.orderSpareParts,
              aliasName: 'spare_parts__id__order_spare_parts__spare_part_id');

  $$OrderSparePartsTableProcessedTableManager get orderSparePartsRefs {
    final manager = $$OrderSparePartsTableTableManager(
            $_db, $_db.orderSpareParts)
        .filter((f) => f.sparePartId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_orderSparePartsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$InventoryMovementsTable, List<InventoryMovement>>
      _inventoryMovementsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.inventoryMovements,
              aliasName: 'spare_parts__id__inventory_movements__spare_part_id');

  $$InventoryMovementsTableProcessedTableManager get inventoryMovementsRefs {
    final manager = $$InventoryMovementsTableTableManager(
            $_db, $_db.inventoryMovements)
        .filter((f) => f.sparePartId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_inventoryMovementsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SparePartsTableFilterComposer
    extends Composer<_$AppDatabase, $SparePartsTable> {
  $$SparePartsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unitPriceCents => $composableBuilder(
      column: $table.unitPriceCents,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minimumStock => $composableBuilder(
      column: $table.minimumStock, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  Expression<bool> orderSparePartsRefs(
      Expression<bool> Function($$OrderSparePartsTableFilterComposer f) f) {
    final $$OrderSparePartsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.orderSpareParts,
        getReferencedColumn: (t) => t.sparePartId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderSparePartsTableFilterComposer(
              $db: $db,
              $table: $db.orderSpareParts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> inventoryMovementsRefs(
      Expression<bool> Function($$InventoryMovementsTableFilterComposer f) f) {
    final $$InventoryMovementsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.inventoryMovements,
        getReferencedColumn: (t) => t.sparePartId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$InventoryMovementsTableFilterComposer(
              $db: $db,
              $table: $db.inventoryMovements,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SparePartsTableOrderingComposer
    extends Composer<_$AppDatabase, $SparePartsTable> {
  $$SparePartsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unitPriceCents => $composableBuilder(
      column: $table.unitPriceCents,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minimumStock => $composableBuilder(
      column: $table.minimumStock,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));
}

class $$SparePartsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SparePartsTable> {
  $$SparePartsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get unitPriceCents => $composableBuilder(
      column: $table.unitPriceCents, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get minimumStock => $composableBuilder(
      column: $table.minimumStock, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  Expression<T> orderSparePartsRefs<T extends Object>(
      Expression<T> Function($$OrderSparePartsTableAnnotationComposer a) f) {
    final $$OrderSparePartsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.orderSpareParts,
        getReferencedColumn: (t) => t.sparePartId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OrderSparePartsTableAnnotationComposer(
              $db: $db,
              $table: $db.orderSpareParts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> inventoryMovementsRefs<T extends Object>(
      Expression<T> Function($$InventoryMovementsTableAnnotationComposer a) f) {
    final $$InventoryMovementsTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.inventoryMovements,
            getReferencedColumn: (t) => t.sparePartId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$InventoryMovementsTableAnnotationComposer(
                  $db: $db,
                  $table: $db.inventoryMovements,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$SparePartsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SparePartsTable,
    SparePart,
    $$SparePartsTableFilterComposer,
    $$SparePartsTableOrderingComposer,
    $$SparePartsTableAnnotationComposer,
    $$SparePartsTableCreateCompanionBuilder,
    $$SparePartsTableUpdateCompanionBuilder,
    (SparePart, $$SparePartsTableReferences),
    SparePart,
    PrefetchHooks Function(
        {bool orderSparePartsRefs, bool inventoryMovementsRefs})> {
  $$SparePartsTableTableManager(_$AppDatabase db, $SparePartsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SparePartsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SparePartsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SparePartsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> unitPriceCents = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> minimumStock = const Value.absent(),
            Value<bool> active = const Value.absent(),
          }) =>
              SparePartsCompanion(
            id: id,
            name: name,
            code: code,
            description: description,
            unitPriceCents: unitPriceCents,
            quantity: quantity,
            minimumStock: minimumStock,
            active: active,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String code,
            Value<String?> description = const Value.absent(),
            required int unitPriceCents,
            Value<int> quantity = const Value.absent(),
            Value<int> minimumStock = const Value.absent(),
            Value<bool> active = const Value.absent(),
          }) =>
              SparePartsCompanion.insert(
            id: id,
            name: name,
            code: code,
            description: description,
            unitPriceCents: unitPriceCents,
            quantity: quantity,
            minimumStock: minimumStock,
            active: active,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$SparePartsTable, SparePart>(table),
                    $$SparePartsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {orderSparePartsRefs = false, inventoryMovementsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (orderSparePartsRefs) db.orderSpareParts,
                if (inventoryMovementsRefs) db.inventoryMovements
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (orderSparePartsRefs)
                    await $_getPrefetchedDataByColumns<
                            SparePart,
                            $SparePartsTable,
                            OrderSparePart,
                            $OrderSparePartsTable>(
                        currentTable: table,
                        referencedTable: $$SparePartsTableReferences
                            ._orderSparePartsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SparePartsTableReferences(db, table, p0)
                                .orderSparePartsRefs,
                        currentColumn: 'id',
                        referencedColumn: 'spare_part_id',
                        typedResults: items),
                  if (inventoryMovementsRefs)
                    await $_getPrefetchedDataByColumns<
                            SparePart,
                            $SparePartsTable,
                            InventoryMovement,
                            $InventoryMovementsTable>(
                        currentTable: table,
                        referencedTable: $$SparePartsTableReferences
                            ._inventoryMovementsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SparePartsTableReferences(db, table, p0)
                                .inventoryMovementsRefs,
                        currentColumn: 'id',
                        referencedColumn: 'spare_part_id',
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SparePartsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SparePartsTable,
    SparePart,
    $$SparePartsTableFilterComposer,
    $$SparePartsTableOrderingComposer,
    $$SparePartsTableAnnotationComposer,
    $$SparePartsTableCreateCompanionBuilder,
    $$SparePartsTableUpdateCompanionBuilder,
    (SparePart, $$SparePartsTableReferences),
    SparePart,
    PrefetchHooks Function(
        {bool orderSparePartsRefs, bool inventoryMovementsRefs})>;
typedef $$OrderSparePartsTableCreateCompanionBuilder = OrderSparePartsCompanion
    Function({
  Value<int> id,
  required int orderId,
  required int sparePartId,
  required int quantity,
  required int unitPriceCents,
});
typedef $$OrderSparePartsTableUpdateCompanionBuilder = OrderSparePartsCompanion
    Function({
  Value<int> id,
  Value<int> orderId,
  Value<int> sparePartId,
  Value<int> quantity,
  Value<int> unitPriceCents,
});

final class $$OrderSparePartsTableReferences extends BaseReferences<
    _$AppDatabase, $OrderSparePartsTable, OrderSparePart> {
  $$OrderSparePartsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RepairOrdersTable _orderIdTable(_$AppDatabase db) => db.repairOrders
      .createAlias('order_spare_parts__order_id__repair_orders__id');

  $$RepairOrdersTableProcessedTableManager get orderId {
    final $_column = $_itemColumn<int>('order_id')!;

    final manager = $$RepairOrdersTableTableManager($_db, $_db.repairOrders)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SparePartsTable _sparePartIdTable(_$AppDatabase db) => db.spareParts
      .createAlias('order_spare_parts__spare_part_id__spare_parts__id');

  $$SparePartsTableProcessedTableManager get sparePartId {
    final $_column = $_itemColumn<int>('spare_part_id')!;

    final manager = $$SparePartsTableTableManager($_db, $_db.spareParts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sparePartIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$OrderSparePartsTableFilterComposer
    extends Composer<_$AppDatabase, $OrderSparePartsTable> {
  $$OrderSparePartsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unitPriceCents => $composableBuilder(
      column: $table.unitPriceCents,
      builder: (column) => ColumnFilters(column));

  $$RepairOrdersTableFilterComposer get orderId {
    final $$RepairOrdersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableFilterComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SparePartsTableFilterComposer get sparePartId {
    final $$SparePartsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sparePartId,
        referencedTable: $db.spareParts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SparePartsTableFilterComposer(
              $db: $db,
              $table: $db.spareParts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OrderSparePartsTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderSparePartsTable> {
  $$OrderSparePartsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unitPriceCents => $composableBuilder(
      column: $table.unitPriceCents,
      builder: (column) => ColumnOrderings(column));

  $$RepairOrdersTableOrderingComposer get orderId {
    final $$RepairOrdersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableOrderingComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SparePartsTableOrderingComposer get sparePartId {
    final $$SparePartsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sparePartId,
        referencedTable: $db.spareParts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SparePartsTableOrderingComposer(
              $db: $db,
              $table: $db.spareParts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OrderSparePartsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderSparePartsTable> {
  $$OrderSparePartsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitPriceCents => $composableBuilder(
      column: $table.unitPriceCents, builder: (column) => column);

  $$RepairOrdersTableAnnotationComposer get orderId {
    final $$RepairOrdersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableAnnotationComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SparePartsTableAnnotationComposer get sparePartId {
    final $$SparePartsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sparePartId,
        referencedTable: $db.spareParts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SparePartsTableAnnotationComposer(
              $db: $db,
              $table: $db.spareParts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OrderSparePartsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrderSparePartsTable,
    OrderSparePart,
    $$OrderSparePartsTableFilterComposer,
    $$OrderSparePartsTableOrderingComposer,
    $$OrderSparePartsTableAnnotationComposer,
    $$OrderSparePartsTableCreateCompanionBuilder,
    $$OrderSparePartsTableUpdateCompanionBuilder,
    (OrderSparePart, $$OrderSparePartsTableReferences),
    OrderSparePart,
    PrefetchHooks Function({bool orderId, bool sparePartId})> {
  $$OrderSparePartsTableTableManager(
      _$AppDatabase db, $OrderSparePartsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderSparePartsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderSparePartsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderSparePartsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> orderId = const Value.absent(),
            Value<int> sparePartId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> unitPriceCents = const Value.absent(),
          }) =>
              OrderSparePartsCompanion(
            id: id,
            orderId: orderId,
            sparePartId: sparePartId,
            quantity: quantity,
            unitPriceCents: unitPriceCents,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int orderId,
            required int sparePartId,
            required int quantity,
            required int unitPriceCents,
          }) =>
              OrderSparePartsCompanion.insert(
            id: id,
            orderId: orderId,
            sparePartId: sparePartId,
            quantity: quantity,
            unitPriceCents: unitPriceCents,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$OrderSparePartsTable, OrderSparePart>(table),
                    $$OrderSparePartsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({orderId = false, sparePartId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (orderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.orderId,
                    referencedTable:
                        $$OrderSparePartsTableReferences._orderIdTable(db),
                    referencedColumn:
                        $$OrderSparePartsTableReferences._orderIdTable(db).id,
                  ) as T;
                }
                if (sparePartId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.sparePartId,
                    referencedTable:
                        $$OrderSparePartsTableReferences._sparePartIdTable(db),
                    referencedColumn: $$OrderSparePartsTableReferences
                        ._sparePartIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$OrderSparePartsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OrderSparePartsTable,
    OrderSparePart,
    $$OrderSparePartsTableFilterComposer,
    $$OrderSparePartsTableOrderingComposer,
    $$OrderSparePartsTableAnnotationComposer,
    $$OrderSparePartsTableCreateCompanionBuilder,
    $$OrderSparePartsTableUpdateCompanionBuilder,
    (OrderSparePart, $$OrderSparePartsTableReferences),
    OrderSparePart,
    PrefetchHooks Function({bool orderId, bool sparePartId})>;
typedef $$InventoryMovementsTableCreateCompanionBuilder
    = InventoryMovementsCompanion Function({
  Value<int> id,
  required int sparePartId,
  Value<int?> orderId,
  required int quantityDelta,
  required String reason,
  Value<DateTime> createdAt,
});
typedef $$InventoryMovementsTableUpdateCompanionBuilder
    = InventoryMovementsCompanion Function({
  Value<int> id,
  Value<int> sparePartId,
  Value<int?> orderId,
  Value<int> quantityDelta,
  Value<String> reason,
  Value<DateTime> createdAt,
});

final class $$InventoryMovementsTableReferences extends BaseReferences<
    _$AppDatabase, $InventoryMovementsTable, InventoryMovement> {
  $$InventoryMovementsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $SparePartsTable _sparePartIdTable(_$AppDatabase db) => db.spareParts
      .createAlias('inventory_movements__spare_part_id__spare_parts__id');

  $$SparePartsTableProcessedTableManager get sparePartId {
    final $_column = $_itemColumn<int>('spare_part_id')!;

    final manager = $$SparePartsTableTableManager($_db, $_db.spareParts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sparePartIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $RepairOrdersTable _orderIdTable(_$AppDatabase db) => db.repairOrders
      .createAlias('inventory_movements__order_id__repair_orders__id');

  $$RepairOrdersTableProcessedTableManager? get orderId {
    final $_column = $_itemColumn<int>('order_id');
    if ($_column == null) return null;
    final manager = $$RepairOrdersTableTableManager($_db, $_db.repairOrders)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_orderIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$InventoryMovementsTableFilterComposer
    extends Composer<_$AppDatabase, $InventoryMovementsTable> {
  $$InventoryMovementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantityDelta => $composableBuilder(
      column: $table.quantityDelta, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$SparePartsTableFilterComposer get sparePartId {
    final $$SparePartsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sparePartId,
        referencedTable: $db.spareParts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SparePartsTableFilterComposer(
              $db: $db,
              $table: $db.spareParts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RepairOrdersTableFilterComposer get orderId {
    final $$RepairOrdersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableFilterComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$InventoryMovementsTableOrderingComposer
    extends Composer<_$AppDatabase, $InventoryMovementsTable> {
  $$InventoryMovementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantityDelta => $composableBuilder(
      column: $table.quantityDelta,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$SparePartsTableOrderingComposer get sparePartId {
    final $$SparePartsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sparePartId,
        referencedTable: $db.spareParts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SparePartsTableOrderingComposer(
              $db: $db,
              $table: $db.spareParts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RepairOrdersTableOrderingComposer get orderId {
    final $$RepairOrdersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableOrderingComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$InventoryMovementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventoryMovementsTable> {
  $$InventoryMovementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantityDelta => $composableBuilder(
      column: $table.quantityDelta, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SparePartsTableAnnotationComposer get sparePartId {
    final $$SparePartsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.sparePartId,
        referencedTable: $db.spareParts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SparePartsTableAnnotationComposer(
              $db: $db,
              $table: $db.spareParts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RepairOrdersTableAnnotationComposer get orderId {
    final $$RepairOrdersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.orderId,
        referencedTable: $db.repairOrders,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RepairOrdersTableAnnotationComposer(
              $db: $db,
              $table: $db.repairOrders,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$InventoryMovementsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InventoryMovementsTable,
    InventoryMovement,
    $$InventoryMovementsTableFilterComposer,
    $$InventoryMovementsTableOrderingComposer,
    $$InventoryMovementsTableAnnotationComposer,
    $$InventoryMovementsTableCreateCompanionBuilder,
    $$InventoryMovementsTableUpdateCompanionBuilder,
    (InventoryMovement, $$InventoryMovementsTableReferences),
    InventoryMovement,
    PrefetchHooks Function({bool sparePartId, bool orderId})> {
  $$InventoryMovementsTableTableManager(
      _$AppDatabase db, $InventoryMovementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventoryMovementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InventoryMovementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InventoryMovementsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> sparePartId = const Value.absent(),
            Value<int?> orderId = const Value.absent(),
            Value<int> quantityDelta = const Value.absent(),
            Value<String> reason = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              InventoryMovementsCompanion(
            id: id,
            sparePartId: sparePartId,
            orderId: orderId,
            quantityDelta: quantityDelta,
            reason: reason,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int sparePartId,
            Value<int?> orderId = const Value.absent(),
            required int quantityDelta,
            required String reason,
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              InventoryMovementsCompanion.insert(
            id: id,
            sparePartId: sparePartId,
            orderId: orderId,
            quantityDelta: quantityDelta,
            reason: reason,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$InventoryMovementsTable, InventoryMovement>(
                        table),
                    $$InventoryMovementsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({sparePartId = false, orderId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (sparePartId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.sparePartId,
                    referencedTable: $$InventoryMovementsTableReferences
                        ._sparePartIdTable(db),
                    referencedColumn: $$InventoryMovementsTableReferences
                        ._sparePartIdTable(db)
                        .id,
                  ) as T;
                }
                if (orderId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.orderId,
                    referencedTable:
                        $$InventoryMovementsTableReferences._orderIdTable(db),
                    referencedColumn: $$InventoryMovementsTableReferences
                        ._orderIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$InventoryMovementsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $InventoryMovementsTable,
    InventoryMovement,
    $$InventoryMovementsTableFilterComposer,
    $$InventoryMovementsTableOrderingComposer,
    $$InventoryMovementsTableAnnotationComposer,
    $$InventoryMovementsTableCreateCompanionBuilder,
    $$InventoryMovementsTableUpdateCompanionBuilder,
    (InventoryMovement, $$InventoryMovementsTableReferences),
    InventoryMovement,
    PrefetchHooks Function({bool sparePartId, bool orderId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TechniciansTableTableManager get technicians =>
      $$TechniciansTableTableManager(_db, _db.technicians);
  $$ClientsTableTableManager get clients =>
      $$ClientsTableTableManager(_db, _db.clients);
  $$DevicesTableTableManager get devices =>
      $$DevicesTableTableManager(_db, _db.devices);
  $$RepairOrdersTableTableManager get repairOrders =>
      $$RepairOrdersTableTableManager(_db, _db.repairOrders);
  $$RepairJobsTableTableManager get repairJobs =>
      $$RepairJobsTableTableManager(_db, _db.repairJobs);
  $$SparePartsTableTableManager get spareParts =>
      $$SparePartsTableTableManager(_db, _db.spareParts);
  $$OrderSparePartsTableTableManager get orderSpareParts =>
      $$OrderSparePartsTableTableManager(_db, _db.orderSpareParts);
  $$InventoryMovementsTableTableManager get inventoryMovements =>
      $$InventoryMovementsTableTableManager(_db, _db.inventoryMovements);
}
