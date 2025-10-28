Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D634FF50
	for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 20:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761682251; cv=none; b=p/4FOiUapmBBTA6z8/Cy3v0aT3EwSV5woEjlsKNXRamz6T/fSnDv0J62vw6Mr53d/AWqzMYSrFDJYZ1JghADZWFdO6rLpCZMB0f0AhquB2PXpfyZx4t+4Y5OdXe1qdEjjLoeEi3PV4Qcxk3NiqXzK/7POIe3rYsmpSe/ZbYnexE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761682251; c=relaxed/simple;
	bh=pUHPRBdDDONA/O66jwynkI4x4nubnLmx4ucFqJin5i4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvzwVyopxu6hLVXwe+34HkvpfOuqLxwQfEg4iji6ETXNH11E0Zuk7PB0k+P0e96Ic+KKWemqI6cJVzbjVE2feXrWp9tvT8i80RqVBlHeeXFniRB+gBoPiG6HoLk9vimXxmYewBe6bnOZYfLMQ9Ik98O2tD2fDVgWwiSnWkULJFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lh5fYYx2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lh5fYYx2"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso82290166b.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Oct 2025 13:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761682247; x=1762287047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYbM5VqA2h8bTAF81hKCgUCN3dB3o71pNwwlueoz59E=;
        b=lh5fYYx2+fAIwy/dZwuAMVQXWsQdr2E11XtNvcMdrtObC82HL06j7f1cgfeUlfhbOy
         TiVvZ/U40jhCvelswYDlB5aFayWJHFyCofOWlNj1wOEiJaVNt5CQV4xGRj2IwbgT5rRw
         J/hinMclNfF098+nefOJK1i+ntqDZH0YHAfDTPlvSll8dwyxmT0CgJO+CQcf3WMhn5cG
         wUZVnbGDAfRc5T82tKuUyuZKWF3VQwPcFE5krFAWTCBzMfWi0PiiqpzYE3JO4WxTG47G
         g5pIoYv4+ZFILINAPkDtQx1ewLwilNyg17VtWzOSzPyDPc2DV1cI26oaHJXfyOvQbOoe
         bQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761682247; x=1762287047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYbM5VqA2h8bTAF81hKCgUCN3dB3o71pNwwlueoz59E=;
        b=H7uSvKAL68pM0CLWChnUwl0A+nMDgRktzmd6rmkfl620H8xjheSihOvwYrQaQFsxBo
         12pHw05Kalasd5A9PVzaFbnYwmjjqGX/kk3yR8fT+i+O/5cdVoPifvs1pqpQ9HhMoDuA
         nxh8sySUePBIZ8VboPmtUM3cuavkuhawRE8BKcUO/+oA4eZBeZ3Tbbc1fdXpmWQsqcJI
         rttJoNnAv/qF2lukZx2GWyxLuU0bwAepXBuiByh0MN6B1qG8u2vMQN/CUqQ4C1y22GAK
         URSrdqxltg9VKVrkiCwC4ugKNN4QOyfnzxQErfVzVZANHYP/PaJaTvClz1OZncVZ0Wqn
         9C2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVseANwE4oAeI3hj6kpdHTGrqfeSu5YcmRV/eKpaDz0ckoDJTcMqvtIQyJSYk6maKM0suCX3oAwCo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNGEfv86V5hxZxTxdu9TbUcu/P0XsdB6BVEBiXBqc41z6k3bGT
	DW/QtGjX/JVihRo7XWG2xCp7eR1xtxOmSRwkVU4oDYfsMD62IKLTrLb1
X-Gm-Gg: ASbGncsC83CCc6T2OQ6a1/qfM77STIVjE6StkMyWNmGoLz355ZCYYsWXpdJBx2xOTdo
	o1aY7bfsG73fyXEeYMupjPsudg+ulMqBb7zVWuZ1+3PskxoPHXsOarFuoM6+trybmCz7aFJ6JYM
	2Eng2TGrR+WlWFPXgPXk1fRsCKqUmw0Lo06Mz1bXVWulij3r8UmvxygesQ/lt0hMeRK8/stM18F
	dNIDrN/gDi2tPyd3D6gTUkKBKhFRPgN52Ao6IHkCBtqHhcI/kzPsoUz9am1Oj5ndhbu2t2npVbP
	FbCWj7KvAWvzbK9tmrhLXfOFGPcEGYWiw3oIhisS/2n2UZCF80YzeNODzH7RlgCkc92ETY2s5en
	pRl/nMO4OVMcUYfmr1oPNxHRr+ZaL2siyo8+VOCKTUou9y5CjrQkEcMYBcGuwtmuNtdD4u2ZYQD
	rhf1c+FkUY24B+6EPYHEtZx4lPqPneT7XkjA==
