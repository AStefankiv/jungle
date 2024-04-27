describe('Jungle application', () => {
  beforeEach(() => {
    cy.viewport(1750, 1250)
    cy.visit('http://127.0.0.1:3000/')
  })

  it('displays products', () => {
    cy.get('article').should('exist')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });
})