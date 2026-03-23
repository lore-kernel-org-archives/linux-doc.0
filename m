Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98E52737E0;
	Mon, 23 Mar 2026 15:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278858; cv=pass; b=LlabyZbJwZxWlXs4JcSRi5wc6zM5z2Hxt+lBXxZ1RwATIW2q+jwm4ibmjJqOL2V1ki02G/niLreZPlhpIuf+SZf6/7mYkPW3X3rYahF7mneLs5yoD/Py/mVkgsWGpN/EA844MqjbS8JNExGtMAPN2bxlkhRNkphKxMd31tWNYF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278858; c=relaxed/simple;
	bh=TgU2v019ClNO5QYkBUeY0V61AVuoEGOSAJXGe5RfRAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htvMKSdeLdtqTv1Z1xRhzctfnCt7X1qIOHUpiQiCWBOwrMgmvhfPV4pkAACbiM7qeqdg9+W3kID0+qz3/Q4zHNVEpOuBZIdGZDO4BHhpv9Y2j85BBSsXwA4UWK4/fOHrJydjwdbF+znOc09XsechZN1gVBLgimXKIPJVy12/mW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=J2Jczkll; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="J2Jczkll"
ARC-Seal: i=1; a=rsa-sha256; t=1774278846; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RPna3fWdfJoW1dO7BoplDMpJPD8ADMgYw9uWHMnNcgEk30P7WIT4VVmQCWsYUUdFjv7rcs23i+coKEgCxqq2GASvCVLBsdk0HbmMIU9qEmEUONSSKxvbUOx0bnmcu2aJIsDBDLcqwPg2OMPM8rw42DYlhgwvKfrrbW4pw39Oklo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774278846; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9qYcee8nT66xcF5ET8b79uorZFblG/UqvIWraZqtA6c=; 
	b=Ta2HncDrfXEAi54JMA+7A4hZJ5OU+ic1Iwe807JCkLFxvHqVKAa+gN8rXf0GWOFA6CYSc69R3GfwfyUo6nXO2DhezQyBHqqwmysH2tuzChjtWLBfkafYBtefxp9UtGZ1sytWcKJWoGzzqDSNK1yRK3Ex/ocu6+YFRWuN9yNoHZs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774278846;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9qYcee8nT66xcF5ET8b79uorZFblG/UqvIWraZqtA6c=;
	b=J2JczkllwGSC6qvP88m26BBG/DljkayLw1wbUHricqWyaq5e2UefhMiZZpMjs45A
	hlU7QVTCI6JjZNRVslamDBkloQs3ZrHLR80OXaUhh217FsveBRDiYXDa5dDwdS0hzie
	FGt45hNtjXLr2HGjEsvLxnfACeerhLcABpkqoKB8=
Received: by mx.zohomail.com with SMTPS id 1774278843435231.1143526619128;
	Mon, 23 Mar 2026 08:14:03 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v3] docs: allow inline literals in paragraphs to wrap to prevent overflow
Date: Mon, 23 Mar 2026 11:14:01 -0400
Message-ID: <20260323151401.27415-1-rito@ritovision.com>
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

Examples:
  https://docs.kernel.org/6.15/userspace-api/futex2.html
  https://docs.kernel.org/6.15/security/IMA-templates.html

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v3: add latest public versioned URL examples to the patchlog

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
