Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8FC1A316E
	for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760887378; cv=none; b=WifEopoAG20QYwncFy2dAig5AuLxibQhFw6a36hrSRT052jRCcyr7KiHZTx/gSYqc8RGXq2QGJpM+z0ehO+8VVEAVTInIpMVdtK1Fh0FGEFggaPL9r448xnK3YDMmP5cfafxWcqgSPd1iU4Q8n7JYm63exmdXg0tkxgY7J3tJwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760887378; c=relaxed/simple;
	bh=Zz92a5a6F3OLN4+cHI8/iueNB31Pm2/6LWIwcBhXKnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=laD0OUjzYqC832GFN8H6ueUKTS+1DJYckeQJZ6gphyUULP0oY1pselvW/zxZtkT6n9xKeK4e4e3+81alJCLFBpHx1R/sJL+XbIQfl2WMT8+gIHgFVe9y3dYAFwwoJgzUlyk6OrYSKUcXqKot/lbhSp8cNUSFqIibKQJklhX+vTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTsYY+Bw; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTsYY+Bw"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63c4b5a1b70so2941430a12.1
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760887375; x=1761492175; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MSnXD2Zmi5qJWzsOosYUwmf0Z7kdjKXL81lyMDVKmyQ=;
        b=OTsYY+BwGJRW8zzGrbilunkGAF3yO78SXa5QmbRZW4uI7gG3HJSNb0InZxcYGVwbXC
         TwuT+guAJFLYZK9CjDvVv9LNg+GXyvGNuYNQ50ncmWEfIx2RzImzA7SaEKo4BxNNTEt0
         8tCXS8PhCPApLY1h6HdE4merOQwxR8hKnlUWtxFX97yrs0g33g1BtWnCorH/JDw6dVli
         ktXsuB6bu1JzwSqom4k7f94ODvcw/jBbWptD1Y/Zdl4eOovh5GewJVCo46lj/YwvNYGe
         p2U0WnGv3ypZ4TkwYMF37Bl+tItnaFtF8YCU+E1xqzUHHXuqtc8gumjo+PTHtSFVnyTJ
         ahEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760887375; x=1761492175;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSnXD2Zmi5qJWzsOosYUwmf0Z7kdjKXL81lyMDVKmyQ=;
        b=m86/himdT7kFZ7/BL41YzuAGagGVeH/2k7G9etP1SCfSBOPcuiqHsahkXQ/QCP7y4Y
         nwOxewb36cz5liEAD5P0DmBEO7hrpuO2DTQE1sSyBQ1PQ/r2qGwaEmeZe2bCd21r4qD1
         DkOp7t7aOqk6iAaziuMaQeJaSgllX76bUNJhZUGxnQILRpWVamOfcjcTHh+kcg769y0z
         z3hxei5jZPMS08HbbUDQMY77FM0IYzZv0KLTV5vS/wCJGZebf+mjnuVpop3za0tX/8EH
         mWOm5g5fI4vUCTIcusQN7vG5nbGF3qqMsGPJkzqNdt0bl250kirVmDP+7D0VjI6B7sf/
         s4+g==
X-Forwarded-Encrypted: i=1; AJvYcCUAZ/ftRIyr5ErGVwVVgD6cNF6zJzaKtGc3cagic6duiIuYbsXrzXJyBgLm0ZNSMZJDCYJF9sHQrrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsqrIPB8Qp4qhek/bML/60Y0lO+5rRqg0CgmOmKON7XvDFJDbL
	iLClth+v12JFRcQwFKWisTxyqKKdoG5jVT72sY6L7SM1aAQpj6FkiaQE
X-Gm-Gg: ASbGncsjKvVdNmTcS4/++kHfd0XZBU1ABnbnJfshHX8gTv+q/EMJenSA5SWnBlW4OiE
	k+g/ZQZ0xEjRvlaOM1oiuJ/7wDS7sWTZ9xVfUHWur9Fl623cQnZcIT6rQkyr5iQTRDqhhUFL02W
	yglMnXW/yJiW13xh/Njl2dJ/7m4XCptTqYmSRO5NBrXxpS6+2XBbAPseC7y0gq3wh7V7f5BGoxv
	lUBrshKe/vAFwKukFv50nvKKTBiGbjyLu2Tf7KBiMKqFmRgIkZ/vRRMCh1MzJTmxO0ES9KiJD6S
	TABDgUHOoVPd4q2zqeFwLoAlLfAMxu+9DFgP/NbBwD0EjxE47V+O1N1dClAs8+ak0metFlRRlKh
	0OmBjZ1wem9/Hs8ivYIwBWpqUSdphfukAv+O9jW5LmyGNoIMUPvohPiQSCwVrANh/aGn8soWtv7
	I4/nRD81Y0Ueaayk0haINyQnlWGJM0AA5bNFD124uSfbk/
