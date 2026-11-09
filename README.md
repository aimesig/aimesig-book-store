# Aimesig Book Store

A premium, responsive digital reading room for GitHub Pages. The repository includes **SYNVORA — The Hunger Within** as the first book and Chapter 1.

## Important: upload the contents of this ZIP

This ZIP is intentionally arranged with `index.html` at its **top level**. When uploading, extract it first and upload every item inside the extracted folder to the root of `aimesig-book-store`. Do not upload the ZIP itself and do not put these files inside another nested folder.

After upload, the GitHub repository root must look like this:

```text
index.html
book.html
reader.html
admin.html
README.md
.nojekyll
assets/
  styles.css
  app.js
  admin.js
  reader.js
  catalog.js
  cover-synvora.svg
  cover-default.svg
  mark.svg
books/
  synvora/edition-1/chapter-1.html
```

## Publish on GitHub Pages

1. Extract this ZIP.
2. Open `https://github.com/aimesig/aimesig-book-store`.
3. Choose **Add file → Upload files**.
4. Drag all the files and folders from the extracted ZIP's top level into GitHub. Make sure `index.html` appears directly in the repository root.
5. Commit the changes to the `main` branch.
6. Open **Settings → Pages** and choose **Deploy from a branch**, branch `main`, folder `/(root)`, then Save.
7. Wait for the Pages deployment to finish. The site is `https://aimesig.github.io/aimesig-book-store/`.

If the page still looks unstyled, check that `assets/styles.css` exists at exactly that path in the repository and that `index.html` is at the root. The browser's hard refresh is `Ctrl + Shift + R`.

## Website features

- Designed library homepage, featured book area, animated editorial ticker, book covers and live search.
- Book detail pages with multiple editions and individual chapter links.
- Dedicated reading page for each chapter, loaded directly in a same-origin iframe (no JavaScript fetch), with a responsive reading canvas and previous/next chapter navigation.
- Light and dark mode, saved between pages and visits.
- Add Book form for title, subtitle, author, description, cover image, multiple editions and multiple HTML chapters per edition.
- Browser-local book storage with JSON backup and restore.
- Responsive desktop, tablet and mobile layouts.
- Preloaded SYNVORA — The Hunger Within, including the complete supplied Chapter 1 HTML.

## Add a book from the website

1. Open **Add a book** from the navigation.
2. Enter the title, optional author and subtitle, and a short description.
3. Choose a cover image (optional).
4. Give the first edition a name, then select one or more `.html` / `.htm` files in chapter order.
5. Use **Add another edition** for a revised or alternate edition.
6. Click **Add book to my shelf**. The book will immediately appear in that browser's library and its chapters can be opened and read.

The Add Book page saves new entries in IndexedDB in the current browser. Export the JSON backup to preserve or transfer this personal collection.

## GitHub Pages limitation — please read

GitHub Pages is static hosting. A website hosted on GitHub Pages cannot directly write uploaded files back into the repository. Therefore, a book added through the form is stored in the browser that added it; it does not automatically appear to other visitors or on another device. To publish a book for everyone, add its cover and chapter files to the repository and add its entry to `assets/catalog.js`, then commit those files.

Example public catalogue entry:

```js
{
  id: "my-book",
  title: "My Book",
  subtitle: "Optional subtitle",
  author: "Author",
  description: "A short description for the library card.",
  cover: "assets/my-book-cover.jpg",
  editions: [{
    id: "first-edition",
    title: "First Edition",
    note: "Optional edition note",
    chapters: [{
      id: "chapter-1",
      number: "01",
      title: "Chapter One",
      description: "A short chapter description.",
      file: "books/my-book/first-edition/chapter-1.html"
    }]
  }]
}
```

Keep each public chapter as a separate HTML file under `books/`. A chapter entry points to that file, and its reader URL is generated automatically. The reader opens that page directly in an iframe instead of using `fetch()`, avoiding common GitHub Pages fetch/CORS failures. For the included book, confirm that `books/synvora/edition-1/chapter-1.html` exists in the repository with exactly the same spelling and letter case.

## Preview locally

Use a local web server so the chapter HTML is served from the same site origin.

- Windows: double-click `start-local.bat`.
- macOS / Linux: run `./start-local.sh` from Terminal.
- Then visit `http://localhost:8000`.

## Theme and design

The site starts in dark mode. Use the theme button in the header to switch between warm ivory and charcoal/gold modes. Your preference is saved in the browser and applied to the reader, including the uploaded SYNVORA chapter.
