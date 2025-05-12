// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

error AfterHours(uint time);

contract ControlStructures {
    /// @notice Retorna "Fizz", "Buzz", "FizzBuzz" ou "Splat" conforme regras clássicas.
    function fizzBuzz(uint _number) public pure returns (string memory) {
        if (_number % 15 == 0) {
            return "FizzBuzz";
        } else if (_number % 3 == 0) {
            return "Fizz";
        } else if (_number % 5 == 0) {
            return "Buzz";
        } else {
            return "Splat";
        }
    }

    /// @notice Controla horários, reverte ou retorna saudações.
    function doNotDisturb(uint _time) public pure returns (string memory) {
        // Panic: condição que só deveria ocorrer em bugs/internos.
        assert(_time < 2400);  // dispara Panic(uint256) se false :contentReference[oaicite:2]{index=2}

        // Horário fora de expediente
        if (_time > 2200 || _time < 800) {
            revert AfterHours(_time);  // custom error :contentReference[oaicite:3]{index=3}
        }

        // Intervalo de almoço
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");  // revert com mensagem :contentReference[oaicite:4]{index=4}
        }

        // Manhã
        if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        }
        // Tarde
        if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        }
        // Noite (1800–2200)
        return "Evening!";
    }
}