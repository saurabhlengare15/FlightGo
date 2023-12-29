package com.flightbooking.model;

public class Sample {

	static int a = 10;

	public int getA() {
		return a;
	}

//	public void setA() {
//		this.a = a + 5;
//	}

	public void print() {
		System.out.println(a);
	}

	public static void main(String[] args) {
		Sample s1 = new Sample();
		Sample.a = a+5;
//		s1.setA();
		s1.print();
		Sample s2 = new Sample();
		s2.print();
		Sample s3 = new Sample();
		Sample.a = a+5;
		s3.print();

	}

}
