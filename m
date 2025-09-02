Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9284D15539A
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 01:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756777658; cv=none; b=YtLJnDkZqhmFVOpfXqMZa6w+z0V0kp5SsB7xpPLbg5KV22v2odzSpdoLOLGCuktlozClOWVf8LOIhQtQVw9n6srf08HsWNdEIO56zsErSMG5djafw4uRLDpAGk7PZJdUyysgQ5oGerrXK4/vsTheVd4wKMMllW9rBMcKzfJO6J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756777658; c=relaxed/simple;
	bh=P6Fv35xVBpL5CQfnyr/ccGMQCnhxSXoGqrwQNKZ1CIc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BoQKJ9VUu/06BiLsts2aQ/5R/TnlVFBfz4OD+SMkiMNYL+UWgEIAqBhMRMF1zG80+Wdv4sDqmHup6TKscsVwXjnawk+sh+ygkV1BhIcap8ShPBrxcbYyaZWvAsKuKUwTEpicrmy0+lpB0AjolfovZgVE6Dgvbs2/wXyxht0+SlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBd2zPPz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBd2zPPz"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so7681792a12.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 18:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756777655; x=1757382455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WaIxEEeWDvMvB8eA4hCP2Ou1o881OgtcWzxOk4HGVMU=;
        b=NBd2zPPzXLj7b1WbB/U7ReiddpLYiSF0h+79zEXhzEhTzCxR7VT1Ea8uKD6uoxSB9K
         BmHAccifFO+vLtJNu1wbdtZikP3KngcKv9oKplmtj8NPV6SELDpOh3UeOKy+ye6WkC/5
         es2zDvCs6MyZKmUbbiOrO33CJrrN2SIXLoTncV+Eds/AjlLQ+A0DiYeYe3IYkvpu4qmP
         CZ1vMcQTq55c77rgF02WljeAx8z/eTkg9rcWlKnE67inYxHaa4mc0YF05GNTDjx6YVBX
         OkHhGTWgPe+BIsog3vGcvZlp26KthC+KMNVh+7/5LQbZk1a/4fsotv2FoLmuWUuufdwy
         j9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756777655; x=1757382455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaIxEEeWDvMvB8eA4hCP2Ou1o881OgtcWzxOk4HGVMU=;
        b=jOH2iCrSZPKWk0yDuzAJPjq7KsgwDh/VKaq4EIs5TR98yAgIOFooxDxG3uzcgoSnY/
         zk//eN4DDP2r9OADZLs7CAq0Uw+x/RPqMg0lsu9E7WDnt1nkiecRd/cjIjwEAhtf5Rty
         VDECv1tRelnV76MoeE5fx81OBEK1R6ytZb3XOpiFGowjpfRW0PyAyUXlX0I/SdSGCNr/
         hPtM1ZAD0s9sMNvyztT43BlgJmt/N6Nc+bTytK3p1+KZJom2YSWU8rPxCDni/bt1UiOG
         n9P0ec2eHHErQvFMMhRRGraS3pAlpIabfDyL3IXknu8NmNQPWb4hAjL6iaUVpzqkw05y
         adAA==
X-Gm-Message-State: AOJu0YyA3b8rhMCmrONgqjtHEoq4RiqMKe9mqlKZonAbbVYxOlAlkumG
	mHrkNRi338eptkMr3igf8h1XsL81duGhT4EKg94iqPp3k+sUOIurWIOnbRSzcvUU5QO3Lh7qP+P
	D96mBgckBRNGGuXTyuJvA5EP00q/Wenr74kBT1QE=
X-Gm-Gg: ASbGnctqy6pb2bQARr71iQVHyJ16T/GeSpZ/SHND8QBi52YP6rJE8F4r/iqb7hSTRpa
	lCa2MKO9t5YnYaf+/CjINISp8ep1K/0m4yjlFy5J+djtcEyVdptb/vFKnCUFFUGv6ILHkwZ1l8u
	7DRQNT73t5ZW5xE6NHl0Ane/wT4PHuZ/hOttn+KzjI2VGZ1wv5m7c3c40blbNcBDzPEeiCyBn6l
	pW/zIsZGwIwrlzpy8U=
