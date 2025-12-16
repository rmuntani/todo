
interface ColumnProps {
  columnKey: string,
  title: string,
  tasks: Array<Task>,
  receiveItem: (event: React.DragEvent, key: string) => void,
  reorderColumn: (event: React.DragEvent, task: Task & { column: string }) => void,
  startDrag: (task: Task & { column: string }) => void,
}

export function Column({ column, title, tasks, receiveItem, reorderColumn, startDrag } : ColumnProps) {
	return (
		<div className='item-column' 
			onDragOver={(event) => event.preventDefault()} 
			onDrop={(event) => receiveItem(event, column)}>
			<h1>{title}</h1>
			<hr/>
			<div className='items'>
				{
					tasks.map(({ id, task }) => (
						<div className='item' draggable 
							onDrop={(event) => reorderColumn(event, { id, task, column })} 
							onDragStart={() => startDrag({ id, task, column })}
							key={id}>{task}</div>
					))
				}
			</div>
		</div>
	)

}
