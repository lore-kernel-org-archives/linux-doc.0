Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BF91DFF8
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 17:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748971230; cv=none; b=Tm9Xmm2y4zOMCh76UN7/u5BfYkZriKwyT3/OUtI5k3F9/IVAJo/eqNYDj2oE+mONxHqVEhfO+MdLklrp88sLYJuAL1u3sxcPUpqdDIeNlu8taucbMDRc/J1ET3opZRPHJOjQUgezpSO2UI4hxrHvUmGpiITWtDXjpBV5Cb4CNJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748971230; c=relaxed/simple;
	bh=+a96x4qCcLONpKPVLqd5O6DuGJuz/bwHQkJfeNsBd+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WYTLb15l5mi1a+ghO7trYGzBw8Di5bF9yNdSpPa0YbuFWBaMRGXIur2V68mKOJD0jXF9BjKr1FW4Bq2MHm2U5rgFbfUSE86QHOzNw8dlqZzwzekmF17Rk1aqdUy4GtIFx+KFN+JS5gh5WeRT5TwBhDAUauv0bOZ5qPoFaORVrRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=n7vrhJ2l; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="n7vrhJ2l"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D75B241A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748971218; bh=v1CTUTzQXasM6aZMK+xUtrnm/hlVGMeELhcmQVJJgXY=;
	h=From:To:Cc:Subject:Date:From;
	b=n7vrhJ2lLG1254Pm87X+ExFpaKINfxPpQnKRJ+XQgbIDR3ngCG9B3hyhURYrDe0Bu
	 FViyw/7Nci4SEZG747NCWlD9oFzg6aNlEGTv+GqoP7o/jYQx9b7ls6DwkQD9rlCiuY
	 wt1WLQ+z8aL3zQBeBig31C2Ke4jRxahvMXU29nB1ttbsNUGkinur1wCICeB0hwdpvR
	 hCWsw0D2y4wUSSXxHixDebdn8NUEOfxPeJp+y1B0ZUnfJY3mCm6Amc6iO0jprvW2Ll
	 2iSMdO1iwloMRXOi/gC31dnOwJyZBCmbpLpzvSxj9havqAfpV1v/IQgvxJjlwAm1rn
	 +bIaFeMdMSv1A==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D75B241A90;
	Tue,  3 Jun 2025 17:20:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, =?utf-8?Q?N=C3=ADcolas_F?=
 =?utf-8?Q?=2E_R=2E_A=2E_Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH] docs: automarkup: Mark up undocumented entities too
Date: Tue, 03 Jun 2025 11:20:16 -0600
Message-ID: <87cybklp2n.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The automarkup code generates markup and a cross-reference links for
functions, structs, etc. for which it finds kerneldoc documentation.
Undocumented entities are left untouched; that creates an inconsistent
reading experience and has caused some writers to go to extra measures to
cause the markup to happen.

Mark up detected C entities regardless of whether they are documented.
Change the CSS, though, to underline the entities that actually link to
documentation, making our docs a bit more consistent with longstanding WWW
practice and allowing readers to tell the difference.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/sphinx-static/custom.css | 5 +++++
 Documentation/sphinx/automarkup.py     | 9 +++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index f4285417c71a..771984f77307 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -136,3 +136,8 @@ div.language-selection:hover ul {
 div.language-selection ul li:hover {
     background: #dddddd;
 }
+
+/* Mark xrefs with an underline, but elide it for those that
+   don't lead anywhere */
+.xref { text-decoration: underline; }
+.broken_xref { text-decoration: none !important; }
diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index 347de81c1ab7..cede07e758a7 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -241,8 +241,13 @@ def add_and_resolve_xref(app, docname, domain, reftype, target, contnode=None):
 
     if xref:
         return xref
-
-    return None
+    #
+    # We didn't find the xref; if a container node was supplied,
+    # mark it as a broken xref
+    #
+    if contnode:
+        contnode.set_class("broken_xref")
+    return contnode
 
 #
 # Variant of markup_abi_ref() that warns whan a reference is not found
-- 
2.49.0

