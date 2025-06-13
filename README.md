# Portfolio Website

Welcome to my portfolio website! This site showcases my projects, skills, and experience as a developer.

## Features

- Project gallery with descriptions and links
- About Me section
- Contact information

## Technologies Used

- Angular
- Tailwind CSS

## Getting Started

1. Clone the repository:
    ```bash
    git clone https://github.com/somasundar-dev/somasundar-dev.github.io.git
    ```
2. Install dependencies (if applicable):
    ```bash
    npm install
    ```
3. Start the development server:
    ```bash
    npm start
    ```

## Customization

- Update `src/app/Config/resume-data.ts` to add your information.


## Deployment to Github Pages

Run the following command to move you website to docs folder

```bash
cd src
npm run build -- --base-href=/cv/
cd ..
rm -rf docs
mkdir -p docs
mv src/dist/cv/browser/* docs/
git add docs
git commit -m "Profolio Website Updated"
git push
```

To configure GitHub Pages to deploy from the `docs` folder on the `main` branch:

1. Go to your repository on GitHub.
2. Click on **Settings**.
3. In the left sidebar, select **Pages**.
4. Under **Source**, choose the `main` branch and set the folder to `/docs`.
5. Click **Save**.

Your site will be published at `https://<your-username>.github.io/<repository-name>/`.


---

Feel free to reach out for collaboration or feedback!