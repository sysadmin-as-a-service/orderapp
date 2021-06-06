import React, { Component } from 'react';
import Table from './Table';
import { getCustomers, getOrdersByCustomerId } from '../store/storeutil'

export class Home extends Component {
  constructor(props) {
    super(props)

    this.state = {
       customers: [],
       selectedCustomerId: '',
       orders: [],
       ordersLoading: false,
       error: false
    }

    this.handleChange = this.handleChange.bind(this)
    this.getCustomers = getCustomers.bind(this)
    this.getOrdersByCustomerId = getOrdersByCustomerId.bind(this)

  }
  
  static displayName = Home.name;

  
  componentDidMount() {

    this.getCustomers()

  }
  
  handleChange(event) {
    
    this.setState({selectedCustomerId: event.target.value})
    this.setState({orders: this.getOrdersByCustomerId(event.target.value)})

  }

  render () {

    return (
      <div>


        <h1>Please Select a Customer</h1>

        <select onChange={this.handleChange}>
          <option selected disabled hidden>(Select a customer)</option>

          {this.state.customers.map((customer, index) => (
            <option key={index} value={customer.id}>{customer.name}</option>
          )) 
          }

        </select>

        {
          this.state.selectedCustomerId != '' && !this.state.ordersLoading && !this.state.error &&
          <Table contents={this.state.orders.map(order => (

              { 
                "Customer": order.customer.name,
                "Order Date": order.date,
                "Order Reference": order.reference,
                "Order Quantity": order.orderItems.reduce((a, b) => a + b.quantity, 0)

              }
            ) 
            )} />
        }

        {
          this.state.ordersLoading &&
          <div>Loading orders...</div>
        }

      </div>
    );
  }

  

}


