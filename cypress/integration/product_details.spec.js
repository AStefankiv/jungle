describe('Jungle application', () => {
  beforeEach(() => {
    cy.viewport(1750, 1250)
    cy.visit('http://127.0.0.1:3000/')
  })

  it('allows a user to click on a product and navigate to its detail page', () => {
    // cy.get('article').first().click()
    cy.get('article').eq(2).click()
    cy.url().should('include', '/products/')
    cy.get('h1').should('contain', 'Eesrorn') //optional
  })
});