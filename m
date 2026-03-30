Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FBD391841;
	Mon, 30 Mar 2026 05:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848140; cv=pass; b=VUNfHrC6BfeoO4GJchuHm/TaIcoiH4rNGhLkT8gMA+vxXHQvoA/6EZ1mwr2MQFdAlDg2fG9UvQKmtST9wnw9PXJUOs6hdTFsU8RZpPYg7eHgCKQCAqHgH+ee9voQRVMEaonX5xFZaNATwsFTEYIV2032TwaXwWBV7GZcj47FzGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848140; c=relaxed/simple;
	bh=5rYTVTma6Uy6vQC3F3yXqsq5CHaFyJVJZXzcXVBNUU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXH4M8yWVkAiGgLytQpY/IbtSFu33DWg9TYguQ0V06AUlRySoVreDF5/s+1C4uw0bvGZ9z2Cv1i1MtgAaEFJCDZUejo24SBTAPcdW1L808xlkEWIAScCbnFIHR8H+PdkKtdCpiBVVDy0h1y8x2Jv5hF1nz9lEb5JALHzF8BtNNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=WHODLymT; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="WHODLymT"
ARC-Seal: i=1; a=rsa-sha256; t=1774848133; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Tn8H1jBLAZOGjexs9TgNPcR3WrNpXpfQku8a2KEeobqbf0TbEs3/QEEBltjlC3IVElTplZ9jsiHc5EibvGQWueIOndU2pYuFYaqlI4p0tRRLgOF9sAPwbQkces3aVOb5TSCuoFKureW42PXN7UZQ6qA6uH4akbyJY0ZjTYXF91U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774848133; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cHAGynTNfEGld8u6IYGbQOtvPPVBq7wEREHT6O7u4SY=; 
	b=MlLFQ22vQYGX6QQezc0LQUt2FP6Yp/628BnLYDHRZpzXkzOAI7wZy/Uc78LEDGuj7YMlBg6/qdnTe053LN6gL5kATIjKIj6Q7hta+5hmKApMNz8r3xnDudRQs5MwyYA7F+oO7LmDn1b0ul4W0ivZzXaPvVJ6U3AuMEo/sBoy+V0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774848133;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=cHAGynTNfEGld8u6IYGbQOtvPPVBq7wEREHT6O7u4SY=;
	b=WHODLymTOcqW9Xe+8VTKY/0Tj84yKC/JdWeifFwHzEAWvi9CFvydXPtVvbyr0C6G
	Y3jj+u3AusA6UKfJKUX5wfNJUA9KQlJd7hXlrR1DXQscNmXM0+ysoHm6Vj8qySiu1LN
	3OvDoBBURm2UHTh6QktmBDpoTmCRnq40o2Urqm10=
Received: by mx.zohomail.com with SMTPS id 1774848130725965.6858563384212;
	Sun, 29 Mar 2026 22:22:10 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 2/3] docs: restore left padding in preformatted blocks
Date: Mon, 30 Mar 2026 01:21:58 -0400
Message-ID: <20260330052159.11284-3-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260330052159.11284-1-rito@ritovision.com>
References: <20260330052159.11284-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Restore a small amount of left padding to preformatted blocks.

This improves readability because the preformatted block and its
container use different background colors, and when the first
character sits too close to that contrasting edge it is harder to
read.

This only changes the rendered left padding around the block. It
does not change the code itself or what gets copied from it.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
 Documentation/sphinx-static/custom.css | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 6ba3e48bf..64ea94879 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -50,7 +50,8 @@ div.kernelindent { margin-left: 2em; margin-right: 4em; }
 dl.py { margin-top: 2em; background-color: #ecf0f3; }
 dl.py.class { margin-left: 2em; text-indent: -2em; padding-left: 2em; }
 dl.py.method, dl.py.attribute { margin-left: 2em; text-indent: -2em; }
-dl.py li, pre { text-indent: 0em; padding-left: 0 !important; }
+dl.py li { text-indent: 0em; }
+pre { text-indent: 0em; padding-left: 10px !important; }
 
 /*
  * Tweaks for our local TOC
-- 
2.51.0

