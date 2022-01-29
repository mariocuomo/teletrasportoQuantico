namespace HostPython {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;


    operation Teletrasporto(): Result{

        //crea una coppia di qubit, entrambi nello stato |0>
        use (q1, q2) = (Qubit(), Qubit());   
        
        //per realizzare due qubit entangled si può procedere come segue:
        //si mette in superposition bilanciata il controller e si applica il CNOT
        //lo stato finale è quello di Bell
        H(q1);            
        CNOT(q1, q2);

        //psi è il qubit da teletrasportare, è in superposition bilanciata
        use psi = Qubit();
        H(psi);


        //PASSO 1 - calcolo del primo bit
        CNOT(psi,q1);
        let m1 = M(q1);            

        //PASSO 2 - calcolo del secondo bit
        H(psi);
        let m2 = M(psi);


        //PASSO 3 - decidere quale operatore
        if(m1==One and m2==Zero){
            X(q2);
        }
        if(m1==One and m2==One){
            Y(q2);
        }
        if(m1==Zero and m2==One){
            Z(q2);
        }

        //m3 è il qubit da teletrasportatpo, è in superposition bilanciata
        let m3 = M(q2);
        return m3;
    }
}