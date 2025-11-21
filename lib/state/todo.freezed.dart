// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToDo {

 DateTime get createdAt; String get id; bool get isDone; String get task;
/// Create a copy of ToDo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToDoCopyWith<ToDo> get copyWith => _$ToDoCopyWithImpl<ToDo>(this as ToDo, _$identity);

  /// Serializes this ToDo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToDo&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.task, task) || other.task == task));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,id,isDone,task);

@override
String toString() {
  return 'ToDo(createdAt: $createdAt, id: $id, isDone: $isDone, task: $task)';
}


}

/// @nodoc
abstract mixin class $ToDoCopyWith<$Res>  {
  factory $ToDoCopyWith(ToDo value, $Res Function(ToDo) _then) = _$ToDoCopyWithImpl;
@useResult
$Res call({
 DateTime createdAt, String id, bool isDone, String task
});




}
/// @nodoc
class _$ToDoCopyWithImpl<$Res>
    implements $ToDoCopyWith<$Res> {
  _$ToDoCopyWithImpl(this._self, this._then);

  final ToDo _self;
  final $Res Function(ToDo) _then;

/// Create a copy of ToDo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = null,Object? id = null,Object? isDone = null,Object? task = null,}) {
  return _then(_self.copyWith(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ToDo].
extension ToDoPatterns on ToDo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToDo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToDo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToDo value)  $default,){
final _that = this;
switch (_that) {
case _ToDo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToDo value)?  $default,){
final _that = this;
switch (_that) {
case _ToDo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime createdAt,  String id,  bool isDone,  String task)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToDo() when $default != null:
return $default(_that.createdAt,_that.id,_that.isDone,_that.task);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime createdAt,  String id,  bool isDone,  String task)  $default,) {final _that = this;
switch (_that) {
case _ToDo():
return $default(_that.createdAt,_that.id,_that.isDone,_that.task);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime createdAt,  String id,  bool isDone,  String task)?  $default,) {final _that = this;
switch (_that) {
case _ToDo() when $default != null:
return $default(_that.createdAt,_that.id,_that.isDone,_that.task);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToDo implements ToDo {
  const _ToDo({required this.createdAt, required this.id, this.isDone = false, this.task = ''});
  factory _ToDo.fromJson(Map<String, dynamic> json) => _$ToDoFromJson(json);

@override final  DateTime createdAt;
@override final  String id;
@override@JsonKey() final  bool isDone;
@override@JsonKey() final  String task;

/// Create a copy of ToDo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToDoCopyWith<_ToDo> get copyWith => __$ToDoCopyWithImpl<_ToDo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToDoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToDo&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.isDone, isDone) || other.isDone == isDone)&&(identical(other.task, task) || other.task == task));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,id,isDone,task);

@override
String toString() {
  return 'ToDo(createdAt: $createdAt, id: $id, isDone: $isDone, task: $task)';
}


}

/// @nodoc
abstract mixin class _$ToDoCopyWith<$Res> implements $ToDoCopyWith<$Res> {
  factory _$ToDoCopyWith(_ToDo value, $Res Function(_ToDo) _then) = __$ToDoCopyWithImpl;
@override @useResult
$Res call({
 DateTime createdAt, String id, bool isDone, String task
});




}
/// @nodoc
class __$ToDoCopyWithImpl<$Res>
    implements _$ToDoCopyWith<$Res> {
  __$ToDoCopyWithImpl(this._self, this._then);

  final _ToDo _self;
  final $Res Function(_ToDo) _then;

/// Create a copy of ToDo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = null,Object? id = null,Object? isDone = null,Object? task = null,}) {
  return _then(_ToDo(
createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
