/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.ejerciciocondicional2;
import java.util.Scanner;

public class EjercicioCondicional2 {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        float monto;
        float descuento;
        float preciofinal;
        System.out.print("ingrese el monto de su compra");
        monto = entrada.nextFloat();
        
        if(monto ==100.00){
            descuento = (float) 0.9;
            preciofinal = (monto * descuento);
        } else {
            descuento = (float) 0.98;
            preciofinal = (monto * descuento);
        }
        System.out.println("Su monto a pagar es de" + preciofinal);
    }
}
