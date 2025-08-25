Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0CC1FECAD;
	Mon, 25 Aug 2025 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756139449; cv=none; b=NCYWL76RcxYhe/QsrWq+0l5Cd/XhmMi+xHz7jiy9ODF1YfUxIr0iQ+J/wxhlF22VJBQyamKAPGhHpxwpKBAXcpNmc3NDH2IaeV0eIZG9X71LZ6hIlT6CRp80/O85PdeygX2Efn7OVBy85pYQ5nscUNjIHg2pxVwu3ANTNXzb3dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756139449; c=relaxed/simple;
	bh=jlol1TuhVNcZDXlNqsLBvYWROc27W0iXgTQpgdIUTbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQeSFK8A8w1pEpxJWGmI6nn6V29bcUrWlB8FQRmAkqGVud5qNPHz7b5g1gHrMdY7Z5fBbFVZQNqZoApn1h/j0z7/6ymmW2qnRAK6nmhsMRsHRCLJQRSqcy0GypOw6iKXZOS8cHE1dFh68sDKQmZLTvKy7/L4bmlle/Wpf37BpwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TA904OiL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TA904OiL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1045DC4CEED;
	Mon, 25 Aug 2025 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756139449;
	bh=jlol1TuhVNcZDXlNqsLBvYWROc27W0iXgTQpgdIUTbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TA904OiL46jx1hTUpDx5EECjUx5Tcs3DkAxF1f44JJIrA/U8PpyqHG9GGQNj4iZuO
	 kAKQ0EuWvSaCpBbkqAt1bTKRJjE7n6lsZ+MtFlmLeAsb9eXO8R59nRglhPGhVss3eY
	 4eE9CU17sYEOGTzwwG5UcMbu5nBnNZTa9iJmu+q8zcnxzdmcphc7XVTWLFplO/vzva
	 wxt+ekNTp5ZxX1ZDdf9njGK8Q7H0qOrc/5GuPMZyMztqWN6rULe2Q/AETVwQtvWa4W
	 KBqLzZJaIe7hwmVjxmU+aq8LylUY/W2TBWi8UVbVoB+VUK7YUoZJcT9gHyt0kVRXSs
	 eT+yVIcf5fdHw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uqa5n-0000000HALQ-0us9;
	Mon, 25 Aug 2025 18:30:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/13] scripts/jobserver-exec: add a help message
Date: Mon, 25 Aug 2025 18:30:30 +0200
Message-ID: <78712c238669ad9b3ac83ea3cc42fb600c2ace00.1756138805.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756138805.git.mchehab+huawei@kernel.org>
References: <cover.1756138805.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Currently, calling it without an argument shows an ugly error
message. Instead, print a message using pythondoc as description.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/jobserver-exec | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/scripts/jobserver-exec b/scripts/jobserver-exec
index 40a0f0058733..ae23afd344ec 100755
--- a/scripts/jobserver-exec
+++ b/scripts/jobserver-exec
@@ -1,6 +1,15 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0+
 
+"""
+Determines how many parallel tasks "make" is expecting, as it is
+not exposed via any special variables, reserves them all, runs a subprocess
+with PARALLELISM environment variable set, and releases the jobs back again.
+
+See:
+    https://www.gnu.org/software/make/manual/html_node/POSIX-Jobserver.html#POSIX-Jobserver
+"""
+
 import os
 import sys
 
@@ -12,17 +21,12 @@ sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
 from jobserver import JobserverExec                  # pylint: disable=C0415
 
 
-"""
-Determines how many parallel tasks "make" is expecting, as it is
-not exposed via an special variables, reserves them all, runs a subprocess
-with PARALLELISM environment variable set, and releases the jobs back again.
-
-See:
-    https://www.gnu.org/software/make/manual/html_node/POSIX-Jobserver.html#POSIX-Jobserver
-"""
-
 def main():
     """Main program"""
+    if len(sys.argv) < 2:
+        name = os.path.basename(__file__)
+        sys.exit("usage: " + name +" command [args ...]\n" + __doc__)
+
     with JobserverExec() as jobserver:
         jobserver.run(sys.argv[1:])
 
-- 
2.51.0

