describe('Jungle application', () => {
  beforeEach(() => {
    cy.viewport(1750, 1250);
    cy.visit('http://127.0.0.1:3000/');
  });

  it('Navigates to the signup page', () => {
    cy.get('.navbar-nav .nav-link').contains('Register').click();
    cy.url().should('include', 'users/new');
  });

  it('Signs up a user', () => {
    cy.get('.navbar-nav .nav-link').contains('Register').click();
    cy.get('input[name="user[first_name]"]').type('Stefan');
    cy.get('input[name="user[last_name]"]').type('Andrew');
    cy.get('input[name="user[email]"]').type('stefankif57@gmail.com');
    cy.get('input[name="user[password]"]').type('111111');
    cy.get('input[name="user[password_confirmation]"]').type('111111');
    cy.get('input[type="submit"]').click();
    cy.get('.navbar-nav .nav-link').should('include.text', 'Logout');
    cy.get('.navbar-nav .nav-link').contains('Logout').click();
    cy.get('.navbar-nav .nav-link').should('include.text', 'Login');
  });

  // it('Logs out a user', () => {
  //   cy.get('.navbar-nav .nav-link').contains('Logout').click();
  //   cy.get('.navbar-nav .nav-link').should('include.text', 'Login');
  // });

  it('Navigates to the login page', () => {
    cy.get('.navbar-nav .nav-link').contains('Login').click();
    cy.url().should('include', 'sessions/new');
  });

  it('Logs in a user', () => {
    cy.get('.navbar-nav .nav-link').contains('Login').click();
    cy.get('input[name="email"]').type('stefankif57@gmail.com');
    cy.get('input[name="password"]').type('111111');
    cy.get('input[type="submit"]').click();
    cy.get('.navbar-nav .nav-link').should('include.text', 'Logout');
  });

  // it('Logs out a user', () => {
  //   cy.get('.navbar-nav .nav-link').contains('Logout').click();
  //   cy.get('.navbar-nav .nav-link').should('include.text', 'Login');
  // });

});