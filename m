Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2426057F
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 21:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750368419; cv=none; b=gXqrgaAv6MpO3Um8II1DwI1VEfptaFLgJOiObNyWQi14Pti/7vSKROQeuL7En5AXNhd3paMcShjyZAZgYYE8HOzQxAbas/oAd4Ntcr+zE6Cy59CEOu335YvLNaUViHh962KqsYrXlek6u+culvPCv1hk2741Izs022mTDMvIVs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750368419; c=relaxed/simple;
	bh=/xi7G6RJ7M0j4FIreXqDgeDCYrw4DL6x9wQq0lTn0UU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L4OxQm5YPtfN3ehXCe+lQVssXuD6VCoA/jF0Gak4KxLiUy7ut3DD4LBSfiJN0Hmb8oQuBnYUX19ZuT8MEqP/6j3At5PyYXKa+/DkHTsraAF9aDKDRRpsB9ker1xP+eMJSAAGfLLRhSEpnci/IvlbwwWVAlDYWdTW8w1Jvc0CjQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=YJR+uGW0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YJR+uGW0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 61235403AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750368417; bh=mGzRp6/ZDmxG7QxtRB9s35R9GVwQQ2qOdPWd5sRRCNo=;
	h=From:To:Cc:Subject:Date:From;
	b=YJR+uGW0DPs1P6AagbqfsrrUr0NsGUgLd31qG6w8DXcqJ2DPMdiKQbMzVoI3ROF4n
	 iWHHFArYIEvCkwSWoyF8P+6k3q1mwy9qHkRZx1V9i4WTm1eWYcEe0XRL9i2e2Uv0Yq
	 uu85pTUYQeLT6rT61jd8MEWCNlJXIUqsrIoSoDYrYPy9AGm8hcjAFLtXki41GZarzF
	 dgMZfYQsLcAKayGs5mVYQwQ9zuElyoA+qO+1mtz1jSditiy2mRLMSgcxh44dqa2ded
	 59kRdpshgZfxdy3UFt29BpSfwa3rwCGo2MdINFvCv8TdYR0GtvlO8FtZAkPOF9IHGb
	 rT3W08g64dOlg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 61235403AB;
	Thu, 19 Jun 2025 21:26:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Akira Yokosawa
 <akiyks@gmail.com>
Subject: docs: sphinx: avoid using the deprecated node.set_class()
Date: Thu, 19 Jun 2025 15:26:56 -0600
Message-ID: <87wm97fmn3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Docutils emits a deprecation warning when the set_class() element method is
used; that warning disappears into the ether, but it also causes a crash
with docutils 0.19 when combined with certain versions of Sphinx.

Avoid the deprecated function and just append directly to the "classes"
attribute like the documentation says instead.

Reported-by: Akira Yokosawa <akiyks@gmail.com>
Fixes: d6d1df92c25f ("docs: automarkup: Mark up undocumented entities too")
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
TODO for the future: figure out where the warning is going

 Documentation/sphinx/automarkup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index e67eb8e19c22..563033f764bb 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -240,7 +240,7 @@ def add_and_resolve_xref(app, docname, domain, reftype, target, contnode=None):
     # mark it as a broken xref
     #
     if contnode:
-        contnode.set_class("broken_xref")
+        contnode['classes'].append("broken_xref")
     return contnode
 
 #
-- 
2.49.0

