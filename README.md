# 🥪 The Jaffle Shop 🦘

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/dbt-labs/jaffle-shop?quickstart=1)
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/dbt-labs/jaffle-shop)

This is a sandbox project for exploring the basic functionality and latest features of dbt.

## Create new repo from template

1. <details>
   <summary>Click the green "Use this template" button at the top of the page to create a new repository from this template.</summary>

   ![Click 'Use this template'](/.github/static/use-template.gif)
   </details>

2. Follow the steps to create a new repository.

## Platform setup

### dbt Cloud IDE (most beginner friendly)

1. Set up a dbt Cloud account and follow Step 4 in the [Quickstart instructions for your data platform](https://docs.getdbt.com/quickstarts), to connect your platform to dbt Cloud.
2. Choose the repo you created in Step 1 as the repository for your dbt Project code.
3. Click `Develop` in the top nav, you should be prompted to run a `dbt deps`, which you should do.

### dbt Cloud in GitHub Codespaces / Gitpod (more customizable)

1. <details>
   <summary>In the new repository, click the green "Code" button and select "Open with Codespaces" from the dropdown. If possible, open in VSCode locally rather than the web version, performance is significantly better. You can also click the 'Open in Codespaces' badge at the top of the README, the 'Open in Gitpod' badge for a more expansive devcontainer experience.</summary>

   ![Create codespace on main](.github/static/open-codespace.gif)
   </details>

2. Install the recommend extensions when prompted unless you have set preferences here.
3. Run `task install`[^1] in the integrated terminal.

### dbt Cloud locally (more advanced)

1. If you have a preferred local development setup, clone the repo locally.
2. Run `task venv`.[^2]
3. Run `source .venv/bin/activate`.[^3]
4. Run `task install`.[^1]
5. Run `exec $SHELL`[^4]

## Project setup

Once your project is set up, use the following steps to get the project ready for whatever you'd like to do with it.

### dbt Cloud IDE

1. Run `dbt seed` to load the sample data into your raw schema.
2. Delete the `jaffle-data` directory now that the raw data is loaded into the warehouse.

### dbt Cloud in Github Codespaces / Gitpod / local

1. Run `task setup`.[^5]
2. Run a `dbt build` to build your project.
3. [Party up](https://www.youtube.com/watch?v=thIVtEOtlWM)!

## Optional

- If you'd like to use [pre-commit](https://pre-commit.com/), run `pre-commit install` in your virtual environment or devcontainer, after the `task install` step.

---

[^1]: This will install the dbt Cloud CLI [currently in beta] as well as the python packages necessary for running MetricFlow queries, linting your code, and other tasks.
[^2]: This will create a virtual environment called `.venv`.
[^3]: This will activate the virtual environment you just created. It's a long story, but because `task` runs commands in a subshell, we need to activate the virtual environment in the main shell manually so we can't put this in a task, sorry!
[^4]: This will reload your shell and ensure the new dependencies are available.
[^5]: This will run a `dbt seed` then `mv jaffle-data jaffle-data-loaded`, moving the sample data out of the `seed-path` now that it's loaded into your raw schema. The raw schema is meant to be accessed by all developers and production jobs as a raw database would, so once you've `dbt seed`'d it, you don't need it again, but we'll keep it around in the `jaffle-data-loaded` folder just in case. Should you ever need to load it again just ensure you've dropped the raw schema and `mv jaffle-data-loaded jaffle-data` and then `dbt seed` again.
