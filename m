Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACE542A99
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 06:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750313788; cv=none; b=haiE5qKeqiwg8WYGLFt59Q1m6TtixzUmZJpKQYEtlwAMjsAKGloT6ds6Y9ZH5RfAAGG/mconv6hsUhnC2WHztWZMqn2Pquix59EO4ab9HbuUXg0vyna2ekBV8nNRcsJwOGxQDxOqAsrGKHfwRWHjSnjmQoDI6JHb2DGLAjb/5Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750313788; c=relaxed/simple;
	bh=CFCYcsc0lhT1pynPr6x+L9GEbfHEvlB9uwqIlhREkYE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fmJ0lXNvK5YP9sHw+5BF+Dta0fiUmJHDpA82CD8eJHx7b8+w9TBdvU7IXtgDurTWMuWqJgLax/WTl1gEVXSeyHxVEznLetd8HsfFn9NbSlDR4NN0Q4Px2RBtN0NgSgJT3ULMS4YmSPofIlgnfbRse+42YGwPb+wz5eYHLzFnai4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YD/STYTu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YD/STYTu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0A1C4CEEA;
	Thu, 19 Jun 2025 06:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750313787;
	bh=CFCYcsc0lhT1pynPr6x+L9GEbfHEvlB9uwqIlhREkYE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YD/STYTuW1NCLa63ybOfKo3b5XxZInpmISzsvuZluGnI65q8eF37dqpybnKObD0U5
	 a883VO6+KMxCoPsStRFimdTNYw+fvOXNwu8i2bnd98+N+s+ThWjMGohJSBGA6A3G6u
	 aS6FMas1VCxnv+PTv4xJU6FWVrKa9nMvm8Pjb/gh2CNOC68hTjxq/30v78Eh7fS4FB
	 rR5/MxNyMqWGRDPhf6POVdOxve7NKpFe79xeBKvWKvU4P7lhjkhwmS7kkSOTBlTAtb
	 zBeslMRAvLBB+RZiXQ0bkRryCR8U+Zbdm1YMDfLCWHGyu4NiQbVHGxXh9t7xLOQiiD
	 1kFBKjhzn+TzA==
Date: Thu, 19 Jun 2025 08:16:22 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-doc@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Subject: Re: Error at www.kernel.org/doc/html/next/ since next-20250610
Message-ID: <20250619081622.33958218@foz.lan>
In-Reply-To: <6fcb75ee-61db-4fb3-9c5f-2029a7fea4ee@gmail.com>
References: <de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com>
	<20250616140450.79b3fedb@foz.lan>
	<6fcb75ee-61db-4fb3-9c5f-2029a7fea4ee@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 19 Jun 2025 11:22:19 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Hi Mauro,
> 
> On Mon, 16 Jun 2025 14:05:36 +0200, Mauro Carvalho Chehab wrote:
> > Em Mon, 16 Jun 2025 20:18:22 +0900
> > Akira Yokosawa <akiyks@gmail.com> escreveu:  
> [...]
> 
> > > I managed to reproduce the build error using debian bookworm's distro packages
> > > which can be close enough to Sphinx 5.3.0 used there.
> > >
> > > This is the error I got from "make htmldocs":
> > >
> > > ----------------------------------------------------------------
> > > Extension error (automarkup):
> > > Handler <function auto_markup at 0x796307745bc0> for event 'doctree-resolved' threw an exception (exception: argument for warn() given by name ('stacklevel') and position (3))
> > > ----------------------------------------------------------------  
> 
> > Perhaps it is related to docutils version.  
> 
> Looks like you are right.
> 
> debian:12 (Sphinx 5.3.0) and mageia:9 (Sphinx 6.1.3) are distro releases
> whose docutils is 0.19.  They both show the same symptom.
> 
> Furthermore, if I install Sphinx by using venv and saying:
> 
>     pip install "docutils==0.19" Sphinx pyyaml
> 
> , I have Sphinx 7.3.6 and it shows the same symptom.
> 
> So you need to say "docutils!=0.19" when you install specific versions
> of Sphinx.
> 
> > 
> > Assuming that it doesn't work with certain versions of sphinx or
> > docutils, instead of reverting the entire patch, IMO the best would
> > be to add a check for Sphinx version, disabling the broken refs
> > only for too old versions.
> >   
> 
> Can you do so against docutils 0.19 only?

