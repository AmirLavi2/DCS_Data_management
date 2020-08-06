if (process.env.NODE_ENV !== 'production') {
	require('./modules/env/envConfig');
}

const cors = require('cors');
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

const { player_summary } = require('./modules/dbConnections')

app.use(cors({
	origin: 'http://localhost:3000',
	optionsSuccessStatus: 200}))

app.route('/statistics')
	.get((req, res) => {
		player_summary((mysqlData) => {
			res.json({ success: true, data: mysqlData });
		})
	})

//app.route('/registration')
//	.get((req, res) => {
//		console.log('reg')
//		res.json('success')
//	})

app.listen(port, () => { console.log(`app listening on port ${port}`) });
