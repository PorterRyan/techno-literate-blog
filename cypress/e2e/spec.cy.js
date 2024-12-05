describe('Sitemap Test', () => {
  let urls = [];

  before(async () => {
    const response = await cy.request('https://www.techno-literate.com/sitemap.xml');

    urls = Cypress.$(response.body).find('loc').toArray().map(el => el.innerText);
  })

  it('should load each page successfully', () => {
    urls.forEach(cy.visit);
  });
});

describe('CSS test', () => {
  it('should have CSS', () => {
    cy.visit('https://www.techno-literate.com/').get('.blue').should('have.css','background-color','rgb(29, 33, 44)');
  });
});