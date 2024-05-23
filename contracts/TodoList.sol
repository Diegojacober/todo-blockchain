// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.21;

contract TodoList {
    uint public taskCount = 0;

    constructor() {
        createTask("Checkou app");
    }

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }
}