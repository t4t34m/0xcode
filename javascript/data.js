const button = document.getElementById("buttonClicked")
const CreateAcc = [{ username: 'admin2022', password: 'pass2022' }];
button.onclick = function() {
    fetch("http://127.0.0.1:5000/receiver", {
        method: 'POST',
        headers: {
            'Content-type': 'application/json',
            'Accept': 'application/json'
        },
        body: JSON.stringify(CreateAcc)
    }).then(res => {
        if (res.ok) {
            return res.json()
        } else {
            alert("something is wrong")
        }
    }).then(jsonResponse => {
        console.log(jsonResponse)
    }).catch((err) => console.error(err));
}