X-Google-Smtp-Source: AGHT+IHuFocc8BNakcfqGS1AHLgn/UuD0B8nQBSuq2pBaAorx95IiaLxFMLNHjUTaIEuqZHKWnp/Lw==
X-Received: by 2002:a05:6402:2713:b0:62e:e5b3:6388 with SMTP id 4fb4d7f45d1cf-63c1f6b4d48mr10629131a12.19.1760887374833;
        Sun, 19 Oct 2025 08:22:54 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4945f1ffsm4441882a12.31.2025.10.19.08.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 08:22:53 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id DB8A7BE2EE7; Sun, 19 Oct 2025 17:22:52 +0200 (CEST)
Date: Sun, 19 Oct 2025 17:22:52 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: stable <stable@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, Zhixu Liu <zhixu.liu@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Please backport commit 00d95fcc4dee ("docs: kdoc: handle the
 obsolescensce of docutils.ErrorString()") to v6.17.y
Message-ID: <aPUCTJx5uepKVuM9@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8V4LYA5lItWc3kMQ"
Content-Disposition: inline


--8V4LYA5lItWc3kMQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

When people update docutils to 0.22, then the Documentation build will
start failing as documented with the commit 00d95fcc4dee ("docs: kdoc:
handle the obsolescensce of docutils.ErrorString()").

So it would be nice if people can still build the documenation with
newer versions (was for instance relevant for Debian unstable for
building the 6.17.y based packages): https://bugs.debian.org/1118100

Thus can you please backport 00d95fcc4dee ("docs: kdoc: handle the
obsolescensce of docutils.ErrorString()") down to 6.17.y stable
series? The commit does not apply cleanly so adding a backport for it.

Actually it would be nice to go further back, but I just tested as
well 6.12.y and there due to missing faccc0ec64e1 ("docs:
sphinx/kernel_abi: adjust coding style") there are more work.

faccc0ec64e1 ("docs: sphinx/kernel_abi: adjust coding style") should
be applicable but I'm not sure if you want to support that. Jonathan
what would you think?

Regards,
Salvatore

--8V4LYA5lItWc3kMQ
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-docs-kdoc-handle-the-obsolescensce-of-docutils.Error.patch"

From c2ce9e6de0a3dfea99de08af7b5eef5c983e76c8 Mon Sep 17 00:00:00 2001
From: Jonathan Corbet <corbet@lwn.net>
Date: Tue, 9 Sep 2025 13:35:37 -0600
Subject: [PATCH] docs: kdoc: handle the obsolescensce of
 docutils.ErrorString()

commit 00d95fcc4dee66dfb6980de6f2973b32f973a1eb upstream.

The ErrorString() and SafeString() docutils functions were helpers meant to
ease the handling of encodings during the Python 3 transition.  There is no
real need for them after Python 3.6, and docutils 0.22 removes them,
breaking the docs build

Handle this by just injecting our own one-liner version of ErrorString(),
and removing the sole SafeString() call entirely.

Reported-by: Zhixu Liu <zhixu.liu@gmail.com>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
Message-ID: <87ldmnv2pi.fsf@trenco.lwn.net>
[Salvatore Bonaccorso: Backport to v6.17.y for context changes in
Documentation/sphinx/kernel_include.py with major refactorings for the v6.18
development cycle]
Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
---
 Documentation/sphinx/kernel_feat.py         | 4 +++-
 Documentation/sphinx/kernel_include.py      | 6 ++++--
 Documentation/sphinx/maintainers_include.py | 4 +++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
index e3a51867f27b..aaac76892ceb 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -40,9 +40,11 @@ import sys
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives, Directive
-from docutils.utils.error_reporting import ErrorString
 from sphinx.util.docutils import switch_source_input
 
+def ErrorString(exc):  # Shamelessly stolen from docutils
+    return f'{exc.__class__.__name}: {exc}'
+
 __version__  = '1.0'
 
 def setup(app):
diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index 1e566e87ebcd..641e81c58a8c 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -35,13 +35,15 @@
 import os.path
 
 from docutils import io, nodes, statemachine
-from docutils.utils.error_reporting import SafeString, ErrorString
 from docutils.parsers.rst import directives
 from docutils.parsers.rst.directives.body import CodeBlock, NumberLines
 from docutils.parsers.rst.directives.misc import Include
 
 __version__  = '1.0'
 
+def ErrorString(exc):  # Shamelessly stolen from docutils
+    return f'{exc.__class__.__name}: {exc}'
+
 # ==============================================================================
 def setup(app):
 # ==============================================================================
@@ -112,7 +114,7 @@ class KernelInclude(Include):
             raise self.severe('Problems with "%s" directive path:\n'
                               'Cannot encode input file path "%s" '
                               '(wrong locale?).' %
-                              (self.name, SafeString(path)))
+                              (self.name, path))
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index d31cff867436..519ad18685b2 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -22,10 +22,12 @@ import re
 import os.path
 
 from docutils import statemachine
-from docutils.utils.error_reporting import ErrorString
 from docutils.parsers.rst import Directive
 from docutils.parsers.rst.directives.misc import Include
 
+def ErrorString(exc):  # Shamelessly stolen from docutils
+    return f'{exc.__class__.__name}: {exc}'
+
 __version__  = '1.0'
 
 def setup(app):
-- 
2.51.0


--8V4LYA5lItWc3kMQ--
