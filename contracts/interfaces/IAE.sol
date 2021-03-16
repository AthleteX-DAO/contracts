// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.7.4;

interface IAESeason {
    struct Season { bool start; bool active; string year; }

    function isActive (
        
    ) external returns (bool active);
}