Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C6839B4BC;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396653; cv=none; b=s93t+8We5paalby4C3VcZVSxsPLDEJXe153m3LhV33usXaeJOw7Deq6XL/YwPiSinVUWd+nAtwC0E4dN4i2/XBXfr9G3g6Jw+Urh/vAoEnXSHQxs66rhPfoRllu/eHNUJ2LD6s9afNIXoXTrfPm1isTRhB/SZqqWK/KhoPL8QAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396653; c=relaxed/simple;
	bh=EJEpOIpo13K5wVlZXAiPofrL9GMVio3Ohn/l0ADAKD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g6COkmryQvZVLBsFgl9wQd4Iye4LMuTuM1+44I1FPo4DxEWu5b6rblDoQ/V1DUUo/XHAWkyfPV28AeXRgyjLUyVb6O2jXBFJ+5+knjYc4gH+rHv3ge0t9k59200z2KFlJnM1GZ9icuM74RN5YzfUfCoZ1NwSgI/5c3XrzksQNfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DLbhrGZ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DLbhrGZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A96A4C2BCC6;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396652;
	bh=EJEpOIpo13K5wVlZXAiPofrL9GMVio3Ohn/l0ADAKD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DLbhrGZ+0j3jD3BMgsfu/nIsI07kioZVWxH27YQqN+s8CkQ6L3Jf2aVPKadfDF/WA
	 6xNAKoNi1PRVZVKQvrHeobonhOPEpNxwF1RG5UNDO8sGuSux0vhmxoB8TWU6ETIPd4
	 /nA2Igv6Vx6pg8AMmSseOvwyIVvUVBh8EgPrHcdcSmscTZlekNwtcolYeQCjYrYj6I
	 43KnpFHuDwMjk9WB+OZ9B8flPhmFgt1afKK2bXWl8S8KDwJ+L07C6ObJwJoo58Z6Cl
	 bR0FI8MbkrDt68PY88J05yzQ/WHU4vi4/ni4K/wK4/J2zEn7HhrWRexXnq4BmP0AE5
	 iLhXGFeC+IhMQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0kc-00000002myC-40fC;
	Wed, 14 Jan 2026 14:17:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 11/13] docs: kdoc: enrich_formatter: Improve docstrings and comments
Date: Wed, 14 Jan 2026 14:17:24 +0100
Message-ID: <b6cbdced7499ed7fc7c7b4490e9f46fa79ac7361.1768396023.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768396023.git.mchehab+huawei@kernel.org>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
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

