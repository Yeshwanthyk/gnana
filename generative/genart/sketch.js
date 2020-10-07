const canvasSketch = require("canvas-sketch");

const settings = {
	dimensions: [2048, 2048]
};


const sketch = () => {
	const createGrid = () => {
		const points = [];
		const count = 1;
		for (let x = 0; x < count; x++) {
			for (let y = 0; y < count; y++) {
				// u,v system where the x and y coordinates are between
				// 0 and 1

				const u = count <= 1 ? 0.5 : x / (count - 1);
				const v = count <= 1 ? 0.5 : y / (count - 1);
				points.push([u, v]);
			}
		}

		return points;
	};

	const points = createGrid();

	return ({ context, width, height }) => {
		context.fillStyle = "white";
		context.fillRect(0, 0, width, height);

		points.forEach(([u, v]) => {
			const x = u * width;
			const y = v * height;

			context.beginPath();
			context.arc(x, y, 100, 0, Math.PI * 2, false);
			context.strokeStyle = "black";
			context.lineWidth = 20;
			context.stroke();
		});
	};
};

canvasSketch(sketch, settings);