X-Google-Smtp-Source: AGHT+IE9cnCMVYrUzdBoDKJ3/QlmGC7kQ6V1NF08QBfIzmAIZdRVO+iWAw9txp7v3oAR26OFhr2WHA==
X-Received: by 2002:a17:907:7e8d:b0:b61:e088:b560 with SMTP id a640c23a62f3a-b6dbbe71f7amr433431266b.4.1761682247112;
        Tue, 28 Oct 2025 13:10:47 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8541e99fsm1202522666b.61.2025.10.28.13.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 13:10:46 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 479B3BE2EE7; Tue, 28 Oct 2025 21:10:45 +0100 (CET)
Date: Tue, 28 Oct 2025 21:10:45 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Andreas Radke <andreas.radke@mailbox.org>,
	stable <stable@vger.kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>, Zhixu Liu <zhixu.liu@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Please backport commit 00d95fcc4dee ("docs: kdoc: handle the
 obsolescensce of docutils.ErrorString()") to v6.17.y
Message-ID: <aQEjRT5JBLYiBTaL@eldamar.lan>
References: <aPUCTJx5uepKVuM9@eldamar.lan>
 <DDS2XJZB0ECJ.N4LNABSIJHAJ@mailbox.org>
 <aP4amn4YQDnzBBCU@eldamar.lan>
 <87wm4gpbw6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="93bPQ0Xi2feWC2Ni"
Content-Disposition: inline
In-Reply-To: <87wm4gpbw6.fsf@trenco.lwn.net>


--93bPQ0Xi2feWC2Ni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Oct 27, 2025 at 10:06:33AM -0600, Jonathan Corbet wrote:
> Salvatore Bonaccorso <carnil@debian.org> writes:
> 
> > Hi,
> >
> > On Sun, Oct 26, 2025 at 08:36:00AM +0100, Andreas Radke wrote:
> >> For kernel 6.12 there's just one more place required to add the fix:
> >> 
> >> --- a/Documentation/sphinx/kernel_abi.py        2025-10-23 16:20:48.000000000 +0200
> >> +++ b/Documentation/sphinx/kernel_abi.py.new    2025-10-26 08:08:33.168985951 +0100
> >> @@ -42,9 +42,11 @@
> >>  from docutils import nodes, statemachine
> >>  from docutils.statemachine import ViewList
> >>  from docutils.parsers.rst import directives, Directive
> >> -from docutils.utils.error_reporting import ErrorString
> >>  from sphinx.util.docutils import switch_source_input
> >> 
> >> +def ErrorString(exc):  # Shamelessly stolen from docutils
> >> +    return f'{exc.__class__.__name}: {exc}'
> >> +
> >>  __version__  = '1.0'
> >> 
> >>  def setup(app):
> >
> > Yes this is why I asked Jonathan, how to handle backports to older
> > series, if it is wanted to pick specifically as well faccc0ec64e1
> > ("docs: sphinx/kernel_abi: adjust coding style") or a partial backport
> > of it, or do a 6.12.y backport of 00d95fcc4dee with additional
> > changes (like you pointed out).
> >
> > I'm just not sure what is preferred here. 
> 
> I'm not sure it matters that much...the additional change suggested by
> Andreas seems fine.  It's just a backport, and it shouldn't break
> anything, so doesn't seem worth a lot of worry.

Okay here is a respective backported change for the 6.12.y series as
well.

Does that look good for you?

Regards,
Salvatore

--93bPQ0Xi2feWC2Ni
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-docs-kdoc-handle-the-obsolescensce-of-docutils.Error.patch"

From aceb23b9348b98fb93a57cb70149ca8c43962aec Mon Sep 17 00:00:00 2001
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
[ Salvatore Bonaccorso: Backport to v6.17.y for context changes in
Documentation/sphinx/kernel_include.py with major refactorings for the v6.18
development cycle. Backport ErrorString definition as well to
Documentation/sphinx/kernel_abi.py file for 6.12.y where it is imported
from docutils before the faccc0ec64e1 ("docs: sphinx/kernel_abi: adjust
coding style") change. ]
Suggested-by: Andreas Radke <andreas.radke@mailbox.org>
Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
---
 Documentation/sphinx/kernel_abi.py          | 4 +++-
 Documentation/sphinx/kernel_feat.py         | 4 +++-
 Documentation/sphinx/kernel_include.py      | 6 ++++--
 Documentation/sphinx/maintainers_include.py | 4 +++-
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 5911bd0d7965..51a92b371872 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -42,9 +42,11 @@ import kernellog
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
diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
index 03ace5f01b5c..2db63dd20399 100644
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
index 638762442336..ccbddcc4af79 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -34,13 +34,15 @@ u"""
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
@@ -111,7 +113,7 @@ class KernelInclude(Include):
             raise self.severe('Problems with "%s" directive path:\n'
                               'Cannot encode input file path "%s" '
                               '(wrong locale?).' %
-                              (self.name, SafeString(path)))
+                              (self.name, path))
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index dcad0fff4723..496489d634c4 100755
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


--93bPQ0Xi2feWC2Ni--
