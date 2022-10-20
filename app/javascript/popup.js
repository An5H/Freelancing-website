const openPopup = () => {
  try {
    let popup = document.getElementById("popup");
    popup.classList.add("open-popup");
  } catch (e) {
    console.log(e);
  }
};

const closePopup = () => {
  try {
    let popup = document.getElementById("popup");
    popup.classList.remove("open-popup");
  } catch (e) {
    console.log(e);
  }
};
