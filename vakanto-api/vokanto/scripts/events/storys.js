document.querySelectorAll('.info__hist-row').forEach( (elm) => {
    elm.addEventListener('click' , (e) => {
        elm.querySelector('.info__hist-hide ').classList.toggle('hist__hide');
    })
} )