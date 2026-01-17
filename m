Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274AA2EC0B0;
	Sat, 17 Jan 2026 23:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768692427; cv=none; b=fxnNqyUh7izD9CMzRDpmEkMn14Q06PFlODdAxm7vnPfge2v3kqqoGap8bPOhvf4Oi4F1mPBbNkOhmYIpxAhdw9bpMKYRQlMR9RZe/2bsWjBf1Q9K6jkRz0a/k3AzWMoiHGaj+vY5dPbW/39PCbLLTlh/rrIEHJmy4G3nZTtiCuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768692427; c=relaxed/simple;
	bh=jVwVOTQBl/8pg8Q675QHinGDembb460plAvRVUlOeJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BtSG8cj05yF05n28MVGZl9lztXqxPMQjfyF+KEX/vmbe2qDJmnwFsxE0/UG9jF79zN0gK+xPF1e2qmGhbqXnbLJnY8FbjKM2z0x+UfdWWSnlu9JLBsSRBeP9wWQdHGcAuUgNiHy15yl4A59S7BcZoxpOIbZuF5kJ2Yqrr86B/Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=sfzaN0PW; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="sfzaN0PW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768692418;
	bh=jVwVOTQBl/8pg8Q675QHinGDembb460plAvRVUlOeJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sfzaN0PW/VCHvFbpI7JqhG/4LEfODtgO8+x9AsOuKX1ocgKGOraipCjkTR/3H7QbS
	 u1KG8XugVt2LeoShRY/2jlI2LCN4tmmAx98K9NamTO1s6LKS8lf4o/h3UGiVwjpEnn
	 PpxvTQf910UvCrD/cm3PY7SYyA/A7RXlAVr1lJGw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Jan 2026 00:26:22 +0100
Subject: [PATCH 2/4] tools/docs: sphinx-build-wrapper: make 'rustdoc' a
 local variable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-docs-spurious-rust-v1-2-998e14b9ed9e@weissschuh.net>
References: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
In-Reply-To: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768692417; l=2248;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jVwVOTQBl/8pg8Q675QHinGDembb460plAvRVUlOeJ4=;
 b=Ph5skPcHPojUYZ672d+uOXWvp9aPeFNjhkENu4bZ5euGJvsZUW/WvERslLz3ru2anrNaDCNLR
 R3RIDyieyZcCNxv+F9Nvh+LEvE4CyDKRqqbjT0MXKxjX0MPES5RH6IJ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

All users of this variable are now in the same method.

Demote the instance variable to a local one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/docs/sphinx-build-wrapper | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 4ce655a31061..5f956c289c02 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -123,12 +123,10 @@ class SphinxBuilder:
         """
         Checks if Rust is enabled
         """
-        self.rustdoc = False
-
         config = os.path.join(self.srctree, ".config")
 
         if not os.path.isfile(config):
-            return
+            return False
 
         re_rust = re.compile(r"CONFIG_RUST=(m|y)")
 
@@ -136,11 +134,13 @@ class SphinxBuilder:
             with open(config, "r", encoding="utf-8") as fp:
                 for line in fp:
                     if re_rust.match(line):
-                        self.rustdoc = True
-                        return
+                        return True
 
         except OSError as e:
             print(f"Failed to open {config}", file=sys.stderr)
+            return False
+
+        return False
 
     def get_sphinx_extra_opts(self, n_jobs):
         """
@@ -259,8 +259,6 @@ class SphinxBuilder:
 
         self.get_sphinx_extra_opts(n_jobs)
 
-        self.check_rust()
-
         #
         # If venv command line argument is specified, run Sphinx from venv
         #
@@ -680,7 +678,8 @@ class SphinxBuilder:
 
             args.extend(["-D", f"latex_elements.papersize={paper}paper"])
 
-        if self.rustdoc:
+        rustdoc = self.check_rust()
+        if rustdoc:
             args.extend(["-t", "rustdoc"])
 
         if not sphinxdirs:
@@ -769,7 +768,7 @@ class SphinxBuilder:
         elif target == "infodocs":
             self.handle_info(output_dirs)
 
-        if self.rustdoc and target in ["htmldocs", "epubdocs"]:
+        if rustdoc and target in ["htmldocs", "epubdocs"]:
             print("Building rust docs")
             if "MAKE" in self.env:
                 cmd = [self.env["MAKE"]]

-- 
2.52.0

