namespace HelloQuantumWorld {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    

    /// # Summary
    /// SImple operation showing up a hello world message
    @EntryPoint()
    operation HelloQ() : Unit {
        Message("Hello quantum world!");
    }
}

