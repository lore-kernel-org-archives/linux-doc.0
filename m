Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E7D39F169;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825080; cv=none; b=oRGDPkaut8b2yJCOUnjWjj6OUGcJ6JmI22n7f0ObqdiXq1zQeWBrNhXuQ+VAaur5+cH4myyxePBA3ZjEO5wuQUFgegAZ35rJDwFJ6VKoXvClo8wst9+vd2BAxL1Fo28uMZzIv4mj3+inFVY9uhJdGzLxV4OtvsyBnHnYfeEcSCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825080; c=relaxed/simple;
	bh=nBQ14W9/TnksHUfJjA8FVeDj3iQtD4VD4UidbU9q+Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DXozSXvBwmOAd83anAcJzATBO4dXMceSoPkEfOJddvJESAkO6Wv1nDnEFXIjAOY/3y5lPrVFmfO8G65p5s1//1ouh9OuuAHHQoxJbzmetRYZZANZwb9Xo7L35UheqfMzlQwlSTAd5YLXDE+dV01CUe7n99MLXRsrH/3qg2SKSgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MPICeKuq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MPICeKuq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C35C2BC87;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=nBQ14W9/TnksHUfJjA8FVeDj3iQtD4VD4UidbU9q+Pw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MPICeKuq7ZktL64ab2ev/n6bMNvRYlt02pOtbtgYdSMtOMLD4tWMZhJZEArhNI4ID
	 S9wrX048aUV3quXYNdMar6rXZlz0BWxVBG+cx+XgxeVYCgUc3QQQWBfSFUdVhHxSoU
	 hCbMhPoyGKZiyZnNke3WP2tGTvynoVJJPf424Z/YCFl2mMSOJrDJ7imLUbGOxdHkt7
	 fZdA+aq4BK2zRuPPP5sSrUVzmS4+UkJtwORBQ8AIfHE9Omz7oLgCMIQ6ERtFIUi46d
	 uyVc52t147YJxDVKYQNPQvfyb1AetJRLFE9P+xPDPEP5qUCkntbFxUJkb+ud0UxNeq
	 Qm0lPb4ui2Qcw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpi-2eOa;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 07/14] docs: kdoc_item: add support to generate a KdocItem from a dict
Date: Wed, 18 Mar 2026 10:11:07 +0100
Message-ID: <fafeac23d1577927e1a3c32cddfbec1e0209ac73.1773823995.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773823995.git.mchehab+huawei@kernel.org>
References: <cover.1773823995.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

When reading the contents on a KdocItem using YAML, the data
will be imported into a dict.

Add a method to create a new KdocItem from a dict to allow
converting such input into a real KdocItem.

While here, address an issue that, if the class is initialized
with an internal parameter outside the 4 initial arguments,
it would end being added inside other_stuff, which breaks
initializing it from a dict.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_item.py | 35 +++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_item.py b/tools/lib/python/kdoc/kdoc_item.py
index c0585cdbcbd1..5f41790efacb 100644
--- a/tools/lib/python/kdoc/kdoc_item.py
+++ b/tools/lib/python/kdoc/kdoc_item.py
@@ -25,12 +25,31 @@ class KdocItem:
         self.parameterdesc_start_lines = {}
         self.parameterdescs = {}
         self.parametertypes = {}
+
+        self.warnings = []
+
         #
         # Just save everything else into our own dict so that the output
         # side can grab it directly as before.  As we move things into more
         # structured data, this will, hopefully, fade away.
         #
-        self.other_stuff = other_stuff
+        known_keys = {
+            'declaration_start_line',
+            'sections',
+            'sections_start_lines',
+            'parameterlist',
+            'parameterdesc_start_lines',
+            'parameterdescs',
+            'parametertypes',
+            'warnings',
+        }
+
+        self.other_stuff = {}
+        for k, v in other_stuff.items():
+            if k in known_keys:
+                setattr(self, k, v)           # real attribute
+            else:
+                self.other_stuff[k] = v
 
     def get(self, key, default = None):
         """
@@ -41,6 +60,20 @@ class KdocItem:
     def __getitem__(self, key):
         return self.get(key)
 
+    @classmethod
+    def from_dict(cls, d):
+        """Create a KdocItem from a plain dict."""
+
+        cp = d.copy()
+        name        = cp.pop('name', None)
+        fname       = cp.pop('fname', None)
+        type        = cp.pop('type', None)
+        start_line  = cp.pop('start_line', 1)
+        other_stuff = cp.pop('other_stuff', {})
+
+        # Everything that’s left goes straight to __init__
+        return cls(name, fname, type, start_line, **cp, **other_stuff)
+
     #
     # Tracking of section and parameter information.
     #
-- 
2.53.0