X-Google-Smtp-Source: AGHT+IHTbPw46C3PM5pe7tynC7BzrRUNfPKPfjeqIP7I8qeBK4EysjwaqFrW1L2vQdyoBzy309Ns+wxFkWg6UuEeGbo=
X-Received: by 2002:a05:6402:34c1:b0:61c:d457:e559 with SMTP id
 4fb4d7f45d1cf-61d26c3fb81mr9527028a12.23.1756777654733; Mon, 01 Sep 2025
 18:47:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Zhixu Liu <zhixu.liu@gmail.com>
Date: Tue, 2 Sep 2025 09:46:57 +0800
X-Gm-Features: Ac12FXzH5jHhc9raQ2p4GMk2zdaDkORY97A1YpxfmZPR6R1U7h4dnejYderCZXU
Message-ID: <CALMA0xaveoq1PdvucwLGr=Oi0D7u+ouCpq7JNKc6qeMJbLUd5Q@mail.gmail.com>
Subject: [PATCH] docs: sphinx: handle removeal of utils.error_reporting in
 docutils 0.22
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

docutils.utils.error_reporting wass removed in docutils v0.22, causing sphi=
nx
extension (kernel_include) to fail with:

>   File "/usr/lib/python3.12/site-packages/sphinx/registry.py", line 544, =
in load_extension
>     raise ExtensionError(
> sphinx.errors.ExtensionError: Could not import extension kernel_include (=
exception: No module named 'docutils.utils.error_reporting')

add compatibility handling with try/except:
- SafeString =E2=86=92 str
- ErrorString =E2=86=92 docutils.io.error_string()

Signed-off-by: Z. Liu <zhixu.liu@gmail.com>
---
 Documentation/sphinx/kernel_feat.py         | 5 ++++-
 Documentation/sphinx/kernel_include.py      | 6 +++++-
 Documentation/sphinx/maintainers_include.py | 5 ++++-
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/sphinx/kernel_feat.py
b/Documentation/sphinx/kernel_feat.py
index e3a51867f27bd..95f852c0722e1 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -40,7 +40,10 @@ import sys
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
-from docutils.utils.error_reporting import ErrorString
+try:
+    from docutils.utils.error_reporting import ErrorString
+except:
+    from docutils.io import error_string as ErrorString
 from sphinx.util.docutils import switch_source_input

 __version__  =3D '1.0'
diff --git a/Documentation/sphinx/kernel_include.py
b/Documentation/sphinx/kernel_include.py
index 1e566e87ebcdd..46a6389f22e47 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -35,7 +35,11 @@
 import os.path

 from docutils import io, nodes, statemachine
-from docutils.utils.error_reporting import SafeString, ErrorString
+try:
+    from docutils.utils.error_reporting import SafeString, ErrorString
+except:
+    SafeString =3D str
+    from docutils.io import error_string as ErrorString
 from docutils.parsers.rst import directives
 from docutils.parsers.rst.directives.body import CodeBlock, NumberLines
 from docutils.parsers.rst.directives.misc import Include
diff --git a/Documentation/sphinx/maintainers_include.py
b/Documentation/sphinx/maintainers_include.py
index d31cff8674367..fdf6c2d7c3e30 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -22,7 +22,10 @@ import re
 import os.path

 from docutils import statemachine
-from docutils.utils.error_reporting import ErrorString
+try:
+    from docutils.utils.error_reporting import ErrorString
+except:
+    from docutils.io import error_string as ErrorString
 from docutils.parsers.rst import Directive
 from docutils.parsers.rst.directives.misc import Include

--
2.49.1
