Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F4A258EDE;
	Fri, 13 Mar 2026 08:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773390889; cv=none; b=MWL78mjcY8eATgX5I/r+cOgGnCiGpj+rHBlHTPn0CZ+pQGxhyRRTy5RSigRCdY93Mo89KFXdR9Y5QSC6Kf0Lp8dzm3wTVEDHhha49hZaCXiyf43X6Jpz0Izm2QX6QCc+8pCQHRKeb/xvptwv30elx9gBFtWpbJaY4FPJwodUm0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773390889; c=relaxed/simple;
	bh=F/r/pEN1AnW5dK+WDyvoXAHiwhfr+xJLoBl9x9zktN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PknqLfykjrgId7X5bYEpolPKA3tGhXW5XfHKrv7RwSz+9pjktIuVGv97JZq4F61bInMe/Ww3EdvJE/OUPvLOxjXW68FMpL19zRw5SPbP/4k136PnUUYnpnx0D+bd/811Hi0m/WEb1YTUDzZriXG2krr+kwvBiBy+Lpsk7GVvKxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=okUxM77G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="okUxM77G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9194EC19424;
	Fri, 13 Mar 2026 08:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773390889;
	bh=F/r/pEN1AnW5dK+WDyvoXAHiwhfr+xJLoBl9x9zktN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=okUxM77GfFhS+yRMEep5/ccH05XvH9sb8Fa5BF9qe/y5UCyo/d7/mF/zw58RTqhEI
	 JbBunuqKn8FGPyp2oymwU+f9HdAosqCqn0fHZvhO7wBXOn4NFcKe/zEHPgecLAmU+X
	 ukkHIgz97Ksv8JmZCuuAtN3lHT5bSW6HUeCTcKKo/bdP0/McGtl1eUBGnQBHgDkHKR
	 Ly729c3LGdiA1dpzU8H6yaPH/e1fvNvQ0MBWGi97d46PEW2WXj6Qmig2iinTC3FRWM
	 tsdZ3KtEjWjriFNaxrKpBOCiN8ks8hch4GAmsnhDTmY8TqUFVpuKvGa2b88U8VypZi
	 gtpvZmhxmZqsA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w0xyp-0000000DI0z-2LoZ;
	Fri, 13 Mar 2026 09:34:47 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 30/28] docs: kdoc_parser: avoid tokenizing structs everytime
Date: Fri, 13 Mar 2026 09:34:24 +0100
Message-ID: <a25a7663215a0d07fffbe299dd9a6a91aeddb452.1773390831.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d112804ace83e0ad8496f687977596bb7f091560.1773390831.git.mchehab+huawei@kernel.org>
References: <d112804ace83e0ad8496f687977596bb7f091560.1773390831.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Most of the rules inside CTransforms are of the type CMatch.

Don't re-parse the source code every time.

Doing this doesn't change the output, but makes kdoc almost
as fast as before the tokenizer patches:

    # Before tokenizer patches
    $ time ./scripts/kernel-doc . -man >original 2>&1

    real    0m42.933s
    user    0m36.523s
    sys     0m1.145s

    # After tokenizer patches
    $ time ./scripts/kernel-doc . -man >before 2>&1

    real    1m29.853s
    user    1m23.974s
    sys     0m1.237s

    # After this patch
    $ time ./scripts/kernel-doc . -man >after 2>&1

    real    0m48.579s
    user    0m45.938s
    sys     0m0.988s

    $ diff -s before after
    Files before and after are identical

Manually checked the differences between original and after
with:

    $ diff -U0 -prBw original after|grep -v Warning|grep -v "@@"|less

They're due:
  - whitespace fixes;
  - struct_group are now better handled;
  - several badly-generated man pages from broken inline kernel-doc
    markups are now fixed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py  |  1 -
 tools/lib/python/kdoc/xforms_lists.py | 30 +++++++++++++++++++++------
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index ed378edb1e05..3b99740ebed3 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -738,7 +738,6 @@ class KernelDoc:
         #
         # Go through the list of members applying all of our transformations.
         #
-        members = trim_private_members(members)
         members = self.xforms.apply("struct", members)
 
         #
diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index c3c532c45cdc..f6ea9efb11ae 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -5,7 +5,7 @@
 import re
 
 from kdoc.kdoc_re import KernRe
-from kdoc.c_lex import CMatch
+from kdoc.c_lex import CMatch, CTokenizer
 
 struct_args_pattern = r"([^,)]+)"
 
@@ -17,6 +17,12 @@ class CTransforms:
     into something we can parse and generate kdoc for.
     """
 
+    #
+    # NOTE:
+    #      Due to performance reasons, place CMatch rules before KernRe,
+    #      as this avoids running the C parser every time.
+    #
+
     #: Transforms for structs and unions.
     struct_xforms = [
         (CMatch("__attribute__"), ""),
@@ -123,13 +129,25 @@ class CTransforms:
         "var": var_xforms,
     }
 
-    def apply(self, xforms_type, text):
+    def apply(self, xforms_type, source):
         """
-        Apply a set of transforms to a block of text.
+        Apply a set of transforms to a block of source.
+
+        As tokenizer is used here, this function also remove comments
+        at the end.
         """
         if xforms_type not in self.xforms:
-            return text
+            return source
+
+        if isinstance(source, str):
+            source = CTokenizer(source)
 
         for search, subst in self.xforms[xforms_type]:
-            text = search.sub(subst, text)
-        return text
+            #
+            # KernRe only accept strings.
+            #
+            if isinstance(search, KernRe):
+                source = str(source)
+
+            source = search.sub(subst, source)
+        return str(source)
-- 
2.53.0

