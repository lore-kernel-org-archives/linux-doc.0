Received: from mta1.migadu.com (out-227.mta1.migadu.com [95.215.58.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B4D318EE7
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 06:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790405154; cv=none; b=GPOedWasO1NdoJ5T4cpqqZi0a/ASPMnvQuP7Jkc4F/zbVAko571iJ7ym1eNwq1TbVeQ94vWSsVRKzVxrbjCnUFwff/PFAO5jjkobxEFkMRgcV3l8zUUWLlIiYGP73eSRaKbs5BknJopnImbomoJaGX5MZxq/SXMvR0DLgp/cOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790405154; c=relaxed/simple;
	bh=osZJUQiF3KkacBcGS34QyS4YOkYrOMsnl2xCEEHffCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oe3z1pgbB8x2C9T8UmL4nl/mAuxmN6OnrXffu/dDaVRHrjpOqJKJ9XnXybXraf3ZvRogI0JpYtTkE/jvRjbmJhId4L5KPFi84Rx8XQLsixfN8nmaw/Yhmr2zR3WJZ2snZAfpZOvOVLvlYmxbO4+m8RyblewnHRwQwH0OkANzems=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=w7WTEGvF; arc=none smtp.client-ip=95.215.58.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="w7WTEGvF"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=osZJUQiF3KkacBcGS34QyS4YOkYrOMsnl2xCEEHffCo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790405149; v=1; x=1791009949;
 b=w7WTEGvFoN7QOo3H6THNMul43A6UVlHfel46PjI9WVtuKTBBtjvEAAXonVRUk4I76eFdUeOm
 hIxdZgwUX4fNsOm1DCQTKWIi6o/W7fA2ETWGdoVIW6/zLJg4URDQEDIeiE8BhAfjaqXrkUcbjTc
 JlQMo2FLRQDfyvHrcSYBwdaEh2XXDeE0RxqA7LAkwUbY+IjICmWHtRlTQ48HY5GvSon1e3jtQa3
 GhbMy3bydmTKcjFQ7qdfMKdzGSGv2o/vknbqlfvC9qm5MdQTJXUS9fEnjl4UhStRrJT5LnyGQgq
 wDIxCBaJXNcPgC673gxg0OoTrHqWj9Pd1tY/Os3sqzt6w==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c70aecb6a245a95a;
	Sat, 26 Sep 2026 06:45:49 +0000
X-Mizu-Trace-ID: c70aecb6a245a95a
X-Migadu-Flow: FLOW_OUT
Date: Sat, 26 Sep 2026 14:45:45 +0800
From: Weijie Yuan <kernel@wyuan.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: submitting-patches: use git switch to create branches
Message-ID: <ardqGdjnd7kC1B-E@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Weijie Yuan <wy@wyuan.org>

Git has been promoting "git switch" since git.git commit 328c6cb853d7
(doc: promote "git switch"), and the command is no longer experimental
as of Git 2.51.0.

Suggested-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 Documentation/process/submitting-patches.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 4c28a239e8cb..63a5550bd490 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -866,7 +866,7 @@ automatically include the base tree information in your submission by
 using the ``--base`` flag. The easiest and most convenient way to use
 this option is with topical branches::
 
-    $ git checkout -t -b my-topical-branch master
+    $ git switch -t -c my-topical-branch master
     Branch 'my-topical-branch' set up to track local branch 'master'.
     Switched to a new branch 'my-topical-branch'
 
@@ -882,7 +882,7 @@ notice that it will have the ``base-commit:`` trailer at the very
 bottom, which provides the reviewer and the CI tools enough information
 to properly perform ``git am`` without worrying about conflicts::
 
-    $ git checkout -b patch-review [base-commit-id]
+    $ git switch -c patch-review [base-commit-id]
     Switched to a new branch 'patch-review'
     $ git am patches.mbox
     Applying: First Commit
-- 
2.55.0.1055.g20c0e7c0fb.dirty

