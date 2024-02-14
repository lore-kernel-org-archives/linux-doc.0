Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FEF12836B
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 23:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707953154; cv=none; b=udjQ54FnkFbhDeHrwaUza/8HGrLHWwhrBFpsWUxLDOttp2OZx5UxZWcy2h/nidF5GbCNXXWW1yY4KtfdkD8x4O56GAu7xS7Pv3tbsAvB++1As8Pprm+j7yuqCkIHKnWRzsilUM9Gw74R6uKu1dN1B9hI7sxNWKg0MGI8x2NP/lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707953154; c=relaxed/simple;
	bh=u9TmbgzbdMVQWaMAA/4lFS+EMCGqgKwz9P8Vte1hn9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BAh6hexSf+mm9nh8Tz6MAa+0p2H2SX8EaTcQ0WaBBOPQFl9Ll6BqRhoB7u3D+ZUhfLxIcJBPdwbsStco0Wzfq4M5d5A62gX34OF5JpH3mJoUtlrVEAXmbBL9Rd7pKVc0yCcPF7Ho6TcA91sN6q+ZMtK0/AZQYVXQ+/LGgxYKpC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gwHiyfom; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gwHiyfom"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8CA0C42A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707953151; bh=VIaPrx0apvDcfjnXkeHQ2hOWq6T4ytDPUjkNcKtfRYQ=;
	h=From:To:Cc:Subject:Date:From;
	b=gwHiyfomIqd/vy80ePxY3NJ9FP2+itFuSdIbFi29ict5PZ28PVz3hDRuNm+onuHU8
	 5iIlRcapy1YKffgaYS+couGTS8ic7i56sh664qXVoZBWcqIuI+7EpYjgpeHC9FcMT1
	 OfYyx3nSp2AelwPf+tprGLN/kq8VInWdPuesa2DczOIygaV1tON76+6y9yb/9Xf27v
	 WDYRHBDSDcCqiayHTYAoO/TRyu6l2YGnbiaVln/XPSvCqtDAO+J8yrNefhJYMpkClo
	 T42BxQqjYHKVYHi3FGGfrqz1nhuvKXQVllGgpDlOTg590cVAgdPmcMHzAdDmjTKHfe
	 v8goJVsOgEJvQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8CA0C42A45;
	Wed, 14 Feb 2024 23:25:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: Only load the translations extension for HTML output
Date: Wed, 14 Feb 2024 16:25:50 -0700
Message-ID: <87sf1uy6f5.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

This extension brings no value for other output formats and can create
problems with the pdfdocs build.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/conf.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 5830b01c5642..6071d3e24375 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -55,7 +55,13 @@ needs_sphinx = '2.4.4'
 extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
               'kfigure', 'sphinx.ext.ifconfig', 'automarkup',
               'maintainers_include', 'sphinx.ext.autosectionlabel',
-              'kernel_abi', 'kernel_feat', 'translations']
+              'kernel_abi', 'kernel_feat']
+#
+# Only enable the translation extension if we are building the HTML docs;
+# it brings no value otherwise and can cause problems.
+#
+if 'html' in sys.argv:
+    extensions.append('translations')
 
 if major >= 3:
     if (major > 3) or (minor > 0 or patch >= 2):
-- 
2.43.0

