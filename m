Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC779C2BD11
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 16:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE7C1208FE
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 16:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="cyhll6J3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgICQFz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 12:05:55 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:39296 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728701AbgICQFv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599149149; bh=O2eR303QQlmgKmRxq9fMT3xm3TVQ+GWFn+KJFysKNE0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=cyhll6J3zZZOSUlTPxvXbbvLdN+HYmew/yD8vLg/dxPcGejr+OudHtmG9AQPrDd8r
         uSJwtguG9o8xaTgtrMD0djBF/Pt/zGBXvdYathA7PAxlu0vKdXP3kFhuWSOQpXxerJ
         uS16+9LsSvEtKYdu5yE5tqAtq/QzBiJd9Jih7U0k=
From:   Drew DeVault <sir@cmpwn.com>
To:     "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Drew DeVault <sir@cmpwn.com>
Subject: [PATCH v3 3/4] Documentation/maintainer: rehome sign-off process
Date:   Thu,  3 Sep 2020 12:05:44 -0400
Message-Id: <20200903160545.83185-4-sir@cmpwn.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903160545.83185-1-sir@cmpwn.com>
References: <20200903160545.83185-1-sir@cmpwn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The repeated sign-offs necessary when a subsystem maintainer modifies an
incoming patch has been moved from submitting-patches.rst to
Documentation/maintainer, since the affairs of a subsystem maintainer
are not especially relevant to someone reading a guide for how to submit
their first patch.

Signed-off-by: Drew DeVault <sir@cmpwn.com>
---
 Documentation/maintainer/index.rst            |  1 +
 .../maintainer/modifying-patches.rst          | 50 +++++++++++++++++++
 Documentation/process/submitting-patches.rst  | 46 -----------------
 3 files changed, 51 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/maintainer/modifying-patches.rst

diff --git a/Documentation/maintainer/index.rst b/Documentation/maintainer/index.rst
index d904e74e1159..f0a60435b124 100644
--- a/Documentation/maintainer/index.rst
+++ b/Documentation/maintainer/index.rst
@@ -13,4 +13,5 @@ additions to this manual.
    rebasing-and-merging
    pull-requests
    maintainer-entry-profile
+   modifying-patches
 
diff --git a/Documentation/maintainer/modifying-patches.rst b/Documentation/maintainer/modifying-patches.rst
new file mode 100644
index 000000000000..58385d2e8065
--- /dev/null
+++ b/Documentation/maintainer/modifying-patches.rst
@@ -0,0 +1,50 @@
+.. _modifyingpatches:
+
+Modifying Patches
+=================
+
+If you are a subsystem or branch maintainer, sometimes you need to slightly
+modify patches you receive in order to merge them, because the code is not
+exactly the same in your tree and the submitters'. If you stick strictly to
+rule (c) of the developers certificate of origin, you should ask the submitter
+to rediff, but this is a totally counter-productive waste of time and energy.
+Rule (b) allows you to adjust the code, but then it is very impolite to change
+one submitters code and make him endorse your bugs. To solve this problem, it
+is recommended that you add a line between the last Signed-off-by header and
+yours, indicating the nature of your changes. While there is nothing mandatory
+about this, it seems like prepending the description with your mail and/or
+name, all enclosed in square brackets, is noticeable enough to make it obvious
+that you are responsible for last-minute changes. Example::
+
+       Signed-off-by: Random J Developer <random@developer.example.org>
+       [lucky@maintainer.example.org: struct foo moved from foo.c to foo.h]
+       Signed-off-by: Lucky K Maintainer <lucky@maintainer.example.org>
+
+This practice is particularly helpful if you maintain a stable branch and
+want at the same time to credit the author, track changes, merge the fix,
+and protect the submitter from complaints. Note that under no circumstances
+can you change the author's identity (the From header), as it is the one
+which appears in the changelog.
+
+Special note to back-porters: It seems to be a common and useful practice
+to insert an indication of the origin of a patch at the top of the commit
+message (just after the subject line) to facilitate tracking. For instance,
+here's what we see in a 3.x-stable release::
+
+  Date:   Tue Oct 7 07:26:38 2014 -0400
+
+    libata: Un-break ATA blacklist
+
+    commit 1c40279960bcd7d52dbdf1d466b20d24b99176c8 upstream.
+
+And here's what might appear in an older kernel once a patch is backported::
+
+    Date:   Tue May 13 22:12:27 2008 +0200
+
+        wireless, airo: waitbusy() won't delay
+
+        [backport of 2.6 commit b7acbdfbd1f277c1eb23f344f899cfa4cd0bf36a]
+
+Whatever the format, this information provides a valuable help to people
+tracking your trees, and to people trying to troubleshoot bugs in your
+tree.
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index f9baa46b9424..9072ed879696 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -473,52 +473,6 @@ Some people also put extra tags at the end.  They'll just be ignored for
 now, but you can do this to mark internal company procedures or just
 point out some special detail about the sign-off.
 
-If you are a subsystem or branch maintainer, sometimes you need to slightly
-modify patches you receive in order to merge them, because the code is not
-exactly the same in your tree and the submitters'. If you stick strictly to
-rule (c), you should ask the submitter to rediff, but this is a totally
-counter-productive waste of time and energy. Rule (b) allows you to adjust
-the code, but then it is very impolite to change one submitter's code and
-make him endorse your bugs. To solve this problem, it is recommended that
-you add a line between the last Signed-off-by header and yours, indicating
-the nature of your changes. While there is nothing mandatory about this, it
-seems like prepending the description with your mail and/or name, all
-enclosed in square brackets, is noticeable enough to make it obvious that
-you are responsible for last-minute changes. Example::
-
-	Signed-off-by: Random J Developer <random@developer.example.org>
-	[lucky@maintainer.example.org: struct foo moved from foo.c to foo.h]
-	Signed-off-by: Lucky K Maintainer <lucky@maintainer.example.org>
-
-This practice is particularly helpful if you maintain a stable branch and
-want at the same time to credit the author, track changes, merge the fix,
-and protect the submitter from complaints. Note that under no circumstances
-can you change the author's identity (the From header), as it is the one
-which appears in the changelog.
-
-Special note to back-porters: It seems to be a common and useful practice
-to insert an indication of the origin of a patch at the top of the commit
-message (just after the subject line) to facilitate tracking. For instance,
-here's what we see in a 3.x-stable release::
-
-  Date:   Tue Oct 7 07:26:38 2014 -0400
-
-    libata: Un-break ATA blacklist
-
-    commit 1c40279960bcd7d52dbdf1d466b20d24b99176c8 upstream.
-
-And here's what might appear in an older kernel once a patch is backported::
-
-    Date:   Tue May 13 22:12:27 2008 +0200
-
-        wireless, airo: waitbusy() won't delay
-
-        [backport of 2.6 commit b7acbdfbd1f277c1eb23f344f899cfa4cd0bf36a]
-
-Whatever the format, this information provides a valuable help to people
-tracking your trees, and to people trying to troubleshoot bugs in your
-tree.
-
 
 When to use Acked-by:, Cc:, and Co-developed-by:
 ------------------------------------------------
-- 
2.28.0

