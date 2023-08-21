const animeTiles = document.getElementsByClassName("anime-entry");

for (let i = 0; i < animeTiles.length; i++) {
    const statusElem = animeTiles[i].getElementsByClassName("anime-status")[0];
    const status = statusElem.textContent.trim().toLowerCase();
    console.log(status);
    if (status === "completed") {
        animeTiles[i].style.backgroundColor = "#c6ebf7";
    } else if (status === "watching") {
        animeTiles[i].style.backgroundColor = "#baffba";
    } else if (status === "on-hold") {
        animeTiles[i].style.backgroundColor = "lightyellow";
    } else if (status === "dropped") {
        animeTiles[i].style.backgroundColor = "#f7b7b7";
    } else if (status === "plan to watch") {
        animeTiles[i].style.backgroundColor = "lavender";
    }
}

const animeContainer = document.querySelector(".anime-list");

// Get all anime entry elements and convert them to an array for sorting
const animeElems = Array.from(document.getElementsByClassName("anime-entry"));

// Custom sorting function
function customSort(a, b) {
    const aStatus = a
        .querySelector(".anime-status")
        .textContent.trim()
        .toLowerCase();
    const bStatus = b
        .querySelector(".anime-status")
        .textContent.trim()
        .toLowerCase();

    // Define the sorting order based on status
    const statusOrder = [
        "watching",
        "completed",
        "on-hold",
        "dropped",
        "plan to watch",
    ];

    if (aStatus !== bStatus) {
        return statusOrder.indexOf(aStatus) - statusOrder.indexOf(bStatus);
    }

    const aTitle = a.querySelector(".anime-title").textContent.toLowerCase();
    const bTitle = b.querySelector(".anime-title").textContent.toLowerCase();

    return aTitle.localeCompare(bTitle);
}

// Sort the anime entries using the custom sorting function
animeElems.sort(customSort);

// Clear the existing container
animeContainer.innerHTML = "";

// Append the sorted anime entries back to the container
animeElems.forEach((animeElem) => {
    animeContainer.appendChild(animeElem);
});
