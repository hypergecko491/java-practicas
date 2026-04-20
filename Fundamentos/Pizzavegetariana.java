/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.pizzavegetariana;
import java.util.Scanner;
/**
 *
 * @author yahir
 */
public class Pizzavegetariana {
    public static void main(String[] args) {
        String Vegetariana;
        String Ingrediente;
        Scanner entrada = new Scanner(System.in);
        System.out.println("desea una pizza vegetariana?");
        Vegetariana = entrada.nextLine();
        if("si".equals(Vegetariana)){
            System.out.println("que ingrediente desea añadir?[t = tofu, p = piniento]");
            Ingrediente = entrada.nextLine();
            if("t".equals(Ingrediente)){
                System.out.println(" su pizza es vegetariana e incluye los ingredientes: tomate, mozarella y tofu");
            } else if("p".equals(Ingrediente)){
                System.out.println(" su pizza es vegetariana e incluye los ingredientes: tomate, mozarella y pimiento");
            }
        }else{
            System.out.println("que ingrediente desea añadir?[p = peperoni, j = jamon, s = salmon]");
            Ingrediente = entrada.nextLine();
            if("p".equals(Ingrediente)){
                System.out.println(" su pizza no es vegetariana e incluye los ingredientes: tomate, mozarella y peperoni");
            }else if("j".equals(Ingrediente)){
                System.out.println(" su pizza no es vegetariana e incluye los ingredientes: tomate, mozarella y jamon");
            }else if("s".equals(Ingrediente)){
                System.out.println(" su pizza no es vegetariana e incluye los ingredientes: tomate, mozarella y salmon");
            }
            
        }
    }
}
