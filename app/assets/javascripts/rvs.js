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
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
    // debugger
    // listenForSecondClick(myRvHtml);
};


class Rv {
    constructor(obj){
        // debugger
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
        
    `<div class="col s12">
        <div name="show-container" class="card teal lighten-3 z-depth-5">
        <img src="/assets/${this.name}.jpg" alt="${this.name}" class="responsive-img circle">
        <center><h3>${this.name}</h3>
        <h6>Sleeps: ${this.sleeps}</h6>
        <h6>Price/Night: $${this.price}</h6></center>
        <br>
        <br>
        <center>
            <p> <button onclick="showTripsForm(${this.id})" name="trips" class="btn waves-effect waves-light z-depth-5">Trips<i class="material-icons left">airplanemode_active</i></button>
                <button onclick="createNewTripForm(${this.id})" name="new-trip" class="btn waves-effect waves-light z-depth-5">New Trip<i class="material-icons right">card_travel</i></button>
        </center>
        <br>
        <br>
        </div>
    </div>
    
    <br>
    <br>
    `);

};



function createNewTripForm(id) {
    debugger;
    var rvId = id
    var formHTML = (`
    <form name="newTrip">
      <div class="container">  
      <input type="hidden" name="rvid" value="${rvId}">
      <p>Trip Name: <input type="text" name="tname"></p>
      <p># of guests: <input type="text" name="tguests"></p>
      <p>Start Date: <input type="date" name="tstartdate"></p>
      <p>End Date: <input type="date" name="tenddate"></p>
      <p><input id="new_trip_submit" type="submit" value="Submit"></p>
      </div>
    </form>`);
    $('[name="show-container"]').append(formHTML);
    listenForSecondClick();
};

function listenForSecondClick() {
    // debugger
    $('#new_trip_submit').on('click', function(event){
        event.preventDefault();
        validateTrip();        
    })
}

function validateTrip() {
    //    debugger
    var tripName = document.forms['newTrip']['tname'].value;
    var tripGuests = document.forms['newTrip']['tguests'].value;
    var tripStartDate = document.forms['newTrip']['tstartdate'].value;
    var tripEndDate = document.forms['newTrip']['tenddate'].value;
    var tripRvId = document.forms['newTrip']['rvid'].value;
    var newTrip = {name: tripName, guests: tripGuests, start_date: tripStartDate, end_date: tripEndDate, rv_id: tripRvId}
    // debugger
    fetch('http://localhost:3000/trips', {
        method: 'POST', 
        body: JSON.stringify(newTrip),
        headers: {
            'Content-Type': 'application/json'
        } 
    }).then(resp => resp.json()).then(json => console.log(json));  
};

class Trip {
    constructor(obj) {
        this.name = obj.name;
        this.guests = obj.guests;
        this.startDate = obj.start_date;
        this.endDate = obj.end_date;

    }
}




function showTripsForm(id) {
    debugger
}