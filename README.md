# Terragit
Using Terraform while simotaniously uploading to git to better understand the ins and outs of using the two.
No game changing code here, just bringing the two worlds together.

Tons of problems came up with trying to push terraform files to github, saying files were too big.
*Have already tried git lfs, didn't work, the file was still described as being too big
*Got git lfs to work but it wouldn't display the code in the repository

Found a Temporary fix to the file being too large to upload with:
git filter-branch -f --index-filter 'git rm --cached -r --ignore-unmatch .terraform/'

Still not too sure about it, no problems have arisen yet but will be on the lookout.
