Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4928F2E8B87;
	Sat, 17 Jan 2026 23:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768692427; cv=none; b=fMcoa1tUNcSr5EQQ48Wmfj0KI5RPBAu6iCiT285iI7sN5oOomnoE7KpSDvH1rKqQztZTHx7yFMSjWKnkFy+ljWd7g9zYyJkg/4t3CiplT2roWWzE9T+E0xqr5gE/B5eRGQnPwotkgHOIRNzYwid4m2ngynWck1QEyYhxycgjtKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768692427; c=relaxed/simple;
	bh=ii9qu+5l4aZVIH06ic9LZOTxLw3sv2g705JFzfBG91k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VptBMB4yP73ONVFabdy/HtzcoxI9maljsSTr+pwoUYmvchZJ60x+cwXkqQID/NQAEJ7Whl67fsnMjZ1vE9HmWNfMuC8hIgrQmaZJb43vlQYcjbBmLXggvzMml2HP7x3a6U9hQeW12lzRviK9S57y+QckCZzXjWagB1KeUnbAQhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=AlIQ6NN2; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="AlIQ6NN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768692418;
	bh=ii9qu+5l4aZVIH06ic9LZOTxLw3sv2g705JFzfBG91k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AlIQ6NN2BKIvbLYZSr1s9kbqEa2Yo/BG4zIND1CfvMOM15II++7u+9yKR2IOmjP9u
	 XhXqDYIFiToHINbUv9WK7huipTG12sweQiARsYXHMLYkuzzDIkQ4VAp0q2X74xm4C/
	 xkZ620GfVemGjDKG2GVjheRs880Oxy2d4MYsJXIM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Jan 2026 00:26:21 +0100
Subject: [PATCH 1/4] tools/docs: sphinx-build-wrapper: generate rust docs
 only once
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-docs-spurious-rust-v1-1-998e14b9ed9e@weissschuh.net>
References: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
In-Reply-To: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768692417; l=2322;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ii9qu+5l4aZVIH06ic9LZOTxLw3sv2g705JFzfBG91k=;
 b=nvKBT0gePqCVj+muxGNG2/DpCj/nI/Cjz4PzUXWzH3a+q3M2Q1Pt4auEJXegy/N9Jlv21Iku8
 ZnGl+XcN7CbBaQiG7gYq9l2i02gvpTBCfC66jeyW2LitGNTNhY4169b
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Currently the rust docs are generated for each entry in SPHINXDIRS.
This is unnecessary as they will be the same for each one.

Move the generation, so it is executed only once.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/docs/sphinx-build-wrapper | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 7a5fcef25429..4ce655a31061 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -352,23 +352,6 @@ class SphinxBuilder:
             except (OSError, IOError) as e:
                 print(f"Warning: Failed to copy CSS: {e}", file=sys.stderr)
 
-        if self.rustdoc:
-            print("Building rust docs")
-            if "MAKE" in self.env:
-                cmd = [self.env["MAKE"]]
-            else:
-                cmd = ["make", "LLVM=1"]
-
-            cmd += [ "rustdoc"]
-            if self.verbose:
-                print(" ".join(cmd))
-
-            try:
-                subprocess.run(cmd, check=True)
-            except subprocess.CalledProcessError as e:
-                print(f"Ignored errors when building rustdoc: {e}. Is RUST enabled?",
-                      file=sys.stderr)
-
     def build_pdf_file(self, latex_cmd, from_dir, path):
         """Builds a single pdf file using latex_cmd"""
         try:
@@ -786,6 +769,23 @@ class SphinxBuilder:
         elif target == "infodocs":
             self.handle_info(output_dirs)
 
+        if self.rustdoc and target in ["htmldocs", "epubdocs"]:
+            print("Building rust docs")
+            if "MAKE" in self.env:
+                cmd = [self.env["MAKE"]]
+            else:
+                cmd = ["make", "LLVM=1"]
+
+            cmd += [ "rustdoc"]
+            if self.verbose:
+                print(" ".join(cmd))
+
+            try:
+                subprocess.run(cmd, check=True)
+            except subprocess.CalledProcessError as e:
+                print(f"Ignored errors when building rustdoc: {e}. Is RUST enabled?",
+                      file=sys.stderr)
+
 def jobs_type(value):
     """
     Handle valid values for -j. Accepts Sphinx "-jauto", plus a number

-- 
2.52.0