If we're willing to do that, IMO we need to do a more generic solution
that will compare both versions and warn if incompatibilities are
detected.

Something like the enclosed patch (it is against my latest conf.py
patch).

Thanks,
Mauro

---

[PATCH] docs: conf.py: Check Sphinx and docutils version

As reported by Akira, there are incompatibility issues with
Sphinx and docutils.

I manually checked that before docutils 0.17.1, yaml generation
doesn't work properly. Akira checked that 0.19 is problematic too.

After check Sphinx release notes, it seems that the
versions that are supposed to cope well together are:

	========  ============  ============
	Sphinx    Min Docutils  Max Docutils
	Version   Version       Version
	--------  ------------  ------------
	< 4.0.0	  0.17.1        0.17.1
	< 6.0.0	  0.17.1        0.18.1
	< 7.0.0   0.18.0        0.18.1
	>= 7.0.0  0.20.0        0.21.2
	========  ============  ============

Add a logic inside conf.py to check the above, emitting warnings
if the docutils version don't match what is known to be supported.

Reported-by: Akira Yokosawa <akiyks@gmail.com>
Closes: https://lore.kernel.org/linux-doc/6fcb75ee-61db-4fb3-9c5f-2029a7fea4ee@gmail.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 5eddf5885f77..6047ec85add1 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -9,7 +9,11 @@ import os
 import shutil
 import sys
 
+import docutils
 import sphinx
+from sphinx.util import logging
+
+logger = logging.getLogger(__name__)
 
 # If extensions (or modules to document with autodoc) are in another directory,
 # add these directories to sys.path here. If the directory is relative to the
@@ -21,11 +25,34 @@ from load_config import loadConfig               # pylint: disable=C0413,E0401
 # Minimal supported version
 needs_sphinx = "3.4.3"
 
-# Get Sphinx version
-major, minor, patch = sphinx.version_info[:3]          # pylint: disable=I1101
+# Get Sphinx and docutils versions
+sphinx_ver = sphinx.version_info[:3]          # pylint: disable=I1101
+docutils_ver = docutils.__version_info__[:3]
+
+#
+if sphinx_ver < (4, 0, 0):
+    min_docutils = (0, 16, 0)
+    max_docutils = (0, 17, 1)
+elif sphinx_ver < (6, 0, 0):
+    min_docutils = (0, 17, 0)
+    max_docutils = (0, 18, 1)
+elif sphinx_ver < (7, 0, 0):
+    min_docutils = (0, 18, 0)
+    max_docutils = (0, 18, 1)
+else:
+    min_docutils = (0, 20, 0)
+    max_docutils = (0, 21, 2)
+
+sphinx_ver_str = ".".join([str(x) for x in sphinx_ver])
+docutils_ver_str = ".".join([str(x) for x in docutils_ver])
+
+if docutils_ver < min_docutils:
+    logger.warning(f"Docutils {docutils_ver_str} is too old for Sphinx {sphinx_ver_str}. Doc generation may fail")
+elif docutils_ver > max_docutils:
+    logger.warning(f"Docutils {docutils_ver_str} could be too new for Sphinx {sphinx_ver_str}. Doc generation may fail")
 
 # Include_patterns were added on Sphinx 5.1
-if (major < 5) or (major == 5 and minor < 1):
+if sphinx_ver < (5, 1, 0):
     has_include_patterns = False
 else:
     has_include_patterns = True

