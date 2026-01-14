Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563643A1E7C
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 16:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768408468; cv=none; b=Cf28tT9U/owyArg/tmmhYHNAu8zjzfbDcY8ZI0D4ZJrUT2lBj5mIt3p3FZAdCNbzJZE3N45be/SCn2QR9WV/5Gc7MuGwFy3UjKz/VZpDIxZ64EKyX9L81UR49AyGZITD6rlN/Xmtr7djbUe8JEYUBU41LtZj6rzxdnZtg8LO+XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768408468; c=relaxed/simple;
	bh=hw3cHirG6Jl6xYzSbUQq3tm32RV9xEajdXBMv0jxLY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U5cg5ON9qVK4WDRAOa4XxfEbphUN1j507G9BB87s9tjOUCNT0sO9YUagbKsoZbv3/YyYRch3EuGS/wzs7LRnTsS5eR3q3p8YR87ByOMaI66IC8QZ0XoxM4Tm2+LcMLa3Urm6fTqF8IBogV/LJHLk/6ITMy/vAueWjQL8ehi/Eqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=YUbCdTet; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YUbCdTet"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7EF1D40C42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768408464; bh=wfXCNPtlPbF8MnimmJ4w5j6QwgRXrvPjdH1ZVpqd9YM=;
	h=From:To:Cc:Subject:Date:From;
	b=YUbCdTetq2s1q8kunf1gvqhSzoeKhK9hG6gsZnCa4O0rU8ondqC8Wf12snL7fPCRW
	 tPY3ShjDSHk/AAd/+KOtJY5KK+K2KS5Ghww201mq8VgURgCKsxGd60NIyTPM7pYf+1
	 B5rJ06HXg7gln9JxcUKGi5hXdjZv6U+C3cqh+5EjZ7bfrOMJXOsYKQL10fVpCOOear
	 hX0F/L+MxlJKHCU6YLwRn09VvqTNyHvMySeKPM9E8607lqDQWSe1tsOlJ4b4dQEJtO
	 onJFCvgBe8H0GPsDPnKOqRPid/TwdN5q4KwmvIDoUEkolHlxuV2lvVjsY1X3ACBc+i
	 iidlgxlWMz01A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7EF1D40C42;
	Wed, 14 Jan 2026 16:34:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Changbin Du
 <changbin.du@huawei.com>
Subject: [PATCH v2] Rework the jobserver open logic
Date: Wed, 14 Jan 2026 09:34:23 -0700
Message-ID: <87cy3cup9s.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The parsing of jobserver options is done in a massive try: block that hides
problems and (perhaps) bugs.  Split up that block and make the logic
explicit by moving the initial parsing of MAKEFLAGS out of that block.  Add
warnings in the places things can go wrong.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
v2 changes: send warnings to stderr, s/5/len('fifo:')/.

 tools/lib/python/jobserver.py | 143 +++++++++++++++++++++-------------
 1 file changed, 90 insertions(+), 53 deletions(-)

diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
index 616411087725e..bcaff993d0bec 100755
--- a/tools/lib/python/jobserver.py
+++ b/tools/lib/python/jobserver.py
@@ -35,6 +35,9 @@ import os
 import subprocess
 import sys
 
