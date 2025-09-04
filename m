Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E10C283FEA
	for <linux-doc@vger.kernel.org>; Thu,  4 Sep 2025 03:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756957369; cv=none; b=iQvBEJjEzrWYJy0WeDGMBFZm1XXRvRTbbwq77Fu6GQNE0+3oi5C3WQjdO8kHzR3ETV1ROLkYbcKcVgDbluvw33Q53irhuVXrYF2fq5/SznWpTXkdJPzjlpiC/B5azi1MxG+UuZQuHmxocYS0KuwPnPWnu+FAXK7DebSt9gfQmAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756957369; c=relaxed/simple;
	bh=78rBjVRnFwQafZRZGWVZfwcxXYCaJ5R6Q4fIi9STuNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5K5CkkFMUOsIEviohwzYQSkfX+Q7I2KdT0a1ODv4o20IIKF4bVM+9BdWGYEMnrDaBToKQZxVLpeawoGeDdvM4jM/o4rVrja1+KIfmXD15j35mlIueucjtmIktwG3w0Wvt0Pa4CLNXH6R01k1/wjlP6yiyIyHTu1zJHigsBF7eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gu3ZG5nS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gu3ZG5nS"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61cb4370e7bso801084a12.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Sep 2025 20:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756957365; x=1757562165; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+jNm30eNUMO6eOONSN2mNBnGpa9uzbzmVe5C0I59Wbw=;
        b=gu3ZG5nSo+JyYpV+GM5+v5LJVq1/AROhwMhj/lbwW7AM4Go9C3SQVYWlMF/OmDTXci
         E6z6kOHgf4+trxDG390V01E1HDNtOrrJMuMy+qX/XOLqCJL98tXXxUBbZz32oACbc7kN
         VkuHqdyr7NJwzrziRBRR1do0IOpKcpWTFnMBbW8HBFVGYAaevqVWxSd2qqfxX2sPckjf
         w/AeznC5mutpV8oad6VU0M0UqvjcLAspzPYIV21UiKs8NdYcZfqyhXGLhrJWXNsekRNq
         3yUNottJTwsG05ncOlqGF/gXAZW7rNk7+3b2/bJrcJA9zXGCGYfGXg87212Lf5s9wgui
         pk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756957365; x=1757562165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jNm30eNUMO6eOONSN2mNBnGpa9uzbzmVe5C0I59Wbw=;
        b=caC5k1KLAaoDXJq2DLQGnVWijSnZh5UoZCq3vFty69V9qx+/cpyEIzh/IifBKd84Dm
         uM13c6ewxG1FEnWniwb6QjoLD7xgatjddDDVb6T9hy76+41bOMlpj9tSEWUUsibtw3gR
         qme6xcFz/EYdhBqIDWJO49VLkHUP0oF/jMh1+Lcrsjds/gn6cfwNAZsozVuMZqzd5h2r
         zNP/RvURWYgkTxtYd7kmwDGQmyBxa2YLPrv40g/LOejIRtXk18mJ2qdf/gumw6muriWe
         JumP5CzX8feizJ1E7xFXNvdCkGP7ge8WohNU7Rgi0sGEmTJP4u00dsS74nJV8VT9S9PS
         fbXA==
X-Gm-Message-State: AOJu0YzzhcXz//lvUW4OFddntNw6AsrM30ytK5vmLMJhhjVICpCYpaxf
	pVqiaHM9W+/0XlqlUuwWE94BJlr8zxyHoF0XJsc2LthibSEkCQRTMt6nxAgDB+zq0/cZeGdHMzT
	0mCdR3PbW7emsEkCt+ZlnAEkmWgGXUl+ML27X6cX3tA==
X-Gm-Gg: ASbGncuBkr8G+8yzBagjXNSEP3VxwmDRMJksMYEmxByXm7K/kjvwhLN/UuAXE7t6vdc
	CTrstkcZHa8SK8NO1pEDhyM8j8romCxcMsdwX5LwcpYnVHZVQj/QAae9GkJnThnxRCO7RCEJT2d
	Lla7USMzTTgz5NC8lvz0B0DfnMlRkIyYM2mlvxQ04ViPzLLU31wPhUQjfgfhqPngGDjA4qUKZyY
	3KLC70coynn2yts4TbJjG+VVS0BttiHLKEOTUhMzu3/hBoYSbhP/noDwYwX+h9g
