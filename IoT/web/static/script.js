function deploySensor(sensorType) {
    fetch(`/deploy/${sensorType}`, {
        method: 'POST',
    })
    .then(response => response.json())
    .then(data => {
        const responseElement = document.getElementById('response');
        responseElement.className = 'message-box';
        responseElement.style.display = 'block';
        responseElement.innerText = data.message;
        fetchDevices(); // Fetch and display the updated list of devices
    })
    .catch(error => {
        console.error('Error:', error);
        const responseElement = document.getElementById('response');
        responseElement.className = 'message-box';
        responseElement.style.display = 'block';
        responseElement.innerText = 'Error deploying device: ' + error;
        responseElement.style.borderColor = 'red';
        responseElement.style.backgroundColor = 'pink';
        responseElement.style.color = 'darkred';
    });
}


function fetchDevices() {
    fetch('/devices')
        .then(response => response.json())
        .then(devices => {
            const list = devices.map(device =>
                `<li>${device.name} <button onclick="deleteDevice('${device.name}')">Delete</button></li>`
            ).join('');
            document.getElementById('devicesList').innerHTML = `<ul>${list}</ul>`;
        })
        .catch(error => console.error('Error fetching devices:', error));
}

function deleteDevice(name) {
    fetch(`/device/${name}`, { method: 'DELETE' })
        .then(() => fetchDevices())  // Refresh the list after deletion
        .catch(error => console.error('Error deleting device:', error));
}

function deleteAllDevices() {
    fetch('/devices')
        .then(response => response.json())
        .then(devices => {
            const deletePromises = devices.map(device =>
                fetch(`/device/${device.name}`, { method: 'DELETE' })
            );
            Promise.all(deletePromises)
                .then(() => fetchDevices()) // Refresh the list after all deletions
                .catch(error => console.error('Error deleting devices:', error));
        })
        .catch(error => console.error('Error fetching devices for deletion:', error));
}


// Call fetchDevices to load the devices initially
fetchDevices();