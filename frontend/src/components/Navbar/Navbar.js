import React from 'react';
import { NavLink } from 'react-router-dom';

require('./navbar.css');

function Navbar() {
  return (
      <nav>
          <ul>
              <li><NavLink to="#">Lorem</NavLink></li>
              <li><NavLink to="#">IpsumM</NavLink></li>
              <li><NavLink to="#">Lorem</NavLink></li>
              <li><NavLink to="#">IpsumM</NavLink></li>
          </ul>
      </nav>
  );
}

export default Navbar;
