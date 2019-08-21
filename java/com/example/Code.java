package com.example;

public class Code {

    public static void method1() {
        System.out.println("method 1");
    }

    public static void method2() {
        System.out.println("method 2");
    }

    public static void main(String[] args) {
        System.out.println("running main"); // $COVERAGE-IGNORE$
        method1();
        method2();
    }
}
