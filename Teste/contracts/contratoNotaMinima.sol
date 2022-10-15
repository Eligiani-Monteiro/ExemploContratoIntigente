// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

struct Solicitante {
    address pessoa1;
    string nome;
    bool terminar;
}
struct Solicitado {
    address pessoa2;
    string nome;
    bool aceitar;
}

contract ContratoNotaMinima{
    Solicitado public Pessoa2;
    Solicitante public Pessoa1;
    uint256 dataAssinatura;
    string public objectContrato;
    uint256 public notaMinima;

    constructor(
        address solicitado,
        string memory professor,
        string memory objeto,
        uint256 notaRequerida,
        string memory solicitante
    ) {
        require(notaRequerida >= 3.0, "Somente  nota maior que tres");
        notaMinima = notaRequerida;
        Pessoa1. nome = solicitante;
        Pessoa2.pessoa2= solicitado;
        Pessoa2.nome = professor;
        dataAssinatura = block.timestamp;
        objectContrato = objeto;
        Pessoa1.pessoa1 = msg.sender;
    }

    function tempoContratoNota() public view returns (uint) {
        return block.timestamp;
    }

    function Aceitar() public {
        require(
            msg.sender == Pessoa2.pessoa2,
            "Voce tem uma solicitacao"
        );
        Pessoa2.aceitar = true;
    }

    function terminarContrato() public {
        require(
            msg.sender == Pessoa2.pessoa2 ||
                msg.sender == Pessoa1.pessoa1, "Voce nao pode retirar a nota que nao deu kkkk");
        Pessoa2.aceitar = false;
        Pessoa1.terminar = false;
    }

    function Quemtapedindo() public view returns (string memory, address) {
        return (Pessoa1.nome, Pessoa1.pessoa1);
    }
}
