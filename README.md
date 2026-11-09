# Aimesig Book Store

A static book-store / reading website designed for GitHub Pages. The starter catalogue contains **SYNVORA** and the uploaded **The Hunger Within** chapter.

## Included features

- Responsive library page with book cards and search.
- Separate book details page with editions and chapter links.
- Each published chapter is a standalone HTML page.
- Light and dark themes (the selection is remembered in the browser).
- Add Book form for title, short description, cover image, edition name, and one or more HTML chapter files.
- Local browser library saved with IndexedDB, plus JSON export/import backup.

## Publish on GitHub Pages

1. Create a new GitHub repository, for example `aimesig-book-store`.
2. Extract this project ZIP and upload **all files and folders inside** `aimesig-book-store/` to the repository root. Keep the folder structure intact.
3. Commit the files to the `main` branch.
4. In the repository, open **Settings → Pages**. Under the build/deployment options, choose **Deploy from a branch**, select `main` and the `/ (root)` folder, then save.
5. Open the Pages URL shown by GitHub after deployment.

The project uses relative links, so it works as a GitHub Pages project site under a repository path (not only at a custom domain root).

## Add a book for all visitors (publish a book)

GitHub Pages serves static files. A web page cannot upload a new file into your GitHub repository by itself, so books added through **Add a book** are saved only in the browser where they were added. To publish a book so everyone can see it:

1. Create a folder such as `books/my-book/edition-1/`.
2. Put the cover image in `assets/` (for example `assets/my-book-cover.jpg`).
3. Put each chapter in its own HTML file, for example `books/my-book/edition-1/chapter-1.html` and `chapter-2.html`.
4. Open `assets/catalog.js` and add a new book object to the `window.AIMESIG_BOOKS` array. Use this structure:

```js
{
  id: "my-book",
  title: "My Book",
  subtitle: "Optional subtitle",
  author: "Author name",
  description: "A short description for the library card and details page.",
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
          file: "books/my-book/edition-1/chapter-1.html"
        },
        {
          id: "chapter-2",
          number: "02",
          title: "Chapter Two",
          description: "Another short description.",
          file: "books/my-book/edition-1/chapter-2.html"
        }
      ]
    }
  ]
}
```

5. Commit and push the new files and catalogue entry. GitHub Pages will publish the updated library.

### Chapter HTML guidance

For published chapters, use a complete HTML document. The included SYNVORA chapter demonstrates an A4 editorial layout and includes the reader theme bar. To reuse the same theme toolbar, responsive overrides, and persistent theme, link the shared reader stylesheet and script using paths relative to your chapter file. For example, from `books/my-book/edition-1/chapter-1.html`:

```html
<link rel="stylesheet" href="../../../assets/reader.css">
<script src="../../../assets/reader.js"></script>
```

Include the reader toolbar block from `books/synvora/edition-1/chapter-1.html` near the beginning of `<body>`, then change its book-details link and chapter label for your chapter.

## Local Add Book form

The Add Book form accepts HTML chapter files. It keeps their content and cover image in the current browser's IndexedDB database. Use **Export my books** to make a backup; use **Import backup** to restore it in another browser. Local additions do not change the public GitHub catalogue.

## Customisation

- Public books and editions: `assets/catalog.js`
- Main site design: `assets/styles.css`
- Main site behaviour and local book manager: `assets/app.js`
- Reader styling: `assets/reader.css`
- Reader theme button: `assets/reader.js`
- Starter book: `books/synvora/edition-1/chapter-1.html`
