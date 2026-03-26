Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E812156661;
	Thu, 26 Mar 2026 00:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774486703; cv=pass; b=i7MUA6YFnA1c0W3cVJN5G1i8YxC+KOzXsIGv1viRvwFXkgp09at6AMKXWmpfHFdnRUI5f0T0+hYJ7K93Bynx28VsSpXp53exeJWQ0dsa2y5hE22rkfpIGX2EgmRkiAtH27/KJ8zMK3cV6x8cgmotMdsSOyN35z1xHn6Lt35CJDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774486703; c=relaxed/simple;
	bh=G1d1iYAMv83x6Z+HHzvbxxqM/p/wddbh415nh1/FwIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBv8G7zk1QBOHOj6p413u17LUj6NnQn5WnnkWC+7R+L+O+eibbQvTQNerPwpeEnVqdDNPbcSL9CiHvB9foZQipU62pvv1p42JiYS+/Dwzqdi6LYPG446ggbgToat1domyhBxOS6LNSx5yUdlHXLPhkDytuGNjsUM2OSVj6vokxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=cRaDbWkp; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="cRaDbWkp"
ARC-Seal: i=1; a=rsa-sha256; t=1774486698; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YkD9RYGZxraKQsOOsD7ZX7MirOVPsqRZakTVCsEdnLRjmS4TNB/pI2P68DGj4K+rYjRczb3Ed+oJrELWXVb7AVS4GK0r+pVuS4I98eyNT+60OTGNzetV/YRBpzJ5SodsV5dMUwJANdAgWAb2yQrMUDIYWiMxm2KXQCTbRXdjy/8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774486698; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=66rQVep0POMZsf11pUyAA3yPnpmkzd/eG9sxpnF/Px8=; 
	b=hkAtsfQX3/xegrrpXeQQrq2RAuxJhTBYtO9seUHX302393scgvtsyZOYmUpbkofT5yLzjHeA0HPI9csAYYEONtbYhNCJ+ZbrwjSKg3iihrEc9c/usytfAg+CEa/LpNb7AFrH+70yCZD4N5xyMUO9EJpDO0ESGiYWuwGJhnjUy3U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774486697;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=66rQVep0POMZsf11pUyAA3yPnpmkzd/eG9sxpnF/Px8=;
	b=cRaDbWkpPiPv1EWd/h4rjHu1w8v/NCuxgLndHOdRL6j/Nds70ZKrsmL2gt3DED7m
	drnoy+JhHnC3bO3+GndXcUhTXIUdtr8RJPDnXmJpvVp3cCur6VpYkmseyPKgNdi+Suk
	U/FptcTBVT/lU3sai1CNcrIT+lGx39fm2pW7lVdU=
Received: by mx.zohomail.com with SMTPS id 177448669629650.862769396286126;
	Wed, 25 Mar 2026 17:58:16 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v3] docs: restore and reflow footer on narrow screens
Date: Wed, 25 Mar 2026 20:58:11 -0400
Message-ID: <20260326005811.116154-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321131857.14166-1-rito@ritovision.com>
References: <20260321131857.14166-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Alabaster hides the documentation footer below its 65em breakpoint.

Add a local override in custom.css so the footer remains visible on
narrow screens. Adjust its layout to better fit mobile screens without
the sidebar.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v3: switch to a CSS-only override; no footer replacement

 Documentation/sphinx-static/custom.css | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..397780b39 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -169,3 +169,12 @@ a.manpage {
 	font-weight: bold;
 	font-family: "Courier New", Courier, monospace;
 }
+
+@media screen and (max-width: 65em) {
+    div.footer {
+        display: block;
+        width: auto;
+        margin: 30px 0 0px 0;
+        text-align: center;
+    }
+}
-- 
2.51.0
