Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D539321F51
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 14:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756824710; cv=none; b=k754FG6W5h3HcLExt2RGapoRT8d8onSBuNgUAkJ7KMrVkCu7X0UHpzOkc+dwoAN8NFBMEDszNNsJPy7p+xymr/Z9GbV0t1cNb+X0ZWZr0OIfmA3cv6s6WJHEGSm1gsR42BJcuGb/QwGDDOrlcfhkTJkU2Ta82mn6gaKCebdJ+eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756824710; c=relaxed/simple;
	bh=ZUa3Dvq40CFgxs3mEO+9zGe6eA+vkcIwweuUq2ZnnBk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=D4JCCFLqv/H3hSBK+xDjqdv16P+TRhEc6yFu62/O58H48YZNn4kueKvZRLuSec8Au2orrWrXE4xK+G8htrZ5lmUE3IDHmYbYV2v7RH8HhzJKswDVDR7V4Wid2A2zGcwionWAUyIhQKQhCAmwDce5tTGwJSJ05VIEpoINLk8slWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbs9hUM5; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbs9hUM5"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61cd3748c6dso11348521a12.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Sep 2025 07:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756824707; x=1757429507; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A9TJ2ulC20w1+YJTZX+a2bMgVN6mnrHpWKqDumLFSJ8=;
        b=lbs9hUM5g4W8iQY2XTHgqLdAEabRTFjJLUDct2HHMcKAzXFUtXOd3gr4hmjoJxNJLU
         53mKMijgLyMQiPRNXRGL4gPiXGpN7ctUG6fWurfQIJJQXVG4X0vA358IhOD4H+UVry1C
         wc7DMnJqG03VfnxOaSZqh/Wc2TfwD3ta2yuH3qRrz2MDXvSk2Sr6D67sXjN3szBoipQB
         xO8uMqh+X3zov2Km2V9rRJe1dl8R56bfkB2jGyzw6kxg9w6RR8TnIiXvsvhFx3orfiS7
         PO10BLTd4gvXCTO6Pq+CdSgCSvuLawm4T8fbpiM4ruxeC4Rgz4bgFRCr9LYUYoVdOvD8
         1BMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756824707; x=1757429507;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A9TJ2ulC20w1+YJTZX+a2bMgVN6mnrHpWKqDumLFSJ8=;
        b=fd0x66DvjpbJJwfhjL9GV2neLJFkhCQnDtlnQFZLCBF0V98z0X64V6mpeAyZDXNTaU
         /buDR+M32u9PW3l6tcKExydOJPRmtvRQt+A/Zo6/skAG88Pe/1jMA+gunTkWSNY7cmvQ
         g5vDqf4CezdvmJuaMx9zY+fAkIIpffEsPxgvKUbtESOmDtn7H8zHpoevPwqhNCsobEok
         aGA1yS1C3B2droD/vgz8OacW2MO6pTu1gEOSpJfkS9xbTo0rXrRMJNKXXz2apDwP+jlv
         ojiutFKvzjsi3qSa37KKSJ0uXS3shbLRAi5b18JZfQLLeQCiv2/Vs7hqWmdKyv4hzNDt
         19lQ==
X-Gm-Message-State: AOJu0YwH2T1Qbcn6NHdHjP1jA1e/le/POatb+dnQBsDIDrbOEM45AiDG
	72Fk799KX5xLiaX3l4tUpZmDfSCkv40FkkCba1Hi9xi5eFbRn6szH/Oxb+UVuxqrK+3aBhA7xBx
	+rEkh+HEfb8rXkSoPqJnSXenb1sN6cz+ZkvEA
X-Gm-Gg: ASbGncsnFHdhhmd2C1J3spTv8w0sGhUSTvoTZRaFbtyxSJa+sqRidp6gJ8vfa+W+vZA
	UdkEw53Vo5FQa2w46SJlN8j3h2MgTvTPxBk37QpsZJkrj9p+CCNJIUoXEIzWMC9RMa01+R1bAFb
	2UcUZPadkwXnVTy4wAW3iw2P98HIr6sdOHk5VFpih4JjppiUuKAmtDSc59WFdj4pTmOVHoZAjtc
	fXT5/9W2g+570+78c7eAHAue+/EjA==
