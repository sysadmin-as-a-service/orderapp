import React, { Component } from 'react'
import moment from 'moment'

export default class Table extends Component {
    constructor(props) {
        super(props)
    
        this.state = {
             tableContents: props.contents,
             tableHeaders: Object.keys(props.contents[0])
        }
    }
    

    render() {

        function formatTableData(value) {

            // using moment here because manual options are error prone!
            // table will show matching dates in a friendly date format
            if(moment(value, [moment.HTML5_FMT.DATETIME_LOCAL_SECONDS , "YYYY-MM-DD"], true).isValid()){
                var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
                return new Date(value).toLocaleDateString("en-US", options)
            }

            // table will display max 2 digits
            if(typeof(value) === 'number'){
                return Math.round(value * 100) / 100
            }

            return value

        }

        let tableHeadersHTML = this.state.tableHeaders.map((header, index) => (
            <th key={index}>{header}</th>
        ))

        let tableRowsHTML = this.state.tableContents.map((row, index) => (
            <tr key={index}>
                {
                    Object.values(row).map((value, index) => 
                    (
                        <td key={index}>
                            {formatTableData(value)}
                        </td>
                    ))
                }
            </tr>
        ))



        return (
            <div>

                <table>
                    <thead>
                        <tr>
                            {tableHeadersHTML}
                        </tr>
                    </thead>
                    <tbody>
                        {tableRowsHTML}
                    </tbody>
                </table>
            </div>
        )
    }
}
