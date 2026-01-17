Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3182E92C3;
	Sat, 17 Jan 2026 23:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768692427; cv=none; b=k3a2kevY+AL+LlNxvBiEsiiO6aWmk9gyrKrAou0eiub9sNN3kXXbDPpJSrPkP6VsSnQF9ebeH7sxkXERHo6iNv5g/j5QrEudZuh6vp853RqHTSzGT1wTGURuPTJbB2DkotAnKJqv+qBvVwdxg1muuu+Aaz5EheOU8N60IyKcMB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768692427; c=relaxed/simple;
	bh=lJztgpeDqLimNIeL3NINiKQLdhg53c54+i6LgdsTomM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ouYbMW3vsDsuyEyuFna/XyDhxktjppJpc+WlOMyAgQIhAoqA+qTrLH1gDUQ7rxtEx6X8GJhbgYz+MlHbQXiYtHnE10A5vLxoHiH4L6JNZuU/o04JkASqyuQoQPpis6Bsi+MCNJ2XNAH6Qd292FMmT1bvw6Z5cNQIxeeRKo0ubbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=BpSvBvsW; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="BpSvBvsW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768692418;
	bh=lJztgpeDqLimNIeL3NINiKQLdhg53c54+i6LgdsTomM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BpSvBvsWvfWNAfyVo1Yhgbxn0QhXqQ3OjGzNQOcjxubpl4PADOKdTxzYCqwDzWaZc
	 OFZ6rxFnoEiTr0RKCOZ5gSkj9pglxbxFXMZv6eoq6xMDjBcqMEikKVRpAqnFBhTH5s
	 1aNgVEKQQHw6xe1KmYy5r8MAL1Cx9i4PsuFmTydA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Jan 2026 00:26:24 +0100
Subject: [PATCH 4/4] tools/docs: sphinx-build-wrapper: only generate rust
 docs when requested
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-docs-spurious-rust-v1-4-998e14b9ed9e@weissschuh.net>
References: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
In-Reply-To: <20260118-docs-spurious-rust-v1-0-998e14b9ed9e@weissschuh.net>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768692417; l=1454;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=lJztgpeDqLimNIeL3NINiKQLdhg53c54+i6LgdsTomM=;
 b=zZUaVxWdQtmE8zw/iX68qPg735PcUIRXkFnrbX+lYsnaACzxLEFZNCVnKW+4jUHC/aW/nKss0
 FjC2Eoq9pziAOj+jtvZ2oPrgsx4ZbqAsc286QYin+cb/+rNicK+5Ck9
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

When the user explicitly specifies SPHINXDIRS to build a specific
subdirectory it is unexpected that the rust docs are also generated.
Especially as their generation may dominate the execution time.

Only generate the rust docs when they are part of the SPHINXDIRS
requested by the user. 'rust/rustdocs' is not considered, as it is
not a valid SPHINXDIRS anyways.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/docs/sphinx-build-wrapper | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index a3cca4634355..f817497bb706 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -119,12 +119,15 @@ class SphinxBuilder:
 
         return path
 
-    def check_rust(self):
+    def check_rust(self, sphinxdirs):
         """
         Checks if Rust is enabled
         """
         config = os.path.join(self.srctree, ".config")
 
+        if not {'.', 'rust'}.intersection(sphinxdirs):
+            return False
+
         if not os.path.isfile(config):
             return False
 
@@ -691,7 +694,7 @@ class SphinxBuilder:
 
             args.extend(["-D", f"latex_elements.papersize={paper}paper"])
 
-        rustdoc = self.check_rust()
+        rustdoc = self.check_rust(sphinxdirs_list)
         if rustdoc:
             args.extend(["-t", "rustdoc"])
 

-- 
2.52.0

