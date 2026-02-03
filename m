Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5971A394497;
	Tue,  3 Feb 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130555; cv=none; b=EvUNk4St1HLcNlX9XHA1N96N/cQv8vfHw8Y09oGfEtU/OjSuLft5sARqfdth9k0/iNYhUbEMn2nXHxU/c2I/SH/1uaTCbSGS+YqQl5rC5bm4kto3Fd7llW8uXYifEl3lQF3/BXF8dzg+OA/6xOZ+QsZYBuvdPY6hzZArlORmMvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130555; c=relaxed/simple;
	bh=12OPqlskckL5HqlY4jj0+cdjZZti4SPQGDREnmoAJkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOTf3WsmN0YU/O5EpF15OdI6qqvkyKOKXLSlKB5km2xylERfIEPgetK0vZTeJxvdPDP9CuHojyYfaZheyWDehBKkjzNjmS0rI0dkvzP5VzbEdMieUGvq+MXKSXwhExE+KaLuwVWIyoLADeZkx5cU9S/XRDDL35QPVSVfgoBWl6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UF3f7nYZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UF3f7nYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40EEC116D0;
	Tue,  3 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130554;
	bh=12OPqlskckL5HqlY4jj0+cdjZZti4SPQGDREnmoAJkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UF3f7nYZYJt6LtqA2Z3zw8NAsjuv9yMpfu6WiKu17rek7bSmj89fM+kusmyUie9d8
	 mlx6WQj3wtEuJW+bx1FwgLEg3IPtJitI9WaznY6CVQx3Tb+UvcD+nAp6uK7gqadp9u
	 mI13SgvP6IZsu4lghJrb6oh+dhMwQLMTkiWrWwms90SiWjj6HaciGT2YKsYFUatGf5
	 UTXh6wjfYfzftZHQ2LrCdvr2KnphduVLFSn2s804ntBnlnOQGkbJq8jD4ovPz7ToUc
	 kVdQayOCmV1z7UMpWxM+S9SstoOeAbhYrbnpKhtXd4P9V1364dsAmvpeN91yvjCrzU
	 ZJQnkBvuCEUWw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnHom-000000027UW-45YU;
	Tue, 03 Feb 2026 15:55:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 07/15] docs: kdoc_item: add support to generate a KdocItem from a dict
Date: Tue,  3 Feb 2026 15:55:35 +0100
Message-ID: <01ec6c8007e9ccd40ab07e09b457912ea6866ac7.1770128540.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770128540.git.mchehab+huawei@kernel.org>
References: <cover.1770128540.git.mchehab+huawei@kernel.org>
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
2.52.0