X-Google-Smtp-Source: AGHT+IEtTOgGUoIhgd7u+3yL078MmXDwwAmeprlZeMIhhoZQwfMYIkYjxU8WGf6kKGUTu+yvIIHoPEIwygWm4xK+QVY=
X-Received: by 2002:a05:6402:5211:b0:61d:1d16:19b1 with SMTP id
 4fb4d7f45d1cf-61d2699c0bamr10520553a12.14.1756824706532; Tue, 02 Sep 2025
 07:51:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Zhixu Liu <zhixu.liu@gmail.com>
Date: Tue, 2 Sep 2025 22:51:10 +0800
X-Gm-Features: Ac12FXzpjyhUGVmD4vMM4Z81raBn9ob2QcSg0s3JP5nvscB7sDiA3GQZf-hUNrU
Message-ID: <CALMA0xbOLkE8kUwrZA3FY=EFfV9ZCBdbFW5BTLbPM99E9TP+ng@mail.gmail.com>
Subject: [PATCH v2] docs: sphinx: handle removal of utils.error_reporting in
 docutils 0.22
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

docutils.utils.error_reporting was removed in docutils v0.22, causing sphinx
extensions (e.g. kernel_include) to fail with:

>   File "/usr/lib/python3.12/site-packages/sphinx/registry.py", line 544, in load_extension
>     raise ExtensionError(
> sphinx.errors.ExtensionError: Could not import extension kernel_include (exception: No module named 'docutils.utils.error_reporting')

Add compatibility handling with try/except (more robust than checking
version numbers):
- SafeString  -> str
- ErrorString -> docutils.io.error_string()

Signed-off-by: Z. Liu <zhixu.liu@gmail.com>
---
 Documentation/sphinx/kernel_feat.py         | 6 +++++-
 Documentation/sphinx/kernel_include.py      | 7 ++++++-
 Documentation/sphinx/maintainers_include.py | 6 +++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/sphinx/kernel_feat.py
b/Documentation/sphinx/kernel_feat.py
index e3a51867f27bd..d077645254cd4 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -40,7 +40,11 @@ import sys
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
-from docutils.utils.error_reporting import ErrorString
+try:
+    from docutils.utils.error_reporting import ErrorString
+except ImportError:
+    # docutils >= 0.22
+    from docutils.io import error_string as ErrorString
 from sphinx.util.docutils import switch_source_input

 __version__  = '1.0'
diff --git a/Documentation/sphinx/kernel_include.py
b/Documentation/sphinx/kernel_include.py
index 1e566e87ebcdd..6c3cfcb904884 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -35,7 +35,12 @@
 import os.path

 from docutils import io, nodes, statemachine
-from docutils.utils.error_reporting import SafeString, ErrorString
+try:
+    from docutils.utils.error_reporting import SafeString, ErrorString
+except ImportError:
+    # docutils >= 0.22
+    SafeString = str
+    from docutils.io import error_string as ErrorString
 from docutils.parsers.rst import directives
 from docutils.parsers.rst.directives.body import CodeBlock, NumberLines
 from docutils.parsers.rst.directives.misc import Include
diff --git a/Documentation/sphinx/maintainers_include.py
b/Documentation/sphinx/maintainers_include.py
index d31cff8674367..efd866ff066b7 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -22,7 +22,11 @@ import re
 import os.path

 from docutils import statemachine
-from docutils.utils.error_reporting import ErrorString
+try:
+    from docutils.utils.error_reporting import ErrorString
+except ImportError:
+    # docutils >= 0.22
+    from docutils.io import error_string as ErrorString
 from docutils.parsers.rst import Directive
 from docutils.parsers.rst.directives.misc import Include

--
2.49.1
