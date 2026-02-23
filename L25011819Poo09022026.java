package com.mycompany.l25011819poo09022026;
import Metodos.JOption;
import TDA.TDA;
import TDA.Mascota;
import TDA.Automovil;
public class L25011819Poo09022026 {
    static String unir = "Contacto Agregado Exitosamente!\n\n";
    public static void main(String[] args) {
        MenuContactos();
        JOption.VerDatos(unir, unir);
    }
    public static void MenuContactos(){
        String Menu = "Agregar Rapido,Agregar Datos Completos,Visualizar,Salir";
        byte op = JOption.BotonOpciones(Menu);

        while(op != 3){
            switch(op){
                case 0:
                    AgregarRapido();
                    JOption.VerDatos("Contacto Rapido", unir);
                    break;

                case 1:
                    AgregarCompleto();
                    JOption.VerDatos("Contacto Completo", unir);
                    break;

                case 2:
                    JOption.VerDatos("Visualizar Datos", unir);
                    break;

                default:
                    JOption.VerDatos("Opcion invalida", "");
            }
            op = JOption.BotonOpciones(Menu);
        }
    }

    public static void AgregarRapido(){
        TDA obj = new TDA();
        obj.setNomContacto(JOption.LecturaString("Nombre del Contacto"));
        obj.setNumContacto(JOption.LecturaString("Numero del Contacto"));

        unir += "\n Nombre: " + obj.getNomContacto() +
                "\n Numero de Telefono: " + obj.getNumContacto() +
                "\n----------------------------------";
    }

    public static void AgregarCompleto(){
        TDA obj = new TDA();
        obj.setNomContacto(JOption.LecturaString("Nombre del Contacto"));
        obj.setNumContacto(JOption.LecturaString("Numero del Contacto"));
        obj.setEmail(JOption.ValidaEmail());

        unir += "\n Nombre: " + obj.getNomContacto() +
                "\n Numero de Telefono: " + obj.getNumContacto() +
                "\n Email: " + obj.getEmail() +
                "\n----------------------------------";
    }

    public static void MenuMascotas(){
        // aquí irá tu menú de mascotas después
    }
}