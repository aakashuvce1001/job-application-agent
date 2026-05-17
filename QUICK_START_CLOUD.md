# 🎯 GitHub Cloud Setup - 5 Minute Guide

## What You'll Do (All in Browser)

```
1. Upload Resume (to GitHub)
   ↓
2. Add 6 API Keys (as GitHub Secrets)
   ↓
3. Enable GitHub Actions
   ↓
4. Test It (Click "Run workflow")
   ↓
✅ DONE! It runs automatically every day
```

---

## Step-by-Step

### STEP 1️⃣: Upload Resume (1 minute)

**Location:** https://github.com/aakashuvce1001/job-application-agent

![Upload Steps]

1. Click green **"Code"** button
2. Click **"Add file"** → **"Upload files"**
3. Drag your `resume.pdf` into the box
4. In the filename field, change to: `data/resume.pdf`
5. Scroll down, click **"Commit changes"**
6. ✅ Resume uploaded!

---

### STEP 2️⃣: Add API Keys as Secrets (3 minutes)

**Location:** https://github.com/aakashuvce1001/job-application-agent/settings/secrets/actions

Click **"New repository secret"** and add these ONE BY ONE:

#### Secret 1: OPENAI_API_KEY
```
Website: https://platform.openai.com/api-keys
1. Click "Create new secret key"
2. Copy the key
3. Paste in GitHub secret
4. Name: OPENAI_API_KEY
5. Click "Add secret"
```

#### Secret 2: INDEED_API_KEY
```
Website: https://opensource.indeedeng.io/
1. Click "API Access"
2. Sign up for developer access
3. Get your API key
4. Paste in GitHub secret
5. Name: INDEED_API_KEY
6. Click "Add secret"
```

#### Secret 3: EMAIL_ADDRESS
```
Name: EMAIL_ADDRESS
Value: your_email@gmail.com
(Use your Gmail address)
```

#### Secret 4: EMAIL_PASSWORD
```
Website: https://myaccount.google.com/apppasswords
⚠️ IMPORTANT: Your regular Gmail password will NOT work!

1. Go to Google Account
2. Security (left sidebar)
3. Enable 2-Step Verification (if not already)
4. Go back to Security
5. App passwords
6. Select "Mail" and "Windows Computer"
7. Google gives you 16 characters like: abcd efgh ijkl mnop
8. Copy this
9. Paste in GitHub secret (remove spaces)
10. Name: EMAIL_PASSWORD
11. Click "Add secret"
```

#### Secret 5: NOTIFICATION_EMAIL
```
Name: NOTIFICATION_EMAIL
Value: your_email@gmail.com
(Where to send job notifications)
```

#### Secret 6: LINKEDIN_API_KEY (Optional)
```
Skip if using web scraping
Or get from: https://www.linkedin.com/developers
```

**Result:** You should have 5-6 secrets in the Secrets dashboard ✅

---

### STEP 3️⃣: Enable GitHub Actions (30 seconds)

**Location:** https://github.com/aakashuvce1001/job-application-agent/actions

1. Click the **"Actions"** tab
2. See yellow warning message
3. Click **"I understand my workflows, go ahead and enable them"**
4. ✅ Actions enabled!

---

### STEP 4️⃣: Test It (2 minutes)

**Location:** https://github.com/aakashuvce1001/job-application-agent/actions

1. Click **"Daily Job Search & Application"** (left sidebar)
2. Click **"Run workflow"** (right side)
3. Select branch: **main** (default)
4. Click **"Run workflow"** button
5. Watch the workflow run!
   - 🟡 Yellow = Running
   - 🟢 Green = Success ✅
   - 🔴 Red = Failed ❌

**What's happening:**
```
Step 1: Checkout code
Step 2: Install Python
Step 3: Install packages (pip install)
Step 4: Load your resume
Step 5: Search Indeed for jobs
Step 6: Search LinkedIn for jobs
Step 7: Score each job
Step 8: Filter by relevance
Step 9: Tailor resume with OpenAI
Step 10: Create GitHub Issues (for approval)
Step 11: Send you an email
```

---

## 🎯 Now What?

### Every Day at 9:00 AM UTC:

1. 🤖 Workflow runs automatically
2. 📧 You get an email
3. 🔗 Email has link to GitHub Issues
4. 👀 You review job applications
5. ✅ You comment "APPROVE" or "REJECT"
6. 🚀 Application submitted if approved

---

## 📊 Your Application Dashboard

**Go to:** https://github.com/aakashuvce1001/job-application-agent/issues

Each "Issue" = One job application pending your approval

**To Approve a Job:**
```
1. Click on the issue
2. Scroll to bottom
3. Click "Comment" field
4. Type: APPROVE
5. Press Enter
6. ✅ Application submitted!
```

**To Reject a Job:**
```
1. Click on the issue
2. Scroll to bottom
3. Click "Comment" field
4. Type: REJECT (or add reason)
5. Press Enter
6. ❌ Job rejected, skip it
```

---

## 📈 Monitor Your Workflow

**Go to:** https://github.com/aakashuvce1001/job-application-agent/actions

You can see:
- ✅ All daily runs
- 📊 Success/failure
- ⏱️ How long it took
- 📝 Detailed logs
- 📥 Downloaded artifacts

---

## ❓ Quick FAQ

**Q: Does it really run in the cloud?**
A: YES! 100% on GitHub servers. No local machine needed.

**Q: When does it run?**
A: 9:00 AM UTC every day. (Can change if you want)

**Q: Does it cost money?**
A: ~$3-5/month only for OpenAI. GitHub Actions is FREE.

**Q: How many jobs per day?**
A: Usually 3-10 found, 1-5 relevant (depends on market)

**Q: Do I have to approve each one?**
A: YES! Manual verification required. You decide what to apply for.

**Q: Can I change the schedule?**
A: YES! Edit `.github/workflows/daily-job-search.yml` (advanced)

**Q: What if it fails?**
A: Click the failed run → Read the error → Check GitHub Secrets

---

## 🎉 You're Done!

Your job application agent is now:
- ✅ **Running in the cloud**
- ✅ **Automated daily**
- ✅ **Searches multiple job boards**
- ✅ **Tailors resumes with AI**
- ✅ **Requires your approval**
- ✅ **Sends you notifications**

**All you do is:**
1. Receive email notification
2. Click link
3. Review jobs
4. Approve/reject
5. Done!

---

## 📞 Need Help?

1. **Workflow failed?** → Check Actions logs
2. **Not receiving emails?** → Verify EMAIL_PASSWORD is app password (16 chars)
3. **Resume not found?** → Check it's uploaded to `data/resume.pdf`
4. **API errors?** → Verify API keys in GitHub Secrets

**Everything happens automatically. Check your email tomorrow morning! 📧**
