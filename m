Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9378B30277A;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196506; cv=none; b=uXFYbfF09IQ1QeNYY0iCL0c6G4w1kJGM9bMvLjvTaNcZe8UigXDINSGIP9+5SmtnW5CsxZ/i3plsK7X2dFxROxwLqgOIX8dam9BGWngYmD/e50tVhMImYPSa8husydR8DT3OmSZGXdmCFHJyUsWp67EFDnqvacbtc0E4SBSp+co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196506; c=relaxed/simple;
	bh=ZLbhSMLrYrG412X2oMrDythT1CiWtmLDdQQNSbEgmmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnO98p8p9UzISRFRG6sg0bvp5qLSxDauwLzZY2nSiVQNkT+fcw7c6XFMTuv7HlqVYdtoso5hJziCcF0SyTnnZSFWXLJ+qdrvu8IVT4l1lvvgIcb2y+NMUOkcSCbh5K4pS0dWDVHAzdjR4aVEf+K7IfNwROamqJTtZLlz7c3traY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eg+UMlDD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eg+UMlDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F41C4CEFA;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196506;
	bh=ZLbhSMLrYrG412X2oMrDythT1CiWtmLDdQQNSbEgmmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eg+UMlDDJOfm7n5PKt6CgcXgfPPhzrybopuRXYko+f0Wk9hwwF+Kv6SyHCqp1yCcv
	 N8Ip9GZ0ylAuz+6G5kDgh9XAVGVEeTY6z3JLRDmFx+570bTTZYs4E7aDYTcb7PYmBn
	 BnAArogJApj8dNBbmTIkFXD6pWbZ1jNk62cwK2BsqBKoeKRahWnEVbSTtlcs1z924U
	 fat+nk7dhrmye6FOIJ0K/OOrjEsiX4sngh7KlroBQmLK0hyyZ+i4kOXbUz7bb83s9o
	 HR0vmAXgv1nUqKbHJIqLW2VDblkijUTPfMUW3P8zv3mj2a//1HdtFzkOizJ/s5oOZ9
	 K7lobiAqozGqA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE8-0000000Crr2-0KdJ;
	Thu, 18 Sep 2025 13:55:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 12/24] docs: parallel-wrapper.sh: remove script
Date: Thu, 18 Sep 2025 13:54:46 +0200
Message-ID: <c8ce0c78d0761370e4c9091a9423d9df9a357187.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758196090.git.mchehab+huawei@kernel.org>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The only usage of this script was docs Makefile. Now that
it is using the new sphinx-build-wrapper, which has inside
the code from parallel-wrapper.sh, we can drop this script.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/parallel-wrapper.sh | 33 ------------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 Documentation/sphinx/parallel-wrapper.sh

diff --git a/Documentation/sphinx/parallel-wrapper.sh b/Documentation/sphinx/parallel-wrapper.sh
deleted file mode 100644
index e54c44ce117d..000000000000
--- a/Documentation/sphinx/parallel-wrapper.sh
+++ /dev/null
@@ -1,33 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0+
-#
-# Figure out if we should follow a specific parallelism from the make
-# environment (as exported by scripts/jobserver-exec), or fall back to
-# the "auto" parallelism when "-jN" is not specified at the top-level
-# "make" invocation.
-
-sphinx="$1"
-shift || true
-
-parallel="$PARALLELISM"
-if [ -z "$parallel" ] ; then
-	# If no parallelism is specified at the top-level make, then
-	# fall back to the expected "-jauto" mode that the "htmldocs"
-	# target has had.
-	auto=$(perl -e 'open IN,"'"$sphinx"' --version 2>&1 |";
-			while (<IN>) {
-				if (m/([\d\.]+)/) {
-					print "auto" if ($1 >= "1.7")
-				}
-			}
-			close IN')
-	if [ -n "$auto" ] ; then
-		parallel="$auto"
-	fi
-fi
-# Only if some parallelism has been determined do we add the -jN option.
-if [ -n "$parallel" ] ; then
-	parallel="-j$parallel"
-fi
-
-exec "$sphinx" $parallel "$@"
-- 
2.51.0

