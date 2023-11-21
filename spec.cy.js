describe('My First Test', () => {
  it('Visits my Resume Site', () => {
    cy.visit('https://resume.techno-literate.com')
    cy.contains('Resume').click({force: true})
    cy.contains('About').click({force: true})
    cy.contains('Ryan Porter').click({force: true})
  })
})