/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.usuariocontrasena;

import java.util.Scanner;

/**
 *
 * @author yahir
 */
public class Usuariocontrasena {

    public static void main(String[] args) {
                Scanner entrada = new Scanner(System.in);
        String usuario;
        String contrasena;
        System.out.print("ingrese el usuario");
        usuario = entrada.nextLine();
        System.out.print("ingrese la contraseña");
        contrasena = entrada.nextLine();
        System.out.println("el usuario " + usuario);
        
        if (    "password".equals(contrasena)){
            if ("Admin".equals(usuario)){
            System.out.println("bienvenido");
        } else {
            System.out.println("intente de nuevo");
    }
}
}
}