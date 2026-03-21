Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F432391820;
	Sat, 21 Mar 2026 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774104549; cv=pass; b=MWxsaPNKg/J3qYqdjF/QBbkX8FYXFl5UpGv3trUo6IuKyE/MejeTBym/Gc7OuvDq8Jen+ZsD6/OEPVbS4jfAwnJ8vPinAkoK2eO7AnMmODFtMYg2s97CE0SCq6RGrcEtzm3roUwgNzthpBj6wMRnhqUujwY2AXgJ0d2FHYFB5wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774104549; c=relaxed/simple;
	bh=aItZU+IvDgcn2ppDEzpMiy3YejpbbsfYwa5WJez32AM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpdJcxilj50novWV2yI3vqW8MNlGl72stQbVxES2uGlEEownHj7tPmvOzTeZo5JDw4GWfjz+LhhNDqt0FdWmhYCiQII2xj1J+3bPAwmxvwzuPStpE2NeBRLpyKKmJfyQLrFQCikom1jegVlSdpcvRZabKCCY7yS3bLiJyl1H8NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=gtdHTwt2; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="gtdHTwt2"
ARC-Seal: i=1; a=rsa-sha256; t=1774104542; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L67O9yMqzas7ARnoJeCvSiFBN0msa0Vq5vOacPsnbLRofYO26mr4uYbSllqtI5dIHpe0KOcXhaoocQcVu3GnL4ecG0dZ+mXeHmsnLYa4gCGC2RdTZ+9+mfJho9NvWihTNPZqZG+G0l4zhCsYOqch2Xj+SZI46MZJepSaSHg13Xo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774104542; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sd/mqd92O4Q/Srd9ZhYTTteiJPO3GaXQhN5YFKLMGfg=; 
	b=BSXXMWFY8TgUeoCBmJ6GDv0PPAxmekGVvqIh0UeJtjgmB/EA+VugDOEGHRRRq2MnHl86n/rQ+JXbSHVG8WKSjJ5/audZo9uTXtujq4rcGnlDTQ93tPLFbfsKimLN4/wY8FUsIlh2IVCf7BIAF2T09JXR86dW9sq2XGWuFTvyMVE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774104542;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sd/mqd92O4Q/Srd9ZhYTTteiJPO3GaXQhN5YFKLMGfg=;
	b=gtdHTwt2uc35u/TIy0Uhdgg7yg/LghKMHBWd0wMcjqmVKgb19t97sb6VAH/4JjkL
	PzgeczK6unB29JfpHQIuLaLJy6gk5b5GATby5QEAc65q3MO8p0tsndKXKDrVNipSMNN
	4tL2wLg2adAU4asDfI0/Cq410xf3u4TP58uEj+6o=
Received: by mx.zohomail.com with SMTPS id 1774104541130642.0490147126196;
	Sat, 21 Mar 2026 07:49:01 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 1/1] docs: allow long unbroken headings to wrap and prevent overflow
Date: Sat, 21 Mar 2026 10:48:55 -0400
Message-ID: <20260321144855.30429-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321144855.30429-1-rito@ritovision.com>
References: <20260321144855.30429-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some documentation pages contain long headings with unbroken strings
that can exceed the content width and cause page-wide horizontal
overflow.

Allow headings to wrap when needed so they stay within the content
column and do not break page layout.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
---
 Documentation/sphinx-static/custom.css | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..14711c7be 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -8,6 +8,13 @@ div.body h1 { font-size: 180%; }
 div.body h2 { font-size: 150%; }
 div.body h3 { font-size: 130%; }
 div.body h4 { font-size: 110%; }
+/*
+ * Let long headings wrap before they overflow page layout.
+ */
+div.body h1, div.body h2, div.body h3, div.body h4,
+div.body h5, div.body h6 {
+    overflow-wrap: anywhere;
+}
 
 /* toctree captions are styled like h2 */
 div.toctree-wrapper p.caption[role=heading] { font-size: 150%; }
-- 
2.51.0

