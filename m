Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9882B2EB5CD;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=CLIv5aCHR8u+KguoYtgbt6416y+ed75BubFOEoPdZ62Abk0jIVtf234yz16IDJxIXz655aCODn2y20hjTlImm/G/Khyt7mMKGWAYYRj5q/CPEuoJr6rSCWH7b+zBXExn39uEJ6mwE8DHl+pTSDQAkeLnL4Ioa4HKSaVMLvjSFsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=EJEpOIpo13K5wVlZXAiPofrL9GMVio3Ohn/l0ADAKD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nzC7qydKDtuQ1cxTLx9GRf9uy+zoHRzfmaeVXA01WtlEdG4vxLZK2vkDcdECY2KMjnCjGU4EgvL5ihGqvMF2NHc66OGw8nyFBoxNX2NCsUjv+c2+naPbFchRMLAllQtYavWc53b8ZlwWEZMl3a8UJBva/QJgKILQt/+dKPZu1sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsbXdPfY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsbXdPfY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3817CC2BCB8;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=EJEpOIpo13K5wVlZXAiPofrL9GMVio3Ohn/l0ADAKD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jsbXdPfYVr7vvn9jt2ds1gbu7fFMcCtomVVJgVVhS/VNljROInlkd/XbYJ29K1eVP
	 UX5X0P+L5zUp0LIbfWTfppMyfsKJ7oI/MMciaGEFsOryeMX6FDC/N9NbsuNhjCqjsd
	 UKtyYxx+kBdJCefx+LpWBszmpzX5vQiHQopS5GAJoEE4BPT6X952Hjee0z0BfGiXJl
	 7aWM/H5EkOqze5LGOVaKWfAPwrgkYCJqJjmYf12Fe8uv2mOuTGg0xtrYThCjGrQI/D
	 Rn9Nf1KFf5b1KdJtjadxFoZikumGMUKM9khHdZAEFm7Z7sGeGBE9KwdmxhHCOOoTX/
	 VAAf/1T+BnwyQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j2C-1nVz;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 13/25] docs: kdoc: enrich_formatter: Improve docstrings and comments
Date: Mon, 19 Jan 2026 17:23:16 +0100
Message-ID: <55ec8b896fe00529d326859cd094230fb5a2cd30.1768838938.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768838938.git.mchehab+huawei@kernel.org>
References: <cover.1768838938.git.mchehab+huawei@kernel.org>
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

