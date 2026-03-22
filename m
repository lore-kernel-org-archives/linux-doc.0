Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E311A6815;
	Sun, 22 Mar 2026 19:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774206587; cv=pass; b=iOovqYhC/SiHYXuXk8K2MsohC6+wk1Ppr7koPhq8nz3h1U9gwpgoYgEz4hsPlgD02w0nOePlrWI32sP+xGd/WCCcl+XDbY/noNHkRlb4BjdfvzN6BgevPx3XeQNQbvJ8fZhZr0dlXgAcj4ycUf6mno95bNdSiaw0gXSzMhQ5DEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774206587; c=relaxed/simple;
	bh=gZd1qwn+UVpWkuPvlqIv68qsw6V+uGbKxDwVV06FtKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzgS8srUiQztrnGHERQQbGDrGajyiPnJbdnE5y+vJCiJH6cyyiRt7h6dTePElNe6WhC2gSd0TVNhpKcugh0ThqqlkNYNP5jwvXJLlWqRVxh1XVMs3llgjBVO6fZWCIyX0Rex/5PfQ6ArPFM3b235UBNy+pmThJBv4bvfP95VUuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=l8tW09eX; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="l8tW09eX"
ARC-Seal: i=1; a=rsa-sha256; t=1774206571; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ETpnBg5F2nbDBh2hVC881w9S6PUgTyFRFL0+O7oFPSFJZetfts2+4ehnBkaZCQfqTtFK6JufeLMwe8qAAAW9BmC9J9MS65PjkIWA4pQ1tp8UcN6671Tas0WpZ2Sga5LarthR32JJPZLaEfYM2X778H8kPfC2cS836ESIMu3Z+Mg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774206571; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SB6OVGTc+JfCTWtIPtADf4fMWLx9YOL10iySi4+/LKg=; 
	b=hXoRO/y1jUp2qDzxRDW2XAJM1CtaZGoZ9WKPAcMkSMsgF8IDIzzWUp4PL5ejDEk2lEp/mfCo75uNXvVx72fMa4K4b4VpibRh2DMZ83Pb59LWBUTreEDTAFTSGIdkpPYXvc5XfFoWBCrxUWIVDp8L3sVl7wti1TTBmeCQM2SsND0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774206571;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SB6OVGTc+JfCTWtIPtADf4fMWLx9YOL10iySi4+/LKg=;
	b=l8tW09eXquGyyDJSLyCCMUJ14gh8rxHijuB+PkbI86UPkJa9jpMdzVZwNmwkWi+8
	u4Uuz2dZwuQjA7nnjWyajeWlEnu5+Ox4Abxu4ODJkw9HCWLStPk+DnjldbwePPT61aE
	YTgW1H8OCMsAysVwaGZe3ggajni2n2TIMkTfMBi8=
Received: by mx.zohomail.com with SMTPS id 1774206570357548.413053095091;
	Sun, 22 Mar 2026 12:09:30 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2 1/1] docs: allow long unbroken headings to wrap and prevent overflow
Date: Sun, 22 Mar 2026 15:09:08 -0400
Message-ID: <20260322190908.60412-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322190908.60412-1-rito@ritovision.com>
References: <20260321144855.30429-1-rito@ritovision.com>
 <20260322190908.60412-1-rito@ritovision.com>
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

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v2: add Assisted-by attribution and clarify wrapping trade-offs

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
