import React from 'react';
import { StoreContext } from '../store/store'

export function GetCustomers() {
    const { customers } = React.useContext(StoreContext) 
    return (
        <div>
            { typeof(customers) }
        </div>
    )
}
