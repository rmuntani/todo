import "./App.css";
import { Column } from "./components/Column";
import { useState, useEffect } from "react";

// I had to Google for this lib https://www.npmjs.com/package/react-confetti
import Confetti from "react-confetti";

// I had to Google how to implement drag and drop and found out https://developer.mozilla.org/en-US/docs/Web/API/HTML_Drag_and_Drop_API,
// which I used as a reference.

interface Tasks {
	todos: Array<Task>;
	doing: Array<Task>;
	done: Array<Task>;
}

interface Task {
	id: number;
	task: string;
}

interface ColumnTypes {
	column: "todos" | "doing" | "done" | null;
}

type DraggedItem = Task & ColumnTypes;

function App() {
	const [tasks, updateTasks] = useState<Tasks>({
		todos: [],
		doing: [],
		done: [],
	});
	const [dragged, dragItem] = useState<DraggedItem>({ task: "", column: null });
	const [confettiEnabled, enableConfetti] = useState<bool>(false);

	useEffect(() => {
		const timer = setTimeout(() => enableConfetti(false), 5000);

		return () => clearTimeout(timer);
	}, [confettiEnabled]);

	const totalItems = () =>
		tasks.todos.length + tasks.doing.length + tasks.done.length;
	const addTodo = (event) => {
		const newTodo: string | null = event.target.todo.value;
		event.preventDefault();

		if (newTodo !== "") {
			const taskId = totalItems() + 1;
			updateTasks({
				...tasks,
				todos: [...tasks.todos, { task: newTodo, id: taskId }],
			});

			event.target.todo.value = "";
		}
	};

	const startDrag = (item: DraggedItem) => {
		dragItem(item);
	};

	const receiveItem = (newColumn: string) => {
		const { task, column, id } = dragged;

		if (newColumn === column) return;

		const removeFrom = tasks[column];
		const addTo = tasks[newColumn];
		const newState = {
			...tasks,
			[column]: removeFrom.filter(({ id: taskId }) => taskId !== id),
			[newColumn]: [...addTo, { task, id }],
		};

		updateTasks(newState);
		if (newColumn === "done") {
			enableConfetti(true);
		}
		dragItem({ task: "", column: null, id: 0 });
	};

	const reorderColumn = (target) => {
		const { column: targetColumn, id: targetId } = target;
		const { task, column, id } = dragged;

		if (column !== targetColumn) return;

		const targetIndex = tasks[column].findIndex((elem) => elem.id === targetId);
		const updatedColumn = tasks[column].filter(
			({ id: taskId }) => taskId !== id,
		);

		updatedColumn.splice(targetIndex, 0, { task, id });

		updateTasks({
			...tasks,
			[column]: updatedColumn,
		});
		dragItem({ task: "", column: null, id: 0 });
	};

	return (
		<>
			<section className="tasks">
				{confettiEnabled ? <Confetti /> : null}
				<Column
					column="todos"
					title="To do"
					tasks={tasks.todos}
					receiveItem={receiveItem}
					reorderColumn={reorderColumn}
					startDrag={startDrag}
				/>

				<Column
					column="doing"
					title="Doing"
					tasks={tasks.doing}
					receiveItem={receiveItem}
					reorderColumn={reorderColumn}
					startDrag={startDrag}
				/>

				<Column
					column="done"
					title="Done"
					tasks={tasks.done}
					receiveItem={receiveItem}
					reorderColumn={reorderColumn}
					startDrag={startDrag}
				/>
			</section>

			<section className="form">
				<form onSubmit={addTodo}>
					<textarea name="todo" />
					<button type="submit">Add</button>
				</form>
			</section>
		</>
	);
}

export default App;
