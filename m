Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DCF3B3C0C;
	Mon, 23 Mar 2026 15:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279838; cv=pass; b=Gr8ZVIqX+kz5wi/IXo7CKbvmjEBIaXDPlDKaxMuVHXxy8mlRzKOBy3zzY8E73lN9xiH8Myya2LaGEYRfrHOyjf7P15Tt/OSmIDmn9zrd/F7kEb3E4qBgkkOG64rKhINglW2AQDib/nCjnWloRKvfrxWcBmM1oIfjPtKsZgM9rQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279838; c=relaxed/simple;
	bh=VFtTjVhQZF6rYyLMY2jMggYpUBsfoI3OHkQSmEmwiuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hk8LpAColAFo2j1CAJV7OZ+scco6KlJ7GGiHXpNTVZeTsoPEueR/bTEE1lusY4R5Sz69/ARFwtX6pz2AnjG2flWwLbRBE5DxzDICKRgWD/CuQWRMycztHK0MiO+zcR4vPCvprNRKpX0cm4K0fWw5T5n5Dujdbzq6JT4lAtSe1E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Cd5nGQYC; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Cd5nGQYC"
ARC-Seal: i=1; a=rsa-sha256; t=1774279827; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mk3J8C9p+PfycXFeLYlWnWSbc7sF05u3FUZAu9VxmuGKHV0CYsWcn2rovAVAuOs1BRSBTFFPOGgs4l79CTFLOOCQHZ/snOKcDO2cNrNjArv4n+ZZ7CydkLD/wEnSIu3V58ktfcNZtdGnbhivG+gIIJAgQ6HoQ5lcpU2Is17tUoE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774279827; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hlhJ93wIT8LEPInUdbDQjSKutao6zriCXimBZ8jrDJI=; 
	b=n+r+dJfyUm4WEmY0KCcH1/TXlftsldPj2+gEGjtLmj5uSpWzHxMsEHXv/soi0nXiGANOD4BdNZTq7bqvfbi9QO7C4n250UnFHUFHDvXJS/FDjchsHhgQRTx/5mrwTehSlZdHLy5DIaW6TIkSV+BkRdEQ8Bj1gabUKfdGcceTd5E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774279827;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hlhJ93wIT8LEPInUdbDQjSKutao6zriCXimBZ8jrDJI=;
	b=Cd5nGQYCbOLjcyFNAwC3CWD1Wa0s5eeGd/RgxK420pf6ZzwVLkl2LEvK1t6FFLRv
	KOLkLQHZcMqFvMguTENEwRYDF2brLmJQar/KxeCfskQtmwtS0ad5y2XymTcl0wbgTXQ
	xEEMAbuhJcln75iUHOlUkVUhrlvkwFm8wfMqhEZw=
Received: by mx.zohomail.com with SMTPS id 1774279826072871.7555484499007;
	Mon, 23 Mar 2026 08:30:26 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v3] docs: allow long unbroken headings to wrap and prevent overflow
Date: Mon, 23 Mar 2026 11:30:24 -0400
Message-ID: <20260323153024.32317-1-rito@ritovision.com>
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
that can exceed the content width and cause page-wide horizontal scroll
overflow.

Allow headings to wrap when needed so they stay within the content
column and do not break page layout.

Browsers do not treat underscores as natural wrap points, so some
code-style headings may still wrap awkwardly. That trade-off is
preferable to allowing horizontal scroll overflow, since headings
should remain immediately visible rather than partly hidden behind
horizontal scrolling.

Examples:
  https://docs.kernel.org/6.15/userspace-api/gpio/gpio-v2-line-get-values-ioctl.html
  https://docs.kernel.org/6.15/userspace-api/sysfs-platform_profile.html

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v3: add latest public versioned URL examples to the patchlog

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
