import React, { useEffect, useState } from 'react';
import { getStoryIds } from './services/hnApi';

export const App = () => {

	const [storyIds, setStoryIds] = useState([]);

	useEffect( () => {
		getStoryIds().then(data => data && setStoryIds(data))
	}, []);

	return <p>{storyIds}</p>;
};