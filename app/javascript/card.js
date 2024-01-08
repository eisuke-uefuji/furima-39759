const pay = () => {
  const payjp = Payjp('pk_test_99e69052a04515d1fa77eda5')
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  
  const form = document.getElementById('button')
  form.addEventListener("submit", (e) => {
    payjp.createToken(numberElement).then(function (response) {
      if (response.error){
      } else {
        const token = response.id;
        console.log(token)
      }
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);
document.addEventListener("turbo:render", pay);