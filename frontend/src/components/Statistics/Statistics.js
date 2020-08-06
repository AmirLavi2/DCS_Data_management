import React, { useEffect } from 'react';
import { useState } from 'react';

require('./statistics.css')

function Statistics() {
    const [statistics, setStatistics] = useState([]);
    const statisticsHandler = async () => {
        try {
            const req = await fetch('http://localhost:3002/statistics')
            const { success, data } = await req.json()
            if (success)
            {
                setStatistics(data.map((user) => {
                    return (
                        <tr key={user.id}>
                                <td>{user.player_name}</td>
                                <td>{user.player_score}</td>
                                <td>{user.player_planes_destroyed}</td>
                                <td>{user.ai_planes_destroyed}</td>
                                <td>{user.buildings_destroyed}</td>
                                <td>{user.ships_destroyed}</td>
                                <td>{user.vehicles_destroyed}</td>
                                <td>{user.ejects}</td>
                                <td>{user.crashes}</td>
                        </tr>)
               }))
            }
        }
        catch (err) {
            throw err
        }
    }
    useEffect(() => {
        statisticsHandler()
    }, [])


  return (
      <section>
          <table>
              <thead>
                  <tr>
                    <th>Player Name</th>
                    <th>Player Score</th>
                    <th>PvP kills</th>
                    <th>AI plane kills</th>
                    <th>Buildings Destroyed</th>
                    <th>Ships Destroyed</th>
                    <th>Vehicles Destroyed</th>
                    <th>Ejects</th>
                    <th>Crashes</th>
                  </tr>
              </thead>
              <tbody>
                  {statistics}
              </tbody>
          </table>
      </section>
  );
}

export default Statistics;
