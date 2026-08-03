Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36896313531;
	Mon,  3 Aug 2026 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767773; cv=none; b=XWZukTGp2q/hWPCJRuInAqEJUMkUWgNuQ9AisyFJf6nWS1TW0kIP9/hSq02hwvfWxyce3Zc/atMDDoF9UiEhO8W/7QpOChPzZYaa2Gt4zNwOwVT7ZA/Hcb7UoCK9wBlVSVFiURVqgwxwlP0ist4pAgaiKlUW4A2N1/n4rtjnLps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767773; c=relaxed/simple;
	bh=5g/mwuiig9YZtnm1eixMjrxi1BjWdUNAaFViwx0HsZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ML+SZrgtmyaOzMZfMXuTMIWWmNVxClKSxdrbjnywPGiCC0rNMI93Sssd3lk8sqp+iyqCHbKpyN2EXVqn3U3N0kbNELy/VaFb7CdbqCryZ3noQdCFaduOOhZhRiD1FlgnFh6wehvbjbj12E+g+PLKMO3L6b0B9XHYY6w1IcGPmPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TTpdkFib; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TTpdkFib"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 977F94E40A32;
	Mon,  3 Aug 2026 14:36:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DBF06029B;
	Mon,  3 Aug 2026 14:36:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A50511C30E6A;
	Mon,  3 Aug 2026 16:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785767769; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mR8L+scK2cgDvcgoDDUwjBiZ+KDLpKNeNDSANbU7N0M=;
	b=TTpdkFibGlWQ0TolDsQ8gg/fKQ6tOc4IfB8PD78Qk3gDiXEjCAN67C9E/ExnZfswTxa8uQ
	jz2dp4cUxzwat9wB4eiPq6GcYZTKhDAXi8oDexazBNpZ/9/jt8voW6XaZ9VJiqwrktUhJX
	TzU83882y4tWwuupmVHdJJAuc4Oz15Jl34wSQTg5kmbtO7V0LhBAdBAljANQUp7ySCXkgK
	WLLPn0hMeEIPPZTjQAXlsOoKKVK+/NZuM1ScrEcUByvpIJMpu647/xMwd3dKbXUjCxLopL
	32ueLoSCgJF9IEv+altNVac1pi2mw1+hwAgm+8uAWtcVqArb/MVc0hmAzekkIQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 03 Aug 2026 16:35:51 +0200
Subject: [PATCH 2/2] Documentation: html: make sidebar section titles bold
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-show-sections-in-sidebar-v1-2-b4fdc847525d@bootlin.com>
References: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com>
In-Reply-To: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=865;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=5g/mwuiig9YZtnm1eixMjrxi1BjWdUNAaFViwx0HsZE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqcKdWnkv0FplLEa/+4DyFLvQr/HchARxKgrOl+
 kijU4F3wvKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanCnVgAKCRDRgEFAKaOo
 NlQKEADPA2m6/H9qGVAjxy5vLpMlSlmw1UnXBrHXO5Wzt7nfIbxLCG8ANrbF1/cH+cBmKi9mM7A
 v62haVKdqGF/UWa9X8eQ/FL6Rc/RtyWMu1SZHE7wnntK7XcxtRj7aGI6wnDVe6lxJ7xL7ScsW99
 NU7jnD4IHDsyRwmnMrU7vDgFNeCJE3k0j2/Fg4eVebOQDGIe4P1DBqhhEpKYVEM4XDrZ8UUKB4h
 WHU0+cOAFanoJLTJiFFNGDmZuG4ol61nFz4qhGQUp9osEK5A+Ce/7sJ3eyQxK1DBRYs6oKFcgsl
 ZcHOEgKATpD5NGYgr1sJWf1dLPNzBjT7lh527WnSNuX3dxcRvlBhkYKYeOE+LM06yH2VwYXV+XZ
 Gb46+tbvIc8dQvSQ0fuJlR7B61JdxDDn+gTzFyE8GmsFfGx4gdXFSJuXj5YDy/jR62qt/9rrV91
 Gec/SRkrz1OJJWd4wWvduiMNLzuO2EWGfmshi61I8knsMZhFjbocHV+Z8GzPEZuOmfMjjgEBspp
 8vk5twLm41Dz7KoS/tJuFymHdk1EqWPCn3KDd0OhmjCK45YEKpq1K5CF8tEZbQkLAsDE1NRq6tR
 MHGriKgKf3ni1d1t01vTw5jpRqgd4K8P1EERJg1hMKgmYDI532rLbyZ3aw1nvvC9yTz13CsvWPJ
 eZVPfFuP1tioCdg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

Now that section titles are displayed in the sidebar, make them bold to
have them stand out compared to the subsection titles.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 Documentation/sphinx-static/custom.css | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 0576d4fcb2a3..3938daf410c3 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -81,6 +81,11 @@ div.kerneltoc li.current ul { background-color: white; }
  */
 section#the-linux-kernel-documentation p.caption { display: none; }
 
+/*
+ * Make section titles bold in the sidebar.
+ */
+div.sphinxsidebar p.caption { font-weight: bold; }
+
 /*
  * The CSS magic to toggle the contents on small screens.
  */

-- 
2.55.0

