var helloWorld = "Hello World!"

function getFullname(firstname, lastname) {
    return firstname + " " + lastname;
}

function maxMinAverage(values) {
    var max = Math.max.apply(null, values);
    var min = Math.min.apply(null, values);
    var average = null;
       if (values.length > 0) {
           var sum = 0;
           for (var i=0; i < values.length; i++) {
               sum += values[i];
           }
    
           average = sum / values.length;
       }
 
    return {
        "max": max,
        "min": min,
        "average": average
    };
}
