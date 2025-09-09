object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuadoDeFrutas {
    const property listaNutrientes = []

    method rendimiento(cantidad) {
      return listaNutrientes.sum() * 1.max(cantidad.div(1000))
      /*En caso de necesitar transformar los valores de la lista en numericos
      (ej, si la lista fuese de frutas), le agrego dentro del sum una funcion
      lambda para acceder a los nutrientes de cada elemento/fruta

      return listaNutrientes.sum({unaFruta => unaFruta.nutrientes()})

      Allí, accede al nutriente de la fruta y lo suma
      */
    }

    method agregarNutriente(nutriente) {
      listaNutrientes.add(nutriente)
    }
}

object jugo {
    var bebida = wisky

    method mezclarCon(unaBebida) {
      bebida = unaBebida
    }
    
    method rendimiento(cantidad) {
      return 1 + bebida.rendimiento(cantidad) / 4
    }
}

object coctel {
  const composicion = #{}
  

  method agregarBebida(unaBebida) {
    composicion.add(unaBebida)
  }

  method rendimiento(cantidad) {
    var total = 1
    composicion.forEach({unaBebida => total = total * unaBebida.rendimiento(cantidad/composicion.size() )})
    return total
    /*Se puede hacer esto ya que la variable "total" es parte del metodo
    y no estamos modificando nada del objeto coctel
    */
  }
}