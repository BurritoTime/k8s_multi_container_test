import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import Otherpage from './Otherpage';
import Fib from './Fib';

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <h1 className="App-title">Just a test app...</h1>
            <Link to="/">Home</Link>
            <Link to="/Otherpage">Other Page</Link>
          </header>
          <div>
            <Route exact path="/" component={Fib}/>
            <Route path="/Otherpage" component={Otherpage}/>
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
