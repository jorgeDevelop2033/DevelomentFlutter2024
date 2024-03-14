class Role {
  int idRoles;
  String nombre;
  String tipoRol;
  dynamic routes;

  Role({
    required this.idRoles,
    required this.nombre,
    required this.tipoRol,
    required this.routes,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        idRoles: json["IdRoles"],
        nombre: json["Nombre"],
        tipoRol: json["TipoRol"],
        routes: json["Routes"],
      );

  Map<String, dynamic> toJson() => {
        "IdRoles": idRoles,
        "Nombre": nombre,
        "TipoRol": tipoRol,
        "Routes": routes,
      };
}
