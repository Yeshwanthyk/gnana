package week1

object session {
		
		def	sqrt(x: Double) = {

     	def sqrtIter(guess: Double, x: Double): Double =
        	 if (isGoodEnough(guess,x)) guess
      	   else sqrtIter(improve(guess, x), x)

    	def isGoodEnough(guess: Double, x: Double) =
      	  Math.abs(guess * guess - x) < 0.001

    	def improve(guess: Double, x: Double) =
  	      (guess + x / guess) / 2
        
	    sqrtIter(1.0, x)
    
    }                                             //> sqrt: (x: Double)Double

    sqrt(4)                                       //> res0: Double = 2.0000000929222947
    
}