String? validateInputRequired(dynamic value, String field){
  if (value == null || value.isEmpty) return 'El campo $field no puede ir vacío';
  return null;
}
String? validateInputNumber(dynamic value, String field){
  try {
    int.parse(value);
    return null;
  } catch (e) {
    return 'El campo $field debe ser un número entero';
  }
}