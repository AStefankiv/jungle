describe('Jungle application', () => {
  beforeEach(() => {
    cy.viewport(1750, 1250);
    cy.visit('http://127.0.0.1:3000/');
  });

  it('Allows a user to click on a product and navigate to its detail page', () => {
    cy.get('article').eq(2).click();
    cy.get('h1').should('contain', 'Eesrorn'); // This checks if the h1 tag contains the text 'Eesrorn'
    cy.url().should('include', '/products/'); // Make sure the URL is correct for the product details page
  });
});