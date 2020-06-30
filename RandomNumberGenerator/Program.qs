namespace RandomNumberGenerator {

 
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;

@EntryPoint()
    operation SampleRandomNumber() : Int {
        let min = 40;
        let max = 50;
        Message($"Sampling a random number between 0 and {max}: ");
        return SampleRandomNumberInRange(min, max);
    }

    /// # Summary
    /// Generates a number between min and max values
    /// # Input
    /// ## min
    /// The minimum value of the random number
    /// ## max
    /// The maximum value of the random number 
    /// # Output
    /// Random number in range of (min,max)
    operation SampleRandomNumberInRange(min : Int, max : Int) : Int {
        mutable output = 0; 
        repeat {
            mutable bits = new Result[0]; 
            for (idxBit in 1..BitSizeI(max)) {
                set bits += [GenerateRandomBit()]; 
            }
            set output = ResultArrayAsInt(bits);
        } until (output >= min and output <= max);
        return output;
    }

    /// # Summary
    /// Quantum operation to Generate a random bit
    /// # Output
    /// Measurement result
    operation GenerateRandomBit() : Result {
        //Allocate a qubit
        using (q = Qubit()){
            //Put the qubit in superposition
            H(q);
            // Measure the qubit value.
            return MResetZ(q);
        }
    }
}

