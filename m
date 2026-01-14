Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C923A4AD5;
	Wed, 14 Jan 2026 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768408919; cv=none; b=OWSullunHKk+4qDhPLZvEt/xKR09gta5IjoOOaNzHcLdkeXHqsRz2CkpddNGrWqMO819jZXCBE9rgvPRfGFNAodk931ny9wGiw63DyT2lO/Z0NH27YYbnMhMPe/Jvom30GclBiwJvLagrawsjjS3+QrefUSg4dXizWgVAnCsPYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768408919; c=relaxed/simple;
	bh=AQkH/OLIxCFJ3Q5OoG/k2Bg1TJzlQxHovfPCD8xaC40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhrA9HGxlOmEJfaJuEkmpz8OzWUpveeZULYQdeeE6EP+1LysroAzUK/s/khVvF67qeWaiw3u5/UQIFs7jM2CcZnJi8PHfhT/La0cjhWaP1OTNhLGO637XTywCTlSsQPWPK1KnWwioYY1uopL06FfKtay6u1YO7zaq1Nl/BLi/x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cb++FGFn; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cb++FGFn"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B291A40C99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768408918; bh=YR7wE92m8b+VtZXSHAA14p3og2uuU3TG64wNzT6CqMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cb++FGFn56nNMECRkhsOiZfSi/OglUZoHGXg+9rrhrjLyUay34uvkvHRZkAMoCY8a
	 H6cf002GcBBZuH8ruO0aIpvJzNZ5mFYPP2cu5vbcz+uEZC4bFJWBn4dStyVLChM/LK
	 hY/y2YE5srJe8cS/+aPbK2Y5S9hQ+E9I2vQGWY5nNU1XgpCuBv5VGOBwR4yHkTmeXV
	 a2nSGqXg/gLd1cmX65/YRvFcJEa7oRO6S6GhWOGTZiWzJfD4CR4Vz4w01Jz7oWgaH3
	 AzS0csMDLEAXd8LtX+0qhuEa8TV/MLxyZ4K1sV9haafG2HKAS+uZmxLQTMdpAfnO1B
	 eC960Gzzp1ztw==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:27b::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id B291A40C99;
	Wed, 14 Jan 2026 16:41:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/2] docs: kdoc: remove support for an external kernel-doc from sphinx
Date: Wed, 14 Jan 2026 09:41:43 -0700
Message-ID: <20260114164146.532916-2-corbet@lwn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114164146.532916-1-corbet@lwn.net>
References: <20260114164146.532916-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ability to build the docs with an external kernel-doc program involves
some truly confusing logic and complicates the task of moving kernel-doc
out of scripts/.  But this feature is not useful for normal documentation
builds, and the external kernel-doc can always be run by hand when it needs
debugging.  So just remove that feature and make life easier.

There is still a bunch of logic to build a command line that we never use;
the idea is to be able to output it, but I'm not sure if that is worth
keeping.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/sphinx/kerneldoc.py | 53 ++++---------------------------
 1 file changed, 6 insertions(+), 47 deletions(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index d8cdf068ef35c..afbab458550a8 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -190,35 +190,7 @@ class KernelDocDirective(Directive):
 
         return cmd
 
-    def run_cmd(self, cmd):
-        """
-        Execute an external kernel-doc command.
-        """
-
-        env = self.state.document.settings.env
-        node = nodes.section()
-
-        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-        out, err = p.communicate()
-
-        out, err = codecs.decode(out, 'utf-8'), codecs.decode(err, 'utf-8')
-
-        if p.returncode != 0:
-            sys.stderr.write(err)
-
-            logger.warning("kernel-doc '%s' failed with return code %d"
-                                % (" ".join(cmd), p.returncode))
-            return [nodes.error(None, nodes.paragraph(text = "kernel-doc missing"))]
-        elif env.config.kerneldoc_verbosity > 0:
-            sys.stderr.write(err)
-
-        filenames = self.parse_args["file_list"]
-        for filename in filenames:
-            self.parse_msg(filename, node, out, cmd)
-
-        return node.children
-
-    def parse_msg(self, filename, node, out, cmd):
+    def parse_msg(self, filename, node, out):
         """
         Handles a kernel-doc output for a given file
         """
@@ -244,7 +216,7 @@ class KernelDocDirective(Directive):
 
         self.do_parse(result, node)
 
-    def run_kdoc(self, cmd, kfiles):
+    def run_kdoc(self, kfiles):
         """
         Execute kernel-doc classes directly instead of running as a separate
         command.
@@ -258,23 +230,17 @@ class KernelDocDirective(Directive):
         filenames = self.parse_args["file_list"]
 
         for filename, out in kfiles.msg(**self.msg_args, filenames=filenames):
-            self.parse_msg(filename, node, out, cmd)
+            self.parse_msg(filename, node, out)
 
         return node.children
 
     def run(self):
-        global kfiles
-
         cmd = self.handle_args()
         if self.verbose >= 1:
             logger.info(cmd_str(cmd))
 
         try:
-            if kfiles:
-                return self.run_kdoc(cmd, kfiles)
-            else:
-                return self.run_cmd(cmd)
-
+            return self.run_kdoc(kfiles)
         except Exception as e:  # pylint: disable=W0703
             logger.warning("kernel-doc '%s' processing failed with: %s" %
                            (cmd_str(cmd), pformat(e)))
@@ -286,15 +252,8 @@ class KernelDocDirective(Directive):
 
 def setup_kfiles(app):
     global kfiles
-
-    kerneldoc_bin = app.env.config.kerneldoc_bin
-
-    if kerneldoc_bin and kerneldoc_bin.endswith("kernel-doc.py"):
-        print("Using Python kernel-doc")
-        out_style = RestFormat()
-        kfiles = KernelFiles(out_style=out_style, logger=logger)
-    else:
-        print(f"Using {kerneldoc_bin}")
+    out_style = RestFormat()
+    kfiles = KernelFiles(out_style=out_style, logger=logger)
 
 
 def setup(app):
-- 
2.52.0

