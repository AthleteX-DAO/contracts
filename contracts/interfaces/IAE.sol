// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

interface IAESeason {
    struct Season { bool start; bool active; string year; }

    function isActive (

    ) external returns (bool active);
}