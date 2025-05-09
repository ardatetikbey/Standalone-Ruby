# Glimmer Process (Beyond Agile)

**Glimmer Process** is the lightweight software development process used for building [Glimmer](https://github.com/AndyObtiva/glimmer) libraries and [Glimmer](https://github.com/AndyObtiva/glimmer) apps, which goes beyond Agile, rendering all Agile processes obsolete. **Glimmer Process** is simply made up of 7 guidelines to pick and choose as necessary until software development needs are satisfied. Not all guidelines need to be incorporated into every project, but it is still important to think through every one of them before ruling any out. Guidelines can be followed in any order.

## GPG (Glimmer Process Guidelines):
1. **Requirements Gathering**: Spend no more than a few hours writing the initial requirements you know from the business owner, gathering missing requirements, and planning to elicit more requirements from users, customers, and stakeholders. Requirements are not set in stone, but serve as a good starting point in understanding what a project is about. After initial release, only document small tasks going forward.
2. **Software Architecture and Design Diagrams**: Perform software architecture and design activities as necessary by analyzing requirements and creating diagrams.
3. **Initial Release Plan**: This guideline's motto is "Plans are Nothing. Planning is Everything" (said by Dwight D. Eisenhower) because the initial release plan is not set in stone and might change completely, but is still invaluable in launching a new project forward. Consider including alpha releases (for internal testing) and beta releases (for customer testing).
4. **Small Releases**: Develop and release in small increments. Do not release more than 3-weeks worth of work, preferring releases that are shorter than a week worth of work whenever possible. Break releases down. If you need to support multiple platforms, release for a platform at a time. If a feature includes a number of other features, then release them one by one instead of all at once. If a feature involves multiple options, release the default version first, and then release extra options later.
5. **Usability Testing**: Make sure to observe a user using your software the first few releases or when releasing critical brand new unproven features. Ask them to complete a list of goals using the software, but do not help them to complete them unless they get very stuck. Write down notes silently while observing them use your software. Once done with usability testing, you may then ask further questions about any of the notes you wrote down, and afterwards add the notes as feature enhancements and bug fixes. Implement them and then do another usability test with the improvements in place. Repeat as necessary only.
6. **Automated Tests**: Cover sensitive parts of the code with automated tests at the appropriate level of testing needed. Run tests in a continuous integration server.
7. **Refactoring**: Simplify code, eliminate code duplication, improve code organization, extract reusable components, and extract reusable libraries at every opportunity possible.

--

Copyright (c) 2020-2025 Andy Maleh
 
Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:
 
The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
