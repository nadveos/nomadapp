// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;


contract purchase_confirmation {

    uint public money_to_change;
    address payable public nomada;
    address payable public cash_provider;

    enum state {
        created, locked, release, inactive
    }    

    state public contract_status;

    /// Only the nomada can call this function
    error just_nomada();

    modifier only_nomada() {
        if(msg.sender != nomada){
            revert just_nomada();
        }
        _;
    }


    /// The function cannot be called at the current state.
    error invalid_state();

    modifier in_state( state state_){
        if(contract_status != state_){
            revert invalid_state();
        }
            _;
    }

    function nomada_start_transaction(address payable cripto_seller, uint amount) payable public{
        nomada = payable(cripto_seller);
        money_to_change = amount;
        contract_status = state.created;
    } 

    function transaction_agreement( address payable cripto_buyer, uint amount) payable external {
        require(amount == money_to_change, "you need to have the same colareal");
        cash_provider = payable(cripto_buyer);
        
        contract_status = state.locked;

    }

    function confirm_purchase() external payable {
        
    }

    function pay_cash_provider() external only_nomada() in_state(state.release){
        contract_status = state.inactive;

        cash_provider.transfer(2 * money_to_change);
    }
}