# Aimesig Book Store

A responsive, aesthetic static book library designed for GitHub Pages. The project is preloaded with **SYNVORA — The Hunger Within** as its first book and reading chapter.

## Included and working

- A book-library homepage with cover cards and live search.
- Individual book detail pages with editions and chapter lists.
- A dedicated reader page for every chapter link. Public chapter files are separate HTML documents in the repository.
- Light and dark themes remembered between visits.
- Add Book form with title, author, description, cover image, multiple editions, and one or more HTML chapter files per edition.
- Browser-local book storage using IndexedDB. Local books remain after refreshing the same browser/device.
- JSON export/import backup for locally added books, including cover images and chapter HTML.
- Responsive layouts for desktop, tablet, and mobile.

## Publish on GitHub Pages

1. Extract this ZIP file.
2. Open your repository (for example, `https://github.com/aimesig/aimesig-book-store`).
3. Upload **the contents of the `aimesig-book-store` folder** to the repository root. Do not upload only the ZIP file or the containing folder itself.
4. Confirm that `index.html`, `book.html`, `reader.html`, `admin.html`, `assets/`, and `books/` are visible at the top level of the repository.
5. Commit the files to the `main` branch.
6. Open **Settings → Pages**. Choose **Deploy from a branch**, select `main` and `/(root)`, then Save.
7. After GitHub finishes building the site, open `https://aimesig.github.io/aimesig-book-store/`.

The project uses relative paths and works under a GitHub Pages project URL.

## Add books in the website

Open the **Add a book** page from the navigation. Enter a title and description, choose an optional cover image, add one or more editions, and select the chapter HTML files for each edition. When you submit, the book appears in the library and its chapters open in the reader. Each selected HTML file becomes a separate chapter.

**Important GitHub Pages limitation:** GitHub Pages serves static files; a public website cannot write new files back into its GitHub repository. Therefore, books added through the website are saved in IndexedDB in the browser where they were added. They are not automatically visible to other visitors. Use **Export my books** to back them up or move them to another browser. To publish books for everyone, add the files to the repository and update the public catalogue as described below.

## Publish a book for every visitor

1. Add a cover image under `assets/`, for example `assets/my-book-cover.jpg`.
2. Add each chapter as an HTML file under a book and edition folder. Example:

   ```text
   books/my-book/first-edition/chapter-1.html
   books/my-book/first-edition/chapter-2.html
   books/my-book/second-edition/chapter-1.html
   ```

3. Open `assets/catalog.js` and add a book object to `window.AIMESIG_BOOKS`. Use this format:

   ```js
   {
     id: "my-book",
     title: "My Book",
     subtitle: "Optional subtitle",
     author: "Author name",
     description: "A short description shown on the book card and detail page.",
     cover: "assets/my-book-cover.jpg",
     editions: [
       {
         id: "first-edition",
         title: "First Edition",
         note: "Optional edition note",
         chapters: [
           {
             id: "chapter-1",
             number: "01",
             title: "Chapter One",
             description: "A short chapter description.",
             file: "books/my-book/first-edition/chapter-1.html"
           },
           {
             id: "chapter-2",
             number: "02",
             title: "Chapter Two",
             description: "Another short description.",
             file: "books/my-book/first-edition/chapter-2.html"
           }
         ]
       },
       {
         id: "second-edition",
         title: "Second Edition",
         note: "Revised edition",
         chapters: [
           {
             id: "chapter-1",
             number: "01",
             title: "Chapter One — Revised",
             description: "The revised opening chapter.",
             file: "books/my-book/second-edition/chapter-1.html"
           }
         ]
       }
     ]
   }
   ```

4. Commit the cover, chapter files, and catalogue changes to GitHub. GitHub Pages will then show the new book to every visitor.

Every chapter should be a complete HTML document. The reader loads that HTML into its own reading frame and applies the current light/dark theme. Relative image or stylesheet references inside a chapter are resolved from the chapter file's folder.

## Preview on your computer

Because the reader loads chapter files with `fetch`, use a local web server rather than opening `index.html` directly as a `file://` URL.

- **Windows:** double-click `start-local.bat`.
- **macOS/Linux:** run `./start-local.sh` in Terminal.

Then open `http://localhost:8000` in your browser.

## Project structure

```text
index.html                         Library homepage
book.html                          Book details + editions + chapters
reader.html                        Dedicated chapter reader
admin.html                         Add book / editions / chapters
assets/
  app.js                           Catalogue, theme, library and detail-page logic
  admin.js                         Book upload, IndexedDB and backup logic
  catalog.js                       Public book catalogue
  reader.js                        Chapter loader and reader theme handling
  styles.css                       Shared responsive design system
  cover-synvora.svg                SYNVORA cover artwork
  cover-default.svg                Generic fallback cover artwork
  mark.svg                         Site favicon
books/
  synvora/edition-1/chapter-1.html  The Hunger Within (uploaded chapter)
```
