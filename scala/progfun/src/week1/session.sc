package week1

object session {
		
		def	sqrt(x: Double) = {

     	def sqrtIter(guess: Double) : Double =
        	 if (isGoodEnough(guess)) guess
      	   else sqrtIter(improve(guess))

    	def isGoodEnough(guess: Double) =
      	  Math.abs(guess * guess - x) < 0.001

    	def improve(guess: Double) =
  	      (guess + x / guess) / 2
        
	    sqrtIter(1.0)
    
    }                                             //> sqrt: (x: Double)Double
    
    // Calls itself.. So tail recursive call so uses
    // constant stack frame
    def gcd(a: Int, b: Int): Int =
    	if (b == 0) a else gcd(b, a % b)          //> gcd: (a: Int, b: Int)Int

		// Not tail-recursive
		def factorial(n: Int): Int =
			if (n == 0) 1 else n * factorial(n-1)
                                                  //> factorial: (n: Int)Int
				
    sqrt(4)                                       //> res0: Double = 2.0000000929222947
    
    gcd(14,21)                                    //> res1: Int = 7
    
    factorial(5)                                  //> res2: Int = 120
    
}