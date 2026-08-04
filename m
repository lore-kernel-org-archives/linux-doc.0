Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317C1471D0C;
	Tue,  4 Aug 2026 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859212; cv=none; b=Try5Bvd4Obj542bFuzWK+DyLhTE4gMjVzpvZrk8dW/Oq7gGCOnFK3KvJbWnpXUCgM/T5qdRQTrfFZkakekdt/Cpkeg9rpYMGfuXmHtp0NkhbmhnDenIXCgkL0yR2JqJgagC1LSqRyxeQW1oAmIsFvv5apZMHx5khL9r2jPyo//Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859212; c=relaxed/simple;
	bh=tczW+vIe4YcPaKzy/wFQo8VsC+WbabUQM+DZZjvDOCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dcpySul9+zzWyePVkNl/aUNkqEChn0QUDk2nGSc1psIj/0nYVY27TJufEhmOcMY9VRV3JTyS3qHUPSInUL4qyUhqmZvmFA4xcTKsdS3TXHtihb/4yfRTdlbNMxzKOXo179/v8MxTo13kpTBPGOvPld6bUyBBeURhLUfKj3XkWsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GVUBcd/X; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GVUBcd/X"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4514C4E410E6;
	Tue,  4 Aug 2026 16:00:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0FE516029E;
	Tue,  4 Aug 2026 16:00:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC36111C330DB;
	Tue,  4 Aug 2026 18:00:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785859203; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wXY+31TEoso0l8dIhnSmDNqvnx6Xg68W6dMgSAePoFs=;
	b=GVUBcd/XidoWG7On2W1YKR2P25H/6hdIWtORF1OthBEOoN4S5HltxPBL1/cOwW1f+mG3mw
	vEfMVkwnAReAymIWCXtmeF0fSveuWxBQ5WSTa9k23VcFJOUu976DUlP82wcE9ePIe0ms2B
	NxEQHgsMr0y2LRkDGAMudq1iZVO9/OXII8ZyQYJ6a7D0J4wSA2fBpgvXcuTtD92nQ0xE3g
	VDdZnMhtun6NeSuHNgJpbYRSD65Z24lnpZZ8aAqTzN8fU8JwIP6Ku8Q0eg03d1RZL4e2qm
	THV5tzHY5lqqJFr07X+QQGjGcVnY4RxcPw0V6HyRTo6uAG7VOAIDho65up+q2Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 04 Aug 2026 17:59:35 +0200
Subject: [PATCH v2 2/2] Documentation: html: adjust sidebar section titles
 styling
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-show-sections-in-sidebar-v2-2-a68d23bbc79d@bootlin.com>
References: <20260804-show-sections-in-sidebar-v2-0-a68d23bbc79d@bootlin.com>
In-Reply-To: <20260804-show-sections-in-sidebar-v2-0-a68d23bbc79d@bootlin.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=tczW+vIe4YcPaKzy/wFQo8VsC+WbabUQM+DZZjvDOCM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqcgx2eQn6CjvGFpodt/1/94z3zGPuIKuVF4b9M
 E+4QeUaCh2JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanIMdgAKCRDRgEFAKaOo
 NgMYD/sEvvzwLjUOmnqOq5J794Krq3kWqbeL0IbbSwOSH+D/H3hbKvRzBg+q+QV937PEwLGD1Jg
 WQYknGhOJacc0Sf4OyGnf+XFWVXX1hhsZfPDoY2JF93n1cleBI2NyFQHZb5UoITr50cPrxrmAjW
 lcZnJMW444F245QMUOy2CRG/nZabLfLHnE+cRE3Ow/MtbOFRkPTSVT3Jt5tAwWpI/Ijx42wDPte
 wCl5zXd/oSQrnCfWbYNyXKL1mkuEeaqG3nBj172z/X3LcqdL9Q8MgfccNCBboQy4Qbq8ubYhCUs
 mrWotOawfnUOs2vqqkaNNTHdPFl0GAM9iuxD4rkAUxLUpG2aFidCodLFX2mzWzMHZGdD+6le63s
 v1J8mVLZyLn2YruMGTt2U5oQnxOfVzVKPWGZrSayCWQp+5ptvoH7BxvpuYI+Dc3yo7pYIRd4pE4
 NHYugERu34CRHcQxAU2r4L6njA8Kno46dPhI+dMqRYo9LxKenOfJDSY+OVD55QP5d/pJHQwOlJa
 q3PgRoO0FT9LfhdB9qqU5T36+9NFjnaH2+/XfsWZd+81LdXy4dqjP6puaK7i4JIQfP7/0O7WV/M
 a84VFZbM6gamwmT6bIhXaBk2yHXynC1zXn1T8BNtRiyal/89alyRDb7L/9L9lQZG8prfWdXlrNn
 OEfRJBBkTUgBTaA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

Now that section titles are displayed in the sidebar, make them bold to
have them stand out compared to the subsection titles, and decrease
their bottom margin to group them with their subsections.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 Documentation/sphinx-static/custom.css | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 0576d4fcb2a3..40e4ced963dc 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -81,6 +81,12 @@ div.kerneltoc li.current ul { background-color: white; }
  */
 section#the-linux-kernel-documentation p.caption { display: none; }
 
+/*
+ * Make section titles bold in the sidebar, and decrease their bottom margin to
+ * group them with their subsections.
+ */
+div.sphinxsidebar p.caption { font-weight: bold; margin-bottom: -10px; }
+
 /*
  * The CSS magic to toggle the contents on small screens.
  */

-- 
2.55.0

