import React, { Component } from 'react';
import { GetCustomers } from './GetCustomers'

export class Home extends Component {
  static displayName = Home.name;
  
  render () {
    return (
      <div>
        <h1>Please Select a Customer</h1>
        <GetCustomers />
        

      </div>
    );
  }
}
