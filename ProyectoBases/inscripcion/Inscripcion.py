class Inscripcion():
    def __init__(self, request):
        self.request = request
        self.session = request.session
        if "inscripcion" not in self.session:
            self.session["inscripcion"] = {}
        self.inscripcion = self.session["inscripcion"]


    def agregar(self, inscripcion, grupo):
        inscripcion =   str(inscripcion)
        if (inscripcion not in self.inscripcion.keys()):
            self.inscripcion[inscripcion] = [grupo]
        elif (grupo not in self.inscripcion.get(inscripcion)):
            self.inscripcion[inscripcion].append(grupo)
            
        self.guardar_inscripcion()


    def guardar_inscripcion(self):
        self.session["inscripcion"] = self.inscripcion
        self.session.modified = True

    def eliminar_grupo(self, inscripcion, grupo):
        for key, value in list(self.inscripcion.items()):
            if grupo in value:
                value.remove(grupo)
            if not value:  # Verificar si la lista está vacía
                del self.inscripcion[key]  # Eliminar el diccionario completo

        self.guardar_inscripcion()
                
