Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42444304BBC
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 17:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768585162; cv=none; b=c7GNHcr/eFKXm47jYYetyG8BW/I42NY7NE4MDNg0BAUW4/Bta1vcUsxhuZLmNHmzkrgLw3PqQno7XBs8iJajKTMf4OxDXNePFOsXjmfu8sGy2dNdYG0J5fM6d/ndgrjfEe9NkAnGqwYCxMNH0qMYuTmkJAPJ5n5h0JO42cm9cYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768585162; c=relaxed/simple;
	bh=b+Ujhp0QVt4yKP2drdH+zo/MxTNO5VAARXJUTfVhAnY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YLzr7KXJiadt/gbs/PSW92wSlZoNzW1OtI9FMM6FHpWwyQrvCJeGbC+cNBwQAJJ/Uj2z734D/OIt5QS9TwvTtd3ShacF8zb/MTMAA2NGmk4zedweeV39HdclSqjdd8MNyONPtr/R/kmolhFRQuYODPc0DdlkTuh30Ia6XIRxBFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=h2/uvI3B; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="h2/uvI3B"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 624CA40425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768585160; bh=GdcMADCalY0RjP8iy+aWFpLy/SSMRy9dtsdlu/v42zg=;
	h=From:To:Cc:Subject:Date:From;
	b=h2/uvI3BJ0j/f8W1Splt4PfSNfOTIg8XXNaKJ/Dh2uEXn+THh0ICsXhIuaTU/SmQm
	 IEj1XiX9Q0iv8rHR2NzWF2qp5piKOce0kwMICebYOHnFqXKbQdo8OcNu8w4JESPHsZ
	 BElTtaFh3Nia94qxx2NnzGaiiJUZoGGjnlw2kRxQDfAcBL0Fy0NnbgyVQvMZULF+X0
	 cHfWll5jFh/ZvEv1QWNra3d0DIoUuY9jP8akeyZX90gskngRKYXCQJ7gvIEAaryCHB
	 L8AC92tqYjgdEpClj5LL2zoJ0OTKb/E8Otg6YBcbh0vKOhLZSSfgpLDGiPyOKYd636
	 NGdXZZgt0hwmQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 624CA40425;
	Fri, 16 Jan 2026 17:39:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Changbin Du
 <changbin.du@huawei.com>
Subject: [PATCH v3] Rework the jobserver open logic
Date: Fri, 16 Jan 2026 10:39:19 -0700
Message-ID: <875x91pid4.fsf@trenco.lwn.net>
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
Changes in v3:
  - Let warn() take multiple arguments
  - Fix syntactic brown-paper-bag error

 tools/lib/python/jobserver.py | 143 +++++++++++++++++++++-------------
 1 file changed, 90 insertions(+), 53 deletions(-)

diff --git a/tools/lib/python/jobserver.py b/tools/lib/python/jobserver.py
index 616411087725..7659b93fd566 100755
--- a/tools/lib/python/jobserver.py
+++ b/tools/lib/python/jobserver.py
@@ -35,6 +35,9 @@ import os
 import subprocess
 import sys
 
+def warn(text, *args):
+    print(f'WARNING: {text}', *args, file = sys.stderr)
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
+            warn('unparseable option:', opts[-1])
+            return
+        fds = split_opt[1]
+        #
+        # As of GNU Make 4.4, we'll be looking for a named pipe
+        # identified as fifo:path
+        #
+        if fds.startswith('fifo:'):
+            path = fds[len('fifo:'):]
+            try:
                 self.reader = os.open(path, os.O_RDONLY | os.O_NONBLOCK)
                 self.writer = os.open(path, os.O_WRONLY)
-            else:
-                self.reader, self.writer = [int(x) for x in fds.split(",", 1)]
+            except (OSError, IOError):
+                warn('unable to open jobserver pipe', path)
+                return
+        #
+        # Otherwise look for integer file-descriptor numbers.
+        #
+        else:
+            split_fds = fds.split(',')
+            if len(split_fds) != 2:
+                warn('malformed jobserver file descriptors:', fds)
+                return
+            try:
+                self.reader = int(split_fds[0])
+                self.writer = int(split_fds[1])
+            except ValueError:
+                warn('non-integer jobserver file-descriptors:', fds)
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
+                warn('Unable to reopen jobserver read-side pipe')
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
+                    warn("unexpected empty token from jobserver;"
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
+                    warn('error reading from jobserver pipe', e)
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

