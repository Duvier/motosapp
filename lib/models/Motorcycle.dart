/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Motorcycle type in your schema. */
@immutable
class Motorcycle extends Model {
  static const classType = const _MotorcycleModelType();
  final String id;
  final String? _name;
  final String? _brand;
  final String? _model;
  final String? _image;
  final int? _cylinderCapacity;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get brand {
    try {
      return _brand!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get model {
    try {
      return _model!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get image {
    return _image;
  }
  
  int get cylinderCapacity {
    try {
      return _cylinderCapacity!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Motorcycle._internal({required this.id, required name, required brand, required model, image, required cylinderCapacity, createdAt, updatedAt}): _name = name, _brand = brand, _model = model, _image = image, _cylinderCapacity = cylinderCapacity, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Motorcycle({String? id, required String name, required String brand, required String model, String? image, required int cylinderCapacity}) {
    return Motorcycle._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      brand: brand,
      model: model,
      image: image,
      cylinderCapacity: cylinderCapacity);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Motorcycle &&
      id == other.id &&
      _name == other._name &&
      _brand == other._brand &&
      _model == other._model &&
      _image == other._image &&
      _cylinderCapacity == other._cylinderCapacity;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Motorcycle {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("brand=" + "$_brand" + ", ");
    buffer.write("model=" + "$_model" + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("cylinderCapacity=" + (_cylinderCapacity != null ? _cylinderCapacity!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Motorcycle copyWith({String? id, String? name, String? brand, String? model, String? image, int? cylinderCapacity}) {
    return Motorcycle._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      image: image ?? this.image,
      cylinderCapacity: cylinderCapacity ?? this.cylinderCapacity);
  }
  
  Motorcycle.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _brand = json['brand'],
      _model = json['model'],
      _image = json['image'],
      _cylinderCapacity = (json['cylinderCapacity'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'brand': _brand, 'model': _model, 'image': _image, 'cylinderCapacity': _cylinderCapacity, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "motorcycle.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField BRAND = QueryField(fieldName: "brand");
  static final QueryField MODEL = QueryField(fieldName: "model");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField CYLINDERCAPACITY = QueryField(fieldName: "cylinderCapacity");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Motorcycle";
    modelSchemaDefinition.pluralName = "Motorcycles";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Motorcycle.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Motorcycle.BRAND,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Motorcycle.MODEL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Motorcycle.IMAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Motorcycle.CYLINDERCAPACITY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _MotorcycleModelType extends ModelType<Motorcycle> {
  const _MotorcycleModelType();
  
  @override
  Motorcycle fromJson(Map<String, dynamic> jsonData) {
    return Motorcycle.fromJson(jsonData);
  }
}