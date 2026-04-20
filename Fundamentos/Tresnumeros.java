/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.tresnumeros;
import java.util.Scanner;
/**
 *
 * @author yahir
 */
public class Tresnumeros {

    public static void main(String[] args) {
        Scanner entrada = new Scanner(System.in);
        int n1;
        int n2;
        int n3;
        System.out.println("ingrese un primer numero");
        n1 = entrada.nextInt();
        System.out.println("ingrese un segundo numero");
        n2 = entrada.nextInt();
        System.out.println("ingrese un tercer numero");
        n3 = entrada.nextInt();
        
        if(n1 <= n2 && n2 <= n3){
            System.out.println("los numeros en orden creciente");
        
        }else{
            System.out.println("los numeros no estan creciente");
        }
    }
}
