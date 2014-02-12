//* Description *//
// Title: Prime Generator
// Author: Tyler Reed
// Generates Prime Numbers using various Methods

//* Libraries *//
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

//* Class *//
public class PrimeGenerator
{
	//* Class Variables *//
	private static List<Integer> primes = new Vector<Integer>();

	//* Prime Methods *//
	// Returns whether or not the specified Number is Prime
	public static boolean isPrime(int prime)
	{
		int log = (int) Math.log10(prime);

		if(isPower(prime))
			return false;

		while()
	
		if(primes.contains(prime))
			return true;

		//int sqrt = (int) (Math.sqrt(prime) + 1);
		for(int i = 0; i < primes.size(); i++)
			if(prime % primes.get(i) == 0)
				return false;

		//System.out.println("Prime Found: " + prime);
		primes.add(prime);
		return true;
	}

	// Returns whether or not the specified Number is a Power
	public static boolean isPower(int power)
	{
		int log = (int) Math.log10(power);

		for(int i = 2; i < log; i++)
			if(isPowerOf(power, i))
				return true;

		return false;
	}

	// Returns whether or not the specified Number is a Power of another Number
	public static boolean isPowerOf(int power, int base)
	{
		int log = (int) Math.log10(power);
		int i = log/base;

		int power1 = (int) Math.pow(10, i - 1);
		int power2 = (int) Math.pow(10, i) - 1;

		while(power1 <= power2)
		{
			int average = (power1 + power2)/2;
			int power3 = (int) Math.pow(average, base);

			if(power3 < power)
				power1 = average + 1;
			else if(power3 > power)
				power2 = average - 1;
			else // power3 == power
				return true;
		}

		return false;
	}
}
