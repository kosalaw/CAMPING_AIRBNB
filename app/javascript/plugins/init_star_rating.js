import "jquery-bar-rating";

const initStarRating = () => {
  document.querySelectorAll(".review_rating").forEach((review, index) => {
    $(`#review_rating_${index}`).barrating({
      theme: 'css-stars',
      onSelect: (value, text, event) => {
        const form = $(`form.review_form_${index}`); // We are selecting the form on the page with its class
        form.submit(); // We submit the form with javascript
      }
    });
  })
};

export { initStarRating };

