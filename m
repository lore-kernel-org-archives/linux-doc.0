Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7CD3C3BF8;
	Thu,  5 Mar 2026 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723788; cv=none; b=kpvd6e1LjF5tQa9XjqbtDfJ7gvUa5JJbsPKK8wgEo1cXALlE0x8XJppSIlKmmYnAxEp4if0pnKFG8X04tAv79/O0BwH3xjYdaYtYUZIvQMGMuZxPVJYjySAaFBF9U6lIiejScFyfNrfU/2f1wXBKnSAufpHt3IB5vyCTmDfkVH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723788; c=relaxed/simple;
	bh=KClTBbHYRg20aly7xZCzAagKb8bY1y4ys0T0TfWzZRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etaED5iWs7X9/OMYkZgWkwrLWltzlXOfhEipRgPSg6EG4IhQFEt3xDpvWw0FqznwAggxaZlhEtUk6i6sg49VkX/mWulxfNO3lm2KU5mHa2aJyW+vvdFlTD0hAEN4Zhk4jI+fYE4UEaisfuh+juX8rbgwAMaCKpTCmkPrzZEriE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJSR0DRX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJSR0DRX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA13C116C6;
	Thu,  5 Mar 2026 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723788;
	bh=KClTBbHYRg20aly7xZCzAagKb8bY1y4ys0T0TfWzZRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MJSR0DRXLMAyOgBPV38+nGrAMC7yOVUZbNgSFaXGVE2qR8lgRYtREQcXmjFk7TkoC
	 vhDMSy7uHi30wzrR+hb2kOKObHEetLi15NyBUr3BywQLKERREcdMUEHNqimRt9Iv4m
	 lsUNUGoQXaydQnAcDU2xz9q5tqnruPKMsC9EiJJO94yrTDT5j953oVdeAGceUDdNYk
	 /eRfUYxPpmAjzn2/L/Eo7NEsg4LFUywzBvgwA7THI5U97iAvAKnIU7EdjkTEVS0dt/
	 UJGQ5FgvQTIONe4tvznS+MliJgtKE7aVkrNWYGejicKjhxWfSxl417SgzUy//d9pLt
	 mNJ38NmCGO9MA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyAR8-0000000HKAX-1f1G;
	Thu, 05 Mar 2026 16:16:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] docs: kdoc_output: use a single manual for everything
Date: Thu,  5 Mar 2026 16:16:14 +0100
Message-ID: <26371b244a4a7aeab9a1e94af87b2e17eb50ff43.1772722474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772722474.git.mchehab+huawei@kernel.org>
References: <cover.1772722474.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There's no reason why functions will be on a different manual.
Unify its name, calling it as "Kernel API Manual".

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index d0b237c09391..24ee1fad681e 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -607,20 +607,17 @@ class ManFormat(OutputFormat):
         "%m %d %Y",
     ]
 
-    def emit_th(self, name, modulename = None, manual=None):
+    def emit_th(self, name, modulename = None):
         """Emit a title header line."""
         name = name.strip()
 
-        if not manual:
-            manual = self.manual
-
         if not modulename:
             modulename = self.modulename
 
         self.data += f'.TH "{modulename}" {self.section} "{name}" '
-        self.data += f'"{self.date}" "{manual}"\n'
+        self.data += f'"{self.date}" "{self.manual}"\n'
 
-    def __init__(self, modulename, section="9", manual="API Manual"):
+    def __init__(self, modulename, section="9", manual="Kernel API Manual"):
         """
         Creates class variables.
 
@@ -751,8 +748,7 @@ class ManFormat(OutputFormat):
 
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name, modulename = name,
-                     manual="Kernel Hacker\'s Manual")
+        self.emit_th(out_name, modulename = name)
 
         self.data += ".SH NAME\n"
         self.data += f"{name} \\- {args['purpose']}\n"
-- 
2.52.0

