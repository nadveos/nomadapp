// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;


contract purchase_confirmation {

    uint private password;
    uint public money_to_change;
    address payable public nomada;
    address payable public cash_provider;


    enum state {
        created, locked, release, inactive
    }    

    state public contract_status;

    constructor(uint _password) payable {
        nomada = payable(msg.sender);
        password = _password;
        contract_status = state.created;
    }

    /// The function cannot be called at the current state.
    error invalid_state();

    /// Only the cash provider can call this function
    error just_cash_provider();

    /// Only the nomada can call this function
    error just_nomada();

    modifier only_nomada() {
        if(msg.sender != nomada){
            revert just_nomada();
        }
        _;
    }

    modifier only_cash_provider() {
        if(msg.sender != cash_provider){
            revert just_cash_provider();
        }
        _;
    }

    modifier in_state( state state_){
        if(contract_status != state_){
            revert invalid_state();
        }
            _;
    }

    function cash_provider_confirm_transaction() external in_state(state.locked) only_cash_provider payable {
        
        require(msg.value == money_to_change, "Please send the same amount that the nomada, to do change");
        
        cash_provider = payable(msg.sender);
        
        contract_status = state.locked;
    }

    function confirm_received(uint _password) external only_cash_provider() in_state(state.locked) {
        // this funtion returns the deposit that 
        // the cash_provider made to have a colateral
        require(_password == password, "You need to enter the password that the nomada set up to release your funds"); 
        cash_provider.transfer(2 * money_to_change);
        contract_status = state.release;
    }


    function abort() external in_state(state.release) {
        contract_status = state.inactive;

        nomada.transfer(address(this).balance/2);
        cash_provider.transfer(address(this).balance/2);
    }


}