X-Google-Smtp-Source: AGHT+IGai2U0QPV4B5s4iuTfemcPyo8pb8YrTbmFoYVYPI70CIqvZvJXlZNF96nhuwMBQoCPucjnQIyR/L/qan33emE=
X-Received: by 2002:a05:6402:5110:b0:61c:9851:a92d with SMTP id
 4fb4d7f45d1cf-61d269a11c8mr15169612a12.15.1756957365101; Wed, 03 Sep 2025
 20:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALMA0xbOLkE8kUwrZA3FY=EFfV9ZCBdbFW5BTLbPM99E9TP+ng@mail.gmail.com>
 <87a53cx4r0.fsf@trenco.lwn.net> <CALMA0xaFxH_AT8PYyxLYqjP9RGKpWK4PsYbh-jVD8ddY9bCyFw@mail.gmail.com>
In-Reply-To: <CALMA0xaFxH_AT8PYyxLYqjP9RGKpWK4PsYbh-jVD8ddY9bCyFw@mail.gmail.com>
From: Zhixu Liu <zhixu.liu@gmail.com>
Date: Thu, 4 Sep 2025 11:42:09 +0800
X-Gm-Features: Ac12FXw5T1mLDJ8Raqr4nZTxQYXzcDKxE92Uyc02UNmb1f3E57d2pZQxbsHP5B4
Message-ID: <CALMA0xbKwA2Vz_QyHoJVgX8tPfO9FLcNbr39JF6SAW1N7t1XHg@mail.gmail.com>
Subject: [PATCH v3] docs: sphinx: handle removal of utils.error_reporting in
 docutils 0.22
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

docutils.utils.error_reporting was removed in docutils v0.22, causing sphinx
extensions (e.g. kernel_include) to fail with:

    Traceback (most recent call last):
      File "/usr/lib/python3.12/site-packages/sphinx/registry.py",
line 541, in load_extension
        mod = import_module(extname)
              ^^^^^^^^^^^^^^^^^^^^^^
      File "/usr/lib/python3.12/importlib/__init__.py", line 90, in
import_module
        return _bootstrap._gcd_import(name[level:], package, level)
               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "<frozen importlib._bootstrap>", line 1387, in _gcd_import
      File "<frozen importlib._bootstrap>", line 1360, in _find_and_load
      File "<frozen importlib._bootstrap>", line 1331, in
_find_and_load_unlocked
      File "<frozen importlib._bootstrap>", line 935, in _load_unlocked
      File "<frozen importlib._bootstrap_external>", line 999, in exec_module
      File "<frozen importlib._bootstrap>", line 488, in
_call_with_frames_removed
      File "/var/tmp/portage/sys-kernel/linux-docs-6.16.4/work/linux-6.16.4/Documentation/sphinx/kernel_include.py",
line 37, in <module>
        from docutils.utils.error_reporting import SafeString, ErrorString
    ModuleNotFoundError: No module named 'docutils.utils.error_reporting'

    The above exception was the direct cause of the following exception:

    Traceback (most recent call last):
      File "/usr/lib/python3.12/site-packages/sphinx/cmd/build.py",
line 414, in build_main
        app = Sphinx(
              ^^^^^^^
      File "/usr/lib/python3.12/site-packages/sphinx/application.py",
line 291, in __init__
        self.setup_extension(extension)
      File "/usr/lib/python3.12/site-packages/sphinx/application.py",
line 489, in setup_extension
        self.registry.load_extension(self, extname)
      File "/usr/lib/python3.12/site-packages/sphinx/registry.py",
line 544, in load_extension
        raise ExtensionError(
    sphinx.errors.ExtensionError: Could not import extension
kernel_include (exception: No module named
'docutils.utils.error_reporting')

Add compatibility handling with try/except (more robust than checking
version numbers):
- SafeString  -> str
- ErrorString -> docutils.io.error_string()

ModuleNotFoundError is a subclass of ImportError, added in python 3.6.

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
