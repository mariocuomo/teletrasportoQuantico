import qsharp
from HostPython import Teletrasporto

count = 0
for i in range(100):
    count = count + int(str(Teletrasporto.simulate()))

print("eseguendo 100 volte il teletrasporto di un qubit psi in superposition bilanciata e misurandolo, si è ottenuto il valore 1 " + str(count) +" volte")