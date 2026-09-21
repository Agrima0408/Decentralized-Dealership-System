// a record of how many cars each buyer owns for each Sonet model

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.31;
contract kiaSonet{

    address public owner;

    enum model {HTE, HTK, HTK_PLUS, HTX,
HTX_PLUS,GTX_PLUS,X_LINE}

    struct Sonet {

        uint price;

        uint stock;

    }

    mapping( model => Sonet) public sonets;

    //a record of how many cars each buyer owns
for each Sonet model

    mapping(address => mapping(model =>
uint)) public buyer;

    constructor(){

        owner=msg.sender;

        sonets[model.HTE] = Sonet(8
ether , 20);

        sonets[model.HTK] = Sonet(9
ether , 20);

        sonets[model.HTK_PLUS] =
Sonet(10 ether , 40);

        sonets[model.HTX] = Sonet(11
ether , 30);

        sonets[model.HTX_PLUS] =
Sonet(13 ether , 35);

        sonets[model.GTX_PLUS] =
Sonet(14 ether , 10);

        sonets[model.X_LINE] = Sonet(15
ether , 15);

    }

    modifier onlyOwner (){

        require(msg.sender == owner ,
"Only Owner is allowed");

        _;

    }

    function restock (model _model,uint amount)
public onlyOwner{

        sonets[_model].stock += amount;

    }

    function purchase (model _model, uint amount)
public payable{

        require (msg.value >=
sonets[_model].price* amount , "you need to pay the required amount
first");

        require (sonets[_model].stock
>= amount, "insufficient cars in the stock");

        sonets[_model].stock -= amount;

       
buyer[msg.sender][_model]+=amount;

    }

    function checkStock (model _model) public view
returns (uint){

        return sonets[_model].stock;

    }

}
