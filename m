Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980F93B7A8;
	Sun, 22 Mar 2026 18:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774204348; cv=pass; b=fC6I1pdYkDD+CD3Z4N9gxTRg5eddGXRTDG2g4NzbOC7HEGYxCgSQNxN60cM7YCrK8vyq+a/GzpGno6K3T6O3H1oezdJoDcKSuAXBnPiUlt/Lgx/Bf/UsvvPPPVqr40icEKaHteUWdMvS0huBrZOqDqi1Ij5Y7JnLm1I/RpAHiy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774204348; c=relaxed/simple;
	bh=ys7AwMD60g00yWdFfk2sZIBXZRgWR82N/JQIp2//PDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYTLd8foBhCfLsGvJWmbL4ohOwqdUS9VIe+GYKg7+BP7XvEn6ihZJ1A+9EAoRiWR3YPVo92neNHwYCl6lon5WcY8bWictjjz/IIfqD6czoDSinKX43EomMoLNThXXP4yXXVwKPDq5iYvDxNtEjiZbDSBtD7M51GWF3mdCdfz4H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=bqPbDTgs; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="bqPbDTgs"
ARC-Seal: i=1; a=rsa-sha256; t=1774204344; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Cxal8k4J6hS+ZV8tWadbTC3Rb1W+/QBPK+xoSEpR9jlV/KNDOgC3S59X57uwB8kE1qfrZrsqrTr9O8XGn5TZjanrnN3Ifn4cEd3co2AgjUovdKAawp+9PdiLUs0qxCwGAmbrw8pMKqY4AxcX5DncTOn1hDBjFElw3E2fUIeh0Ps=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774204344; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uGH7NUJf6okXAPdUpAOHJYliwQjQr0ByTA2ZnAVbLLU=; 
	b=nU6kT8WUS9d81saUtIaOt6zBvbGsiNUJwpzGi9OCybBoMA+eI6tlLO89ea7AUJSuSc+Jh+iZYrdZ5zIc310ueJFiaQLMnE/WFG4twiZUZnADmBUxCMYc6AgHAuDJ5wz5bw2rGO+lhnjLwtRUe6x8TUx0w4VRbcTzJ09jGRvanv8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774204344;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=uGH7NUJf6okXAPdUpAOHJYliwQjQr0ByTA2ZnAVbLLU=;
	b=bqPbDTgszo2fgxMG5V1LzabBhbEh5msZaG645I+BanpToqQt/PJ7w8QaAF2GzWZ3
	o3z3Ki8I5R/X3Bwh1tHEk8YqenC56GDgmb0OysAK9dxMKw5yeQ0w+TfaetaZSeLJGSq
	mkxNJbFivwsgvYLh13YdTzCMmKfXxbvEK21Gu5DQ=
Received: by mx.zohomail.com with SMTPS id 1774204341528950.6604549461734;
	Sun, 22 Mar 2026 11:32:21 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2 1/1] docs: allow inline literals in paragraphs to wrap to prevent overflow
Date: Sun, 22 Mar 2026 14:32:13 -0400
Message-ID: <20260322183213.52235-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260322183213.52235-1-rito@ritovision.com>
References: <20260321141118.23828-1-rito@ritovision.com>
 <20260322183213.52235-1-rito@ritovision.com>
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
Assisted-by: Codex:GPT-5.4
---
v2: add Assisted-by attribution

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
