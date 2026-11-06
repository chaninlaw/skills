---
name: pr-review
description: "Review a pull request or merge request end-to-end: runs code-review on the diff, then hands the findings to post-review to format and post. Use when asked to review a PR or MR, or mentions 'pr-review', 'review-pr', or 'รีวิว PR'."
---

Review a pull request or merge request end-to-end.

First, identify the PR or MR to review. If the user provided a link or number, use that; otherwise detect it from the current branch. If it's still unclear, ask.

Run `code-review` on the changes to evaluate both standards and spec.

Once the review is ready, pass the findings to `post-review` to verify the lines, format the comments, and post the review back to the platform.
