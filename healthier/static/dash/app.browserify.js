/**
 * Created by lekanterragon on 9/27/17.
 */

'use strict';

let $ = require('jquery');
let React = require('react');

let TestApp = React.createClass({
  render: function() {
    return (
      <div className="page">
        <h1>Oh shit! React works!</h1>
      </div>
    );
  }
});

React.render(
  React.createElement(TestApp, null),
  document.getElementById('content')
);
