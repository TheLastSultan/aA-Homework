
console.log("Hello from the JavaScript console!");
$.ajax({
  type: 'GET',
  url: 'http://api.openweathermap.org/data/2.5/weather' +
  	'?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b',
  success(data) {
    console.log("We have your weather!");
    console.log(data);
    let cool = data
    debugger; 
  },
  error() {
    console.error("An error occurred.");
  },
});

// debugger;
console.log("THE AJAX has been dispatched.")


// const $call = console.log("Hello from the JavaScript console!");

// // Your AJAX request here

// $ajax({
//     type: "GET",
//     url: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=" + "825a7720af46aa208bf2f562d8651771", 
//     success (data) {
//         console.log("we have the weather")  
//         console.log(data); 

//     }, 
//     error (){
//         console.log("An error occured."); 
//     }, 
// }); 

// // Add another console log here, outside your AJAX request
