// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class FoodEntity extends DataClass implements Insertable<FoodEntity> {
  final int id;
  final String name;
  final String image;
  final double price;
  FoodEntity(
      {@required this.id,
      @required this.name,
      @required this.image,
      @required this.price});
  factory FoodEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return FoodEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      image:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}image']),
      price:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
    );
  }
  factory FoodEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return FoodEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'price': serializer.toJson<double>(price),
    };
  }

  @override
  FoodsCompanion createCompanion(bool nullToAbsent) {
    return FoodsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  FoodEntity copyWith({int id, String name, String image, double price}) =>
      FoodEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('FoodEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(image.hashCode, price.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is FoodEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.price == this.price);
}

class FoodsCompanion extends UpdateCompanion<FoodEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<double> price;
  const FoodsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.price = const Value.absent(),
  });
  FoodsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String image,
    @required double price,
  })  : name = Value(name),
        image = Value(image),
        price = Value(price);
  FoodsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> image,
      Value<double> price}) {
    return FoodsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }
}

class $FoodsTable extends Foods with TableInfo<$FoodsTable, FoodEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $FoodsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imageMeta = const VerificationMeta('image');
  GeneratedTextColumn _image;
  @override
  GeneratedTextColumn get image => _image ??= _constructImage();
  GeneratedTextColumn _constructImage() {
    return GeneratedTextColumn(
      'image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedRealColumn _price;
  @override
  GeneratedRealColumn get price => _price ??= _constructPrice();
  GeneratedRealColumn _constructPrice() {
    return GeneratedRealColumn(
      'price',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, image, price];
  @override
  $FoodsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'foods';
  @override
  final String actualTableName = 'foods';
  @override
  VerificationContext validateIntegrity(FoodsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (d.image.present) {
      context.handle(
          _imageMeta, image.isAcceptableValue(d.image.value, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (d.price.present) {
      context.handle(
          _priceMeta, price.isAcceptableValue(d.price.value, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FoodEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return FoodEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(FoodsCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.image.present) {
      map['image'] = Variable<String, StringType>(d.image.value);
    }
    if (d.price.present) {
      map['price'] = Variable<double, RealType>(d.price.value);
    }
    return map;
  }

  @override
  $FoodsTable createAlias(String alias) {
    return $FoodsTable(_db, alias);
  }
}

class CartEntryEntity extends DataClass implements Insertable<CartEntryEntity> {
  final int id;
  final int foodId;
  final String notes;
  CartEntryEntity(
      {@required this.id, @required this.foodId, @required this.notes});
  factory CartEntryEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return CartEntryEntity(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      foodId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}food_id']),
      notes:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}notes']),
    );
  }
  factory CartEntryEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CartEntryEntity(
      id: serializer.fromJson<int>(json['id']),
      foodId: serializer.fromJson<int>(json['foodId']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'foodId': serializer.toJson<int>(foodId),
      'notes': serializer.toJson<String>(notes),
    };
  }

  @override
  CartEntriesCompanion createCompanion(bool nullToAbsent) {
    return CartEntriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      foodId:
          foodId == null && nullToAbsent ? const Value.absent() : Value(foodId),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  CartEntryEntity copyWith({int id, int foodId, String notes}) =>
      CartEntryEntity(
        id: id ?? this.id,
        foodId: foodId ?? this.foodId,
        notes: notes ?? this.notes,
      );
  @override
  String toString() {
    return (StringBuffer('CartEntryEntity(')
          ..write('id: $id, ')
          ..write('foodId: $foodId, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(foodId.hashCode, notes.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is CartEntryEntity &&
          other.id == this.id &&
          other.foodId == this.foodId &&
          other.notes == this.notes);
}

class CartEntriesCompanion extends UpdateCompanion<CartEntryEntity> {
  final Value<int> id;
  final Value<int> foodId;
  final Value<String> notes;
  const CartEntriesCompanion({
    this.id = const Value.absent(),
    this.foodId = const Value.absent(),
    this.notes = const Value.absent(),
  });
  CartEntriesCompanion.insert({
    this.id = const Value.absent(),
    @required int foodId,
    @required String notes,
  })  : foodId = Value(foodId),
        notes = Value(notes);
  CartEntriesCompanion copyWith(
      {Value<int> id, Value<int> foodId, Value<String> notes}) {
    return CartEntriesCompanion(
      id: id ?? this.id,
      foodId: foodId ?? this.foodId,
      notes: notes ?? this.notes,
    );
  }
}

class $CartEntriesTable extends CartEntries
    with TableInfo<$CartEntriesTable, CartEntryEntity> {
  final GeneratedDatabase _db;
  final String _alias;
  $CartEntriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _foodIdMeta = const VerificationMeta('foodId');
  GeneratedIntColumn _foodId;
  @override
  GeneratedIntColumn get foodId => _foodId ??= _constructFoodId();
  GeneratedIntColumn _constructFoodId() {
    return GeneratedIntColumn(
      'food_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  GeneratedTextColumn _notes;
  @override
  GeneratedTextColumn get notes => _notes ??= _constructNotes();
  GeneratedTextColumn _constructNotes() {
    return GeneratedTextColumn(
      'notes',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, foodId, notes];
  @override
  $CartEntriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cart_entries';
  @override
  final String actualTableName = 'cart_entries';
  @override
  VerificationContext validateIntegrity(CartEntriesCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.foodId.present) {
      context.handle(
          _foodIdMeta, foodId.isAcceptableValue(d.foodId.value, _foodIdMeta));
    } else if (isInserting) {
      context.missing(_foodIdMeta);
    }
    if (d.notes.present) {
      context.handle(
          _notesMeta, notes.isAcceptableValue(d.notes.value, _notesMeta));
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartEntryEntity map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return CartEntryEntity.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(CartEntriesCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.foodId.present) {
      map['food_id'] = Variable<int, IntType>(d.foodId.value);
    }
    if (d.notes.present) {
      map['notes'] = Variable<String, StringType>(d.notes.value);
    }
    return map;
  }

  @override
  $CartEntriesTable createAlias(String alias) {
    return $CartEntriesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $FoodsTable _foods;
  $FoodsTable get foods => _foods ??= $FoodsTable(this);
  $CartEntriesTable _cartEntries;
  $CartEntriesTable get cartEntries => _cartEntries ??= $CartEntriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [foods, cartEntries];
}
