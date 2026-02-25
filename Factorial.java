package com.mycompany.factorial;
import java.util.Scanner;
public class Factorial {
 public static long factorial(int n) {
        long resultado = 1;
        for(int i = n; i > 0; i--) {
            resultado *= i;
        }
        return resultado;
    }
    

    public static void main(String[] args) {
  Scanner entrada = new Scanner(System.in);

        System.out.print("Introduce un número para calcular su factorial: ");
        int numero = entrada.nextInt();

        System.out.println("El factorial de " + numero + " es: " + factorial(numero));
}
}
