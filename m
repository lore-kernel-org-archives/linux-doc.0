Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B1E39B4B7;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396652; cv=none; b=sk+QjAV1pzQcM+CFT+SZZZUQkvGqnhgK4o0rcjfTnvL3QRQm2lBc3zEYysBQis0MQ/Rh3owNFSUdbmAI9GqLsvNpUyecLFDiC3w3fhyqX0Xvg2/AYjDfIu2mYGy0YqYS59ymCFmUEsLSPNcd7X74JR0ToH+YfH9xKoVedTOvdqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396652; c=relaxed/simple;
	bh=AT9QRc72PaX75+hy9TLUQhCbT/HxXyi982eiR6wBTwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XNssTRc6rC3RJCwQXzwU97TpjdVAxtXDwTAO5FUhBQL5r3abkP7zPRm9sge0AwRo3OuNOde/xlCe87dv44wyJy56QovbA1r+qrOy86v0RcfH+yt17SRztiCJsJCOXAsTlhMdOG+tm6+Grfbv7Z2WQLIg5uflfqkWlUMgDgP4YU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZVLD9D4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZVLD9D4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0590C2BCB7;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396652;
	bh=AT9QRc72PaX75+hy9TLUQhCbT/HxXyi982eiR6wBTwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dZVLD9D4yv64QmkwAgRHO5t2AVwIAP0rrzKjkQyHVpjn+ZfwNmsQBSm1pnr68nMaJ
	 iKAO2zyDRPRGGpifS1RPLJCw8WpSfX6gSk2VYJ/nrtoTo2XblZf9GDx33Wy2qC5TOy
	 Rs6i6NRxQFkZKc45eMJ+KVepaBtXZk9MPfdaxTopFrMlD1lhkisP3xFO94TsNLj0Lj
	 yPyjZrx14ScLHSLSKV+FMSC0KArVGC85B7SupkgB0PDeAvlzTrwAI+n7yAhpIZdsPI
	 35RLFUYd5i4qD8rMVXeVH5DvVSbpDKzxTP+h+hLPcb3BpwmdP+qMxi7LmdniNwO9Uu
	 kuwSJBwyQS8ow==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0kc-00000002my4-3njU;
	Wed, 14 Jan 2026 14:17:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 09/13] docs: kdoc_re: Improve docstrings and comments
Date: Wed, 14 Jan 2026 14:17:22 +0100
Message-ID: <ec6e230335a719417c4234b01ac628f6d1b96cd2.1768396023.git.mchehab+huawei@kernel.org>
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
 tools/lib/python/kdoc/kdoc_re.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 2dfa1bf83d64..2816bd9f90f8 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -51,6 +51,9 @@ class KernRe:
         """
         return self.regex.pattern
 
+    def __repr__(self):
+        return f're.compile("{self.regex.pattern}")'
+
     def __add__(self, other):
         """
         Allows adding two regular expressions into one.
@@ -61,7 +64,7 @@ class KernRe:
 
     def match(self, string):
         """
-        Handles a re.match storing its results
+        Handles a re.match storing its results.
         """
 
         self.last_match = self.regex.match(string)
@@ -69,7 +72,7 @@ class KernRe:
 
     def search(self, string):
         """
-        Handles a re.search storing its results
+        Handles a re.search storing its results.
         """
 
         self.last_match = self.regex.search(string)
@@ -77,28 +80,28 @@ class KernRe:
 
     def findall(self, string):
         """
-        Alias to re.findall
+        Alias to re.findall.
         """
 
         return self.regex.findall(string)
 
     def split(self, string):
         """
-        Alias to re.split
+        Alias to re.split.
         """
 
         return self.regex.split(string)
 
     def sub(self, sub, string, count=0):
         """
-        Alias to re.sub
+        Alias to re.sub.
         """
 
         return self.regex.sub(sub, string, count=count)
 
     def group(self, num):
         """
-        Returns the group results of the last match
+        Returns the group results of the last match.
         """
 
         return self.last_match.group(num)
@@ -110,7 +113,7 @@ class NestedMatch:
     even harder on Python with its normal re module, as there are several
     advanced regular expressions that are missing.
 
-    This is the case of this pattern:
+    This is the case of this pattern::
 
             '\\bSTRUCT_GROUP(\\(((?:(?>[^)(]+)|(?1))*)\\))[^;]*;'
 
@@ -121,6 +124,7 @@ class NestedMatch:
     replace nested expressions.
 
     The original approach was suggested by:
+
         https://stackoverflow.com/questions/5454322/python-how-to-match-nested-parentheses-with-regex
 
     Although I re-implemented it to make it more generic and match 3 types
-- 
2.52.0

