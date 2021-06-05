import React, { Component } from 'react'

export default class Table extends Component {
    constructor(props) {
        super(props)
    
        this.state = {
             tableContents: props.contents,
             tableHeaders: Object.keys(props.contents[0])
        }
    }
    

    render() {
        return (
            <div>

                <table>
                    <thead>
                        <tr>
                        {
                            this.state.tableHeaders.map((header, index) => (
                                <th key={index}>{header}</th>
                            ))
                        }
                        </tr>
                    </thead>
                    <tbody>
                        {
                            this.state.tableContents.map((row, index) => (
                                <tr key={index}>
                                    {
                                        Object.values(row).map((value, index) => (
                                            <td key={index}>
                                                {value}
                                            </td>
                                        ))
                                    }
                                </tr>
                            ))
                        }
                    </tbody>
                </table>
            </div>
        )
    }
}