+def warn(text):
+    print(text, file = sys.stderr)
+
 class JobserverExec:
     """
     Claim all slots from make using POSIX Jobserver.
@@ -58,64 +61,98 @@ class JobserverExec:
 
         if self.is_open:
             return
-
-        try:
-            # Fetch the make environment options.
-            flags = os.environ["MAKEFLAGS"]
-            # Look for "--jobserver=R,W"
-            # Note that GNU Make has used --jobserver-fds and --jobserver-auth
-            # so this handles all of them.
-            opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
-
-            # Parse out R,W file descriptor numbers and set them nonblocking.
-            # If the MAKEFLAGS variable contains multiple instances of the
-            # --jobserver-auth= option, the last one is relevant.
-            fds = opts[-1].split("=", 1)[1]
-
-            # Starting with GNU Make 4.4, named pipes are used for reader
-            # and writer.
-            # Example argument: --jobserver-auth=fifo:/tmp/GMfifo8134
-            _, _, path = fds.partition("fifo:")
-
-            if path:
+        self.is_open = True  # We only try once
+        self.claim = None
+        #
+        # Check the make flags for "--jobserver=R,W"
+        # Note that GNU Make has used --jobserver-fds and --jobserver-auth
+        # so this handles all of them.
+        #
+        flags = os.environ.get('MAKEFLAGS', '')
+        opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
+        if not opts:
+            return
+        #
+        # Separate out the provided file descriptors
+        #
+        split_opt = opts[-1].split('=', 1)
+        if len(split_opt) != 2:
+            warn('WARNING: unparseable option:', opts[-1])
+            return
+        fds = split_opt[1]
+        #
+        # As of GNU Make 4.4, we'll be looking for a named pipe
+        # identified as fifo:path
+        #
+        if fds.startswith('fifo:'):
+            path = fds[len('fifo:':]
+            try:
                 self.reader = os.open(path, os.O_RDONLY | os.O_NONBLOCK)
                 self.writer = os.open(path, os.O_WRONLY)
-            else:
-                self.reader, self.writer = [int(x) for x in fds.split(",", 1)]
+            except (OSError, IOError):
+                warn('WARNING: unable to open jobserver pipe', path)
+                return
+        #
+        # Otherwise look for integer file-descriptor numbers.
+        #
+        else:
+            split_fds = fds.split(',')
+            if len(split_fds) != 2:
+                warn('WARNING: malformed jobserver file descriptors:', fds)
+                return
+            try:
+                self.reader = int(split_fds[0])
+                self.writer = int(split_fds[1])
+            except ValueError:
+                warn('WARNING: non-integer jobserver file-descriptors:', fds)
+                return
+            try:
+                #
                 # Open a private copy of reader to avoid setting nonblocking
                 # on an unexpecting process with the same reader fd.
-                self.reader = os.open("/proc/self/fd/%d" % (self.reader),
+                #
+                self.reader = os.open(f"/proc/self/fd/{self.reader}",
                                       os.O_RDONLY | os.O_NONBLOCK)
-
-            # Read out as many jobserver slots as possible
-            while True:
-                try:
-                    slot = os.read(self.reader, 8)
-                    if not slot:
-                        # Clear self.jobs to prevent us from probably writing incorrect file.
-                        self.jobs = b""
-                        raise ValueError("unexpected empty token from jobserver fd, invalid '--jobserver-auth=' setting?")
-                    self.jobs += slot
-                except (OSError, IOError) as e:
-                    if e.errno == errno.EWOULDBLOCK:
-                        # Stop at the end of the jobserver queue.
-                        break
-                    # If something went wrong, give back the jobs.
-                    if self.jobs:
-                        os.write(self.writer, self.jobs)
-                    raise e
-
-            # Add a bump for our caller's reserveration, since we're just going
-            # to sit here blocked on our child.
-            self.claim = len(self.jobs) + 1
-
-        except (KeyError, IndexError, ValueError, OSError, IOError) as e:
-            print(f"jobserver: warning: {repr(e)}", file=sys.stderr)
-            # Any missing environment strings or bad fds should result in just
-            # not being parallel.
-            self.claim = None
-
-        self.is_open = True
+            except (IOError, OSError):
+                warn('WARNING: Unable to reopen jobserver read-side pipe')
+                return
+        #
+        # OK, we have the channel to the job server; read out as many jobserver
+        # slots as possible.
+        #
+        while True:
+            try:
+                slot = os.read(self.reader, 8)
+                if not slot:
+                    #
+                    # Something went wrong.  Clear self.jobs to avoid writing
+                    # weirdness back to the jobserver and give up.
+                    self.jobs = b""
+                    warn("WARNING: unexpected empty token from jobserver;"
+                         " possible invalid '--jobserver-auth=' setting")
+                    self.claim = None
+                    return
+            except (OSError, IOError) as e:
+                #
+                # If there is nothing more to read then we are done.
+                #
+                if e.errno == errno.EWOULDBLOCK:
+                    break
+                #
+                # Anything else says that something went weird; give back
+                # the jobs and give up.
+                #
+                if self.jobs:
+                    os.write(self.writer, self.jobs)
+                    self.claim = None
+                    warn('WARNING: error reading from jobserver pipe', e)
+                    return
+            self.jobs += slot
+        #
+        # Add a bump for our caller's reserveration, since we're just going
+        # to sit here blocked on our child.
+        #
+        self.claim = len(self.jobs) + 1
 
     def close(self):
         """Return all reserved slots to Jobserver"""
-- 
2.52.0

