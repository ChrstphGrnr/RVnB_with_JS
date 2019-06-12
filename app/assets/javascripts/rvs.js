$(function() {
    console.log('rvs.js is loaded...');
    listenForClick();
});

function listenForClick() {
    $('i.material-icons').on('click', function(e){
        e.preventDefault();
        // debugger
        let id = this.id
        getRv(id);
    });
};

function getRv(id) {
    let rvId = id
    fetch(`http://localhost:3000/rvs/`+ rvId + '.json').then(resp => resp.json()).then(json => newRv(json));  
};

function newRv(data) {
    let myRv = new Rv(data);
    let myRvHtml = myRv.rvHTML();
    document.querySelector('div.top-container').innerHTML = myRvHtml;
    // debugger

};


class Rv {
    constructor(obj){
        this.id = obj.id;
        this.name = obj.name;
        this.sleeps = obj.sleeps;
        this.price = obj.price;
        this.tripCount = obj.trip_count;
        this.trips = obj.trips;
        this.users = obj.users;
    };
};

Rv.prototype.rvHTML = function() {
    // debugger
    return(
    `<img src="/assets/" + ${this.name} + ".jpg" alt="${this.name}" class="responsive-img circle">
    <h3>${this.name}</h3>
    <h6>Sleeps: ${this.sleeps}</h6>
    <h6>Price/Night: $${this.price}</h6>

    
    <br>
    <br>
    `)

}