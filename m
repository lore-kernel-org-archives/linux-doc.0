Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C723033C6;
	Mon, 12 Jan 2026 16:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235014; cv=none; b=jlBuoc0h5mw7uiXeL65dY4qiGgQuZsJWeci2FR8EHFrx60G8UO5k+HbTyagcxW+uXlv1ew3ltiswVh/XSeRGAG7b69p9k7oaWc2G6fGb3R8UYhKeBc8gmXfV3OwT2dhvffTH8I0xUxusMYAPRi7nMfDukDBQ1KDdyDAo9BS1I3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235014; c=relaxed/simple;
	bh=JRR3IiRYTeGzSvWHogEPqMkVQxNCYJ0vLoEvspN0eAE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bz/pRfkTZ8ms7ux+Fc6m/6jymHxpsJ5l8rVRZxWO+QZKveXBu8pGYpks8i7GnNruSUcTdBKCP3iIqZCSU1KZyig93o/gktTew6IfRk0PMFV1DVVmESUk85xYXQtUzBVBZY+nIc088tNbk5Pjbyw491OlKOpW9MAi1v8+vtKyF+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VtfeBxTz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VtfeBxTz"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6306340C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768235011; bh=S4IyC0wb4MvvKMW3MvXHHEzpoXQpWwS0kRHgx/gpsuI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VtfeBxTz++OhZ7usidh9AkrihvshRX03o7o2yMUjX3BKGtNCO7Ix6sC/C2ZQbCO+w
	 zPccWDjk16wJ46PzeDMLbFDvR+DLPh4JKuR0rJREHgy/rREldLgM4MRLaIOV3OX7EL
	 BZOfiK5dVipdk+OusrzOOIpmHilisq6UCcLyWxm5uBhsF3dvXFUmT7mMfcJIuK6lx/
	 FxZ7GgfNvGI+j9fP9l4rXodDoflWAM86qvcRiByBP8+QFVZwWdXf7sLFdTU/GIp/bP
	 cmJF9s9wtzvwzM4nPvwMBxSjn4b2Bcbbe2HMqvuDg6UDMi0SfGev4yQRnRKxsxqpbb
	 Fl9Rb0YH+a7JQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6306340C42;
	Mon, 12 Jan 2026 16:23:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Changbin Du <changbin.du@huawei.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Changbin Du
 <changbin.du@huawei.com>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v4] tools: jobserver: Prevent deadlock caused by
 incorrect jobserver configuration and enhance error reporting
In-Reply-To: <874ioq3jad.fsf@trenco.lwn.net>
References: <20260108113836.2976527-1-changbin.du@huawei.com>
 <874ioq3jad.fsf@trenco.lwn.net>
Date: Mon, 12 Jan 2026 09:23:30 -0700
Message-ID: <87v7h6241p.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> The warning comes from JobserverExec::open(), for an exception that
> appears to be expected.  This is the sort of use of exceptions that has
> made me almost swear off them entirely in Python - it's a huge try block
> that is using exceptions to hide a bunch of the assumptions and logic.
> I'll be posting a patch shortly to remove this non-exceptional exception
> case.

Here's a first step, just to show what I have in mind.

jon

From bdbb48e153714ae1c9e5214ba3ecd6142536ee6f Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Mon, 12 Jan 2026 09:19:49 -0700
Subject: [PATCH] jobserver: Begin to split up the big try: block

The parsing of jobserver options is done in a massive try: block that hides
problems and (perhaps) bugs.  Start to split up that block and make the
logic explicit by moving the initial parsing of MAKEFLAGS out of that
block.

Among other things, this removes the warning:

  jobserver: warning: IndexError('list index out of range')

Seen after the application of bbf8c67aa6ae8.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 tools/lib/python/jobserver.py | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
index 616411087725e..c674319f6cb1f 100755
--- a/tools/lib/python/jobserver.py
+++ b/tools/lib/python/jobserver.py
@@ -58,15 +58,27 @@ class JobserverExec:
 
         if self.is_open:
             return
-
+        self.claim = None
+        self.is_open = True  # We only try once
+        #
+        # See what they have told us to do here.
+        #
+        try:
+            flags = os.environ['MAKEFLAGS']
+        except KeyError:
+            return
+        #
+        # Look for "--jobserver=R,W"
+        # Note that GNU Make has used --jobserver-fds and --jobserver-auth
+        # so this handles all of them.
+        #
+        opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
+        if not opts:
+            return
+        #
+        # OK, parse the result.
+        #
         try:
-            # Fetch the make environment options.
-            flags = os.environ["MAKEFLAGS"]
-            # Look for "--jobserver=R,W"
-            # Note that GNU Make has used --jobserver-fds and --jobserver-auth
-            # so this handles all of them.
-            opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
-
             # Parse out R,W file descriptor numbers and set them nonblocking.
             # If the MAKEFLAGS variable contains multiple instances of the
             # --jobserver-auth= option, the last one is relevant.
-- 
2.52.0

