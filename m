Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2433AA1BB;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=g1/n1obGGYj1wNSmfLhJagRz1iKx6vM1Rbw6dp4Bn/flBsZmjfobWeCdk0QZepxaLSqNGs37S3g3AX5t2k0+pJAyzir87kRwpkoSqPwpKLedPuI7ipFnqRnkUQ+dOg5/0gJJIX2tRAJsrZIGbp0Cd1Hy7Em5LM2WuYXgUEigFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=EJEpOIpo13K5wVlZXAiPofrL9GMVio3Ohn/l0ADAKD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7QHgY5dydQjeOoPtb70iDoSRf/m1FRFY8zVosqbCGAqKEbYE9SaWIWaaASNiYfFJnhs2xgcYjlBtHcz3OSH6Le3sC0n9G/KJ8GdhP8kTrGW8gbGlFtM2zhAJqxegSA/uQBjo4d3gAAk8BiZjgs//O7VAGoK3vhJGM6u9wNTDr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWwf3jjO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWwf3jjO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28CBFC2BCB7;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=EJEpOIpo13K5wVlZXAiPofrL9GMVio3Ohn/l0ADAKD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QWwf3jjOqk47/1cxMVnSrykfiOhxFUiF8UHuGLf59mgTCvEdf72WPMqh5J5NnFrzz
	 3qcAUlAH5SEzFVXaOwDthV6CtblTdljpFWJdzcz5R/S5kFAKW6gPO4C10HkkBAiQ9t
	 0vm3yRgbdTgGMV64Qzids6GOV/WUEcIhihMatnuDSYKcKKbG2JammHdBWXI4cjg1vp
	 kSA8r4f1VeKazvb9zZDQwOp7Lp/qQeDqRLVXMmhHxBQvDeqT4aDkW3vEF5P6Hlib+R
	 RddWXgTsXL40mPjDjxGgEkQdGgpu9fWpPMNYFG0dVJ5kYSEnNh9hyqOtvt65NA2gsw
	 0cYuis0xjck3g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043Ix-1q1O;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 13/15] docs: kdoc: enrich_formatter: Improve docstrings and comments
Date: Thu, 15 Jan 2026 16:40:34 +0100
Message-ID: <2de09ecb216c187beb5aac72041fa1a9e8380173.1768488832.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768488832.git.mchehab+huawei@kernel.org>
References: <cover.1768488832.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

In preparation to document kernel-doc module, improve its
documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/enrich_formatter.py | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/tools/lib/python/kdoc/enrich_formatter.py b/tools/lib/python/kdoc/enrich_formatter.py
index bb171567a4ca..d1be4e5e1962 100644
--- a/tools/lib/python/kdoc/enrich_formatter.py
+++ b/tools/lib/python/kdoc/enrich_formatter.py
@@ -26,12 +26,16 @@ class EnrichFormatter(argparse.HelpFormatter):
     and how they're used at the __doc__ description.
     """
     def __init__(self, *args, **kwargs):
-        """Initialize class and check if is TTY"""
+        """
+        Initialize class and check if is TTY.
+        """
         super().__init__(*args, **kwargs)
         self._tty = sys.stdout.isatty()
 
     def enrich_text(self, text):
-        """Handle ReST markups (currently, only ``foo``)"""
+        r"""
+        Handle ReST markups (currently, only \`\`text\`\` markups).
+        """
         if self._tty and text:
             # Replace ``text`` with ANSI SGR (bold)
             return re.sub(r'\`\`(.+?)\`\`',
@@ -39,12 +43,16 @@ class EnrichFormatter(argparse.HelpFormatter):
         return text
 
     def _fill_text(self, text, width, indent):
-        """Enrich descriptions with markups on it"""
+        """
+        Enrich descriptions with markups on it.
+        """
         enriched = self.enrich_text(text)
         return "\n".join(indent + line for line in enriched.splitlines())
 
     def _format_usage(self, usage, actions, groups, prefix):
-        """Enrich positional arguments at usage: line"""
+        """
+        Enrich positional arguments at usage: line.
+        """
 
         prog = self._prog
         parts = []
@@ -63,7 +71,9 @@ class EnrichFormatter(argparse.HelpFormatter):
         return usage_text
 
     def _format_action_invocation(self, action):
-        """Enrich argument names"""
+        """
+        Enrich argument names.
+        """
         if not action.option_strings:
             return self.enrich_text(f"``{action.dest.upper()}``")
 
-- 
2.52.0

