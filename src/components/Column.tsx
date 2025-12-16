export interface Task {
	id: number;
	task: string;
}

export type ColumnType = "todos" | "doing" | "done";

export type DraggedItem = Task & { column: ColumnType };

interface ColumnProps {
	column: ColumnType;
	title: string;
	tasks: Array<Task>;
	receiveItem: (key: ColumnType) => void;
	reorderColumn: (item: DraggedItem) => void;
	startDrag: (item: DraggedItem) => void;
}

export function Column({
	column,
	title,
	tasks,
	receiveItem,
	reorderColumn,
	startDrag,
}: ColumnProps) {
	return (
		<div
			className="item-column"
			onDragOver={(event) => event.preventDefault()}
			onDrop={() => receiveItem(column)}
		>
			<h1>{title}</h1>
			<hr />
			<div className="items">
				{tasks.map(({ id, task }) => (
					<div
						className="item"
						draggable
						onDrop={() => reorderColumn({ id, task, column })}
						onDragStart={() => startDrag({ id, task, column })}
						key={id}
					>
						{task}
					</div>
				))}
			</div>
		</div>
	);
}
