Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50117205E02;
	Sat, 29 Nov 2025 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764425940; cv=none; b=LKXYEta6Qp65IRnBMDmp7IcoRH/MOeK69HtRe/K4pbUwyuBEnyHZktLwvkuBhGaQcUsqPcSUb2MjfxzE2SnuYMOoBV3hrKxm+u/MUkBM4fjXs9gCCgpDKvvimuA/FR0Pr3p1EZFULlSibCPHrK12TtrSCIXN4RI/K4SSRa/RYkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764425940; c=relaxed/simple;
	bh=oS0/mLeea8vXu51T6WuY3u6fHuFGZhgPlBPR0N14YYA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=TLG5L0WSxukGAl8ao6w5qBYZXDvj8x4zHKTxyjy8Ng7koyE0cKgseQV6h0z95Exh+hb/ywxKgihx0hhzcP4YvMaLQtoMjzlVdh28foS4klm+0LWN5paWB2tM3zH1rsVxYCG01Cp4FpspWS7eUjmk30n8/Dx7/F2IqYfxYY5KdYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=LZXjjrVA; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="LZXjjrVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1764425929; bh=v83JbvFeBnl5kh2TpPfmiHCjWkm+Icj7z7mtZPjZwo0=;
	h=From:Message-Id:From;
	b=LZXjjrVAaP3mkSXDSsqj+j7c3TEUd/dOrn4r5ERwXwCwT5oTDhQttH9N5TSGjFM3X
	 XEydGNGU0mR6yxv/f3sO+R6uqk4z1SK54ydZT3Sj6u31ZlRmSMsUcfp+v6y3hntF3t
	 kpmrcDHQEstnrNg57UOW3xlRSynxvPBfjlxFjGZY=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id B8CD5C04AA;
	Sat, 29 Nov 2025 15:18:49 +0100 (CET)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 5ATEIn8h019093;
	Sat, 29 Nov 2025 15:18:49 +0100
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Security Officers <security@kernel.org>, gregkh@linuxfoundation.org,
        kees@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: insist on the plain-text requirement for security reports
Date: Sat, 29 Nov 2025 15:17:41 +0100
Message-Id: <20251129141741.19046-1-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

As the trend of AI-generated reports is growing, the trend of unreadable
reports in gimmicky formats is following, and we cannot request that
developers rely on online viewers to be able to read a security report
full for formatting tags. Let's just insist on the plain text requirement
a bit more.

Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 84657e7d2e5b..c0cf93e11565 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -33,12 +33,16 @@ that can speed up the process considerably.  It is possible that the
 security team will bring in extra help from area maintainers to
 understand and fix the security vulnerability.
 
-Please send plain text emails without attachments where possible.
+Please send **plain text** emails without attachments where possible.
 It is much harder to have a context-quoted discussion about a complex
 issue if all the details are hidden away in attachments.  Think of it like a
 :doc:`regular patch submission <../process/submitting-patches>`
 (even if you don't have a patch yet): describe the problem and impact, list
 reproduction steps, and follow it with a proposed fix, all in plain text.
+Markdown, HTML and RST formatted reports are particularly frowned upon since
+they're quite hard to read for humans and encourage to use dedicated viewers,
+sometimes online, which by definition is not acceptable for a confidential
+security report.
 
 Disclosure and embargoed information
 ------------------------------------
-- 
2.17.5

