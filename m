Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6163859CB
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 05:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995799; cv=none; b=Eiwvm56kh+UV5+Lgm9+RSpdfmWbPiNwepKGpJrFNbgAsYOXiWwBYRoBUMFcdhq5eYqIFCC75hgBlhXuyhVyAsbI6HZXm+UxtFqFtOdw/uYRR5H1XXWZghzQLYNhDcda6gtBGmmfsJX0sbpP1d8TP7s1gpJl/YFOsgb8e2QOiufI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995799; c=relaxed/simple;
	bh=zcXwyVPyYyp6blNC8r+1sq7Eyu0B6E5u1Pina24UyXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CUBJpkAqDwZh0AXZeRR8DoOZ31LlzpM1G5C/7qiBmKJKtfXt/LXJK1p51qtxKNbI9D22r99Gv3Zr7jWlPY2EwFUeEcugQIJKvZ2yXrv8enjp2RovQ8gQGxKHQ7PTuZdOTIT2j/aifoz5Egvqu9mAfEcPwWw8AgM5mstcjK7Op5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gGlZSrPr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gGlZSrPr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WmNtb2U90SeACaCtf+TRb3irrazU6iXL3r1FBoPE87k=; b=gGlZSrPr++T24J9iSAfBODlU43
	qPwmiieuVqtnXiAg6xzkhyf3wdeHp+U3UVYX9VtipkqKSNWp+iI+f6M1Wzw1j804Vc5Le7L2/L9Vb
	jlK6pXWOfEmvYA7aT9khKDh3QFEIo3nws+MjePxItlPcOzaFS/y/J+TYbfUc1JdKRj0PO0tfo0MVd
	K4K7hj+4dh+GV2Ux4TbhZ5x7FmnJ7MEhwfduixjW6JjniX4fbRiV7B5tIT/HGS6peLU0PE/vOOHKg
	/8/pbsSZfWqEZroIFMJGSVF75Emh49WuBBmYCrT5HTJKgund4E/jsFgDxq1f4+BBW7+0qTpeJaFiP
	yFBRexyg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrr5n-0000000507W-37kR;
	Thu, 06 Aug 2026 05:56:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] doc tools: fix 'path' typos
Date: Wed,  5 Aug 2026 22:56:34 -0700
Message-ID: <20260806055634.1293294-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "patch" or "patches" to "path" or "paths" in comments.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>

 tools/docs/documentation-file-ref-check |    2 +-
 tools/docs/sphinx-build-wrapper         |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20260805.orig/tools/docs/documentation-file-ref-check
+++ linux-next-20260805/tools/docs/documentation-file-ref-check
@@ -143,7 +143,7 @@ while (<IN>) {
 		# Check if exists, evaluating wildcards
 		next if (grep -e, glob("$ref $fulref"));
 
-		# Accept relative Documentation patches for tools/
+		# Accept relative Documentation paths for tools/
 		if ($f =~ m/tools/) {
 			my $path = $f;
 			$path =~ s,(.*)/.*,$1,;
--- linux-next-20260805.orig/tools/docs/sphinx-build-wrapper
+++ linux-next-20260805/tools/docs/sphinx-build-wrapper
@@ -99,9 +99,9 @@ class SphinxBuilder:
 
     def get_path(self, path, use_cwd=False, abs_path=False):
         """
-        Ancillary routine to handle patches the right way, as shell does.
+        Ancillary routine to handle paths the right way, as shell does.
 
-        It first expands "~" and "~user". Then, if patch is not absolute,
+        It first expands "~" and "~user". Then, if path is not absolute,
         join self.srctree. Finally, if requested, convert to abspath.
         """
 
