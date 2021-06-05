export function getCustomers() {
    fetch("/Customers")
      .then(res => res.json())
      .then(res => this.setState({customers: res}))
      .catch(() => {
        this.setState({error: true})
      })

}

export function getOrdersByCustomerId(id) {

    this.setState({ordersLoading: true})

    fetch("/Orders?customerId=" + id)
      .then(res => res.json())
      .then(res => 
        this.setState({orders: res, ordersLoading: false})
      )
      .catch(() => {
        this.setState({error: true, ordersLoading: false})
      })

}
