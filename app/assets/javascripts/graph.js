
// data is an object literal
const data = {
    'key_1': 10,
    'key_2': 20,
    'key_3': 30,
    'key_4': 40,
    'key_5': 50
}

// we create a nested array of the keys and map them with the values
const listData = d3.keys(data).map(d => [d, data[d]])

console.log(listData)

// just to make this sketch fun 
const sizeScale = d3.scaleLinear()  
    .domain([0, 80])
    .range([   
        'normal 18px/40px Consolas, monaco, monospace', 
        'normal 160px/200px Consolas, monaco, monospace'
    ])

// list them out
listAllData(listData)

function listAllData(_data) {
    const update = d3.select('ul.js-info')
        .selectAll('li')
        .attr('class', 'ml1 mb4')
        .data(_data)
        
    const enter = update.enter()
        .append('li')
        .merge(update)
        .style('font', d => {
            console.log(d[1])
            console.log(sizeScale(d[1]))
            return sizeScale(d[1])
        })
        .html(d => `<span>${d[0]}:</span>  ${d[1]}`)

    update.exit().remove()

}