// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;


contract purchase_confirmation {

    uint public value1;
    address payable public nomada;
    address payable public cash_provider;

    enum state {
        created, locked, release, inactive
    }    

    state public contract_status;

    function nomada_start_transaction(address payable cripto_seller, uint amount) payable public{
        nomada = payable(cripto_seller);
        value1 = amount;
        contract_status = state.created;
    } 

    function transaction_agreement( address payable cripto_buyer, uint amount) payable external {
        require(amount == value1, "you need to have the same colareal");
        cash_provider = payable(cripto_buyer);
        
        contract_status = state.locked;

    }

    function confirm_purchase() external payable {
        
    }
}