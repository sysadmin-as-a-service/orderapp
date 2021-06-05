import React, { Component } from 'react'

export class Customers extends Component {
    constructor(props) {
        super(props)
    
        this.state = {
             customers: [],
             loading: true
        }
    }
    
    componentDidMount() {
        this.getCustomers()
    }
    

    render() {
        return (
            <div>
                {this.state.customers.map(customer =>
                    <div>{customer.name}</div>
                )}
            </div>
        )
    }

    async getCustomers() {
        const response = await fetch('/Customers')
        const data = await response.json();
        this.setState({ customers: data, loading: false });
    }

}
