import "jquery-bar-rating";

const initStarRating = () => {
  document.querySelectorAll(".review_rating_stars").forEach((review, index) => {
    console.log(review.id)
    $(`#${review.id}`).barrating({
      theme: 'css-stars',
      onSelect: (value, text, event) => {
        const form = $(`form.form_${review.id}`); // We are selecting the form on the page with its class
        form.submit(); // We submit the form with javascript
      }
    });
  })
};

export { initStarRating };

