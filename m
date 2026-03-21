Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA3738C419;
	Sat, 21 Mar 2026 14:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774102291; cv=pass; b=ZLvV7xik2rSoCu/dPlLbKF+htneCcBwt2D+dJ6GIW3Vm6HJEBhQPao0n9dH6t5EHDk/5k0f4E6VG60yGYrNY2MzEyHqDRigrAAeErnt76jZpqZtB+5A9ht2IUBfnbg+OVzy/r1l7PSxoh8jw8yWJOQDzAJSMDH8/3GxR/HDy2r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774102291; c=relaxed/simple;
	bh=0SJpIPZTkUi57nPXH/za/nA22WD3OutvGMd4FmOyG+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTDHQEQ1p+8BsrdW47WnxbHN9ED4ZgUZxYB/I0qZbuPwFm5aYRr6YffquDD6FlkIY/6McV5/CaoHAj8E7P96y46jy+kR7YEX883RiSDaTWqCUk6vcQhVaKOf5R2Eqlndz6ZyNYb/iIAF2LRFymih3fy43s9ITh81dYhSTcAgr5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=fWTxS0Ng; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="fWTxS0Ng"
ARC-Seal: i=1; a=rsa-sha256; t=1774102287; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VG0acxpA2wCjJRuG+cRg3bgF7XcoppruO+8H+gz+8vx6atLQLYw9AaF9FTk9e1eoOCBtgJnN16gIuYDpHK+ZjF8iLYaMTGv2krp5gRhk2Ds6uxM5OEWPc8TX5H94uawoUn6UI3YCB0dG6o/tTgltwvPf5ixmFt6Kgfd7GmgQVi0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774102287; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8BM+5oPTqLAWX4OsP9MNOTi1+7wniZGV1qRSMnNZrMc=; 
	b=jMpFnWfvjaSwcsQF/8nGtfaR7gwXmlg71GgC36MttDWf4/HiNiEwrp0Dqwe8qRQvubLxco0MQg8DOjw775Iu4+nKXtpgvGTwsyqYP0C0TkOVEGJQCW0Xl7alHH9fETZXYGcD6/BlPBzZXaNzcfCgsWOYWBe7RGLA+xSGaQDbGjo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774102287;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8BM+5oPTqLAWX4OsP9MNOTi1+7wniZGV1qRSMnNZrMc=;
	b=fWTxS0NgZaHA1xxFAO6ToaeGJWFgCVhloLJocGbcD/LBF5WI7BPEcjmXh6nroyAf
	aKVymul91t8v3s+bH9q+bSZ+SpWQdq/cGvbQP94qhClH7ZebhRIWc6+XtLjlIy2NhYz
	PzDKQWpnPDZCxTraSD5rj5Ho2xAESw6WulDkOvsA=
Received: by mx.zohomail.com with SMTPS id 1774102284500147.98436531718187;
	Sat, 21 Mar 2026 07:11:24 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 1/1] docs: allow inline literals in paragraphs to wrap to prevent overflow
Date: Sat, 21 Mar 2026 10:11:18 -0400
Message-ID: <20260321141118.23828-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321141118.23828-1-rito@ritovision.com>
References: <20260321141118.23828-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some documentation pages contain long inline literals in paragraph
text that can force page-wide horizontal scroll overflow and break
layout on smaller screens.

Override the default `span.pre` white-space behavior for inline
literals and use `overflow-wrap: anywhere` so they can wrap when
needed. For code used as part of a paragraph, wrapping is appropriate
because it is stylistically part of the surrounding text. Code blocks,
by contrast, are meant to preserve formatting fidelity and are better
served by contained horizontal scrolling.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
---
 Documentation/sphinx-static/custom.css | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..dd69df2a7 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -149,6 +149,15 @@ div.language-selection ul li:hover {
     background: #dddddd;
 }
 
+/*
+ * Let long inline literals in paragraph text wrap as needed to prevent
+ * overflow.
+ */
+code.docutils.literal span.pre {
+    white-space: normal;
+    overflow-wrap: anywhere;
+}
+
 /* Make xrefs more universally visible */
 a.reference, a.reference:hover {
     border-bottom: none;
-- 
2.51.0

