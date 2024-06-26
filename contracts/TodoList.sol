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

    // like a Map<> in java
    mapping(uint => Task) public tasks;

    event TaskCreated(uint id, string content, bool completed);

    event TaskCompleted(
        uint id,
        bool completed
    );

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}
