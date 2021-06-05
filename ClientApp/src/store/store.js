import React, { useState } from 'react'

export const StoreContext = React.createContext(null)

export default ({ children }) => {
    const [customers, setCustomers] = useState(['sarah','john','bill']);
    const [orders, setOrders] = useState('');
    const [orderItems, setOrderItems] = useState('');
    const [products, setProducts] = useState('');
    const [invoices, setInvoices] = useState('');

    const store = {
        customers: [customers, setCustomers],
        orders: [orders, setOrders],
        orderItems: [orderItems, setOrderItems],
        products: [products, setProducts],
        invoices: [invoices, setInvoices]
    }

    return(
        <StoreContext.Provider value={store}>
            {children}
        </StoreContext.Provider>
    )

    

}
