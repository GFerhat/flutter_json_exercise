// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ToDoList implements DiagnosticableTreeMixin {

 List<ToDo> get tasks;
/// Create a copy of ToDoList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToDoListCopyWith<ToDoList> get copyWith => _$ToDoListCopyWithImpl<ToDoList>(this as ToDoList, _$identity);

  /// Serializes this ToDoList to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ToDoList'))
    ..add(DiagnosticsProperty('tasks', tasks));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToDoList&&const DeepCollectionEquality().equals(other.tasks, tasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tasks));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ToDoList(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $ToDoListCopyWith<$Res>  {
  factory $ToDoListCopyWith(ToDoList value, $Res Function(ToDoList) _then) = _$ToDoListCopyWithImpl;
@useResult
$Res call({
 List<ToDo> tasks
});




}
/// @nodoc
class _$ToDoListCopyWithImpl<$Res>
    implements $ToDoListCopyWith<$Res> {
  _$ToDoListCopyWithImpl(this._self, this._then);

  final ToDoList _self;
  final $Res Function(ToDoList) _then;

/// Create a copy of ToDoList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tasks = null,}) {
  return _then(_self.copyWith(
tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<ToDo>,
  ));
}

}


/// Adds pattern-matching-related methods to [ToDoList].
extension ToDoListPatterns on ToDoList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToDoList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToDoList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToDoList value)  $default,){
final _that = this;
switch (_that) {
case _ToDoList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToDoList value)?  $default,){
final _that = this;
switch (_that) {
case _ToDoList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ToDo> tasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToDoList() when $default != null:
return $default(_that.tasks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ToDo> tasks)  $default,) {final _that = this;
switch (_that) {
case _ToDoList():
return $default(_that.tasks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ToDo> tasks)?  $default,) {final _that = this;
switch (_that) {
case _ToDoList() when $default != null:
return $default(_that.tasks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ToDoList extends ToDoList with DiagnosticableTreeMixin {
  const _ToDoList({final  List<ToDo> tasks = const []}): _tasks = tasks,super._();
  factory _ToDoList.fromJson(Map<String, dynamic> json) => _$ToDoListFromJson(json);

 final  List<ToDo> _tasks;
@override@JsonKey() List<ToDo> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of ToDoList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToDoListCopyWith<_ToDoList> get copyWith => __$ToDoListCopyWithImpl<_ToDoList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ToDoListToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ToDoList'))
    ..add(DiagnosticsProperty('tasks', tasks));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToDoList&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ToDoList(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$ToDoListCopyWith<$Res> implements $ToDoListCopyWith<$Res> {
  factory _$ToDoListCopyWith(_ToDoList value, $Res Function(_ToDoList) _then) = __$ToDoListCopyWithImpl;
@override @useResult
$Res call({
 List<ToDo> tasks
});




}
/// @nodoc
class __$ToDoListCopyWithImpl<$Res>
    implements _$ToDoListCopyWith<$Res> {
  __$ToDoListCopyWithImpl(this._self, this._then);

  final _ToDoList _self;
  final $Res Function(_ToDoList) _then;

/// Create a copy of ToDoList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tasks = null,}) {
  return _then(_ToDoList(
tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<ToDo>,
  ));
}


}

// dart format on
