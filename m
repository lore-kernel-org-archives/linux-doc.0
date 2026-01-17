Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274342EB87D;
	Sat, 17 Jan 2026 23:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768692428; cv=none; b=S95z3qOMat9+HqhhuxnY4T44jEBPgOdUvymOvIkwPm8xs24tVtVZ/exMk9g8IllQIw+Pj0bNWfrbOZ5xQt9boZv0T7JyYtUk3zoc49moxMco/dna258shL2JkK6iR/ZbCsYc13r3SBIa5+DfcsePFEWszf4N3f2CWzkDcGQPiZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768692428; c=relaxed/simple;
	bh=iu/Nqtn8dRHZka2LF2nKKKy85TSJtks1y7TCW8Th124=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nTF91VO9h8t9j6xPG0UUFFmU2XOpnn8k08mONtSK3jz20hPzyOKIKNJt8APg4foIcn0fhZkmDm6F7dtqLn3j+Tg8zs5M10xC/fmDs/uZYw+lsIXRgeDPFJ204eAF5Gviivz18mKQ7qr7GRtiBxtXYdqC2eIOf6FXGBdQ+R32JFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=eX5xZY3s; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="eX5xZY3s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768692418;
	bh=iu/Nqtn8dRHZka2LF2nKKKy85TSJtks1y7TCW8Th124=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eX5xZY3sWyPyYTNGvJbMLmgGiFh9EpZlKnWtuqWjKd8LnTXDnfCO3likfmF4B86EV
	 ReLJliukwII2tdxTFY9NYV45oS/vg49ZIc7gxPwjwuCWZs6q6h9h1RCo0AwNE1hE5E
	 7Nuh4bJPDANr4SoE/LWaxf+mjUm3oKpFi36TSBWI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Jan 2026 00:26:23 +0100
Subject: [PATCH 3/4] tools/docs: sphinx-build-wrapper: compute
 sphinxdirs_list earlier
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-docs-spurious-rust-v1-3-998e14b9ed9e@weissschuh.net>
References: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
In-Reply-To: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768692417; l=2099;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=iu/Nqtn8dRHZka2LF2nKKKy85TSJtks1y7TCW8Th124=;
 b=zXEe6SzFXRWnNwB4HN3W+DDTGVVMHeECkvCg8P3tXadQlS+RIDtCXGP5H12Oy2praJKD82xc1
 w6XvSVoDu5SCk7BI0TGidiqsNConUaAZ3GMkbaSU1PhjmXyJSKQGbbT
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

An upcoming patch will require sphinxdirs_list to be available before
the call to check_rust().

Move it up in the function.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/docs/sphinx-build-wrapper | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 5f956c289c02..a3cca4634355 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -670,6 +670,19 @@ class SphinxBuilder:
         if kerneldoc.startswith(self.srctree):
             kerneldoc = os.path.relpath(kerneldoc, self.srctree)
 
+        if not sphinxdirs:
+            sphinxdirs = os.environ.get("SPHINXDIRS", ".")
+
+        #
+        # sphinxdirs can be a list or a whitespace-separated string
+        #
+        sphinxdirs_list = []
+        for sphinxdir in sphinxdirs:
+            if isinstance(sphinxdir, list):
+                sphinxdirs_list += sphinxdir
+            else:
+                sphinxdirs_list += sphinxdir.split()
+
         args = [ "-b", builder, "-c", docs_dir ]
 
         if builder == "latex":
@@ -682,9 +695,6 @@ class SphinxBuilder:
         if rustdoc:
             args.extend(["-t", "rustdoc"])
 
-        if not sphinxdirs:
-            sphinxdirs = os.environ.get("SPHINXDIRS", ".")
-
         #
         # The sphinx-build tool has a bug: internally, it tries to set
         # locale with locale.setlocale(locale.LC_ALL, ''). This causes a
@@ -695,16 +705,6 @@ class SphinxBuilder:
         except locale.Error:
             self.env["LC_ALL"] = "C"
 
-        #
-        # sphinxdirs can be a list or a whitespace-separated string
-        #
-        sphinxdirs_list = []
-        for sphinxdir in sphinxdirs:
-            if isinstance(sphinxdir, list):
-                sphinxdirs_list += sphinxdir
-            else:
-                sphinxdirs_list += sphinxdir.split()
-
         #
         # Step 1:  Build each directory in separate.
         #

-- 
2.52.0

