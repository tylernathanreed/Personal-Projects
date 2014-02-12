//* Description *//
// Title: Main
// Author: Tyler Reed
// Runs the Program

//* Class *//
public class Main
{
	//* Main Method *//
	// Runs the Program
	public static void main(String[] args)
	{
		long start = System.currentTimeMillis();

		for(int i = 2; i < 10000; i++)
			PrimeGenerator.isPrime(i);

		long stop = System.currentTimeMillis();

		System.out.println("Time: " + (stop - start));
	}
}
