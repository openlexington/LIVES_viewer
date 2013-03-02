# LIVES Viewer

Simple web app to view LIVES standard health inspection data.
Still very rough.

## Notes
- Run with `rails server`
- Navigate to `/upload` to upload a standard LIVES `.zip`. It does all the
  extracting/importing so it will probably hang a sec and then redirect back to
  the upload page
- See list of businesses at `/businesses` w/ links to individual business.
- Business show page is extremely rough and currently really only useful to
  inspect the data (to make sure the import worked)
