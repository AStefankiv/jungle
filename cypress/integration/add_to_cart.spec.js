describe('Jungle application', () => {
  beforeEach(() => {
    cy.viewport(1750, 1250);
    cy.visit('http://127.0.0.1:3000/');
  });

  it('Clicks the Add button for a product on the home page and verifies cart update', () => {

    cy.get('.navbar-nav .nav-link').invoke('text').then((text) => {
      const cartCount = parseInt(text.match(/\d+/)[0]); // Extract the number from the text


    cy.get('article').eq(1)
    .find('.add-to-cart')
    .contains('Add')
    .click({ force: true });

    cy.get('.navbar-nav .nav-link').should('include.text', `My Cart (${cartCount + 1})`);
    });
  });
});
