/*React dependencies and modules*/
import React from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom'
/*styles*/
import './layout.css';
/*components*/
import Navbar from '../Navbar/Navbar';
import Statistics from '../Statistics/Statistics';

function Layout() {
  return (
      <BrowserRouter>
          <header>
              <div className="header">
                  <h1> DCS RELATED VIDEO</h1>
                  <strong>(in loop)</strong>
              </div>
              <Navbar />
          </header>
          <Switch>
              <Route path="/statistics">
                <Statistics />
              </Route>
          </Switch>    
          <footer />
    </BrowserRouter>
  );
}

export default Layout;
