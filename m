Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF781156678;
	Wed, 29 Jan 2025 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167000; cv=none; b=diUukx9sIr3pMEbnSrzgHpAyL9BPeJEtuX7Cr+PIuVL+DuYA/kCDvggcmimmZ/IXGGTQhfZOm3GlpwhwKxASgjpdjY7EKnPSbPmCcYzGUbGJAGTR+Cvh/B/v0+QgL3GBiqKdtfQWzhHNBg+dbJv1tgRvmTMLbSA1Zds7fEBqMp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167000; c=relaxed/simple;
	bh=++AiKNwTafg/Tu0+drHLEGe7eiAgM2dK0o+PygwO6Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LySTZ2mh8J/Z+0i2SABG9QmtwLqhGDufWI653lPB7kNUkNgW4rVui33kT/G8eJQUw4X+cODluDhYO0gnRFewrTMwL6sng2/tPEjB1bLA+xMcoRCuwrePRBBRuizyBKsHT/ux7bmUpaK5gKEuV+j2tLJrK/PYu3gmbJJ5l/2+F5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0Tke49c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0Tke49c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D79FC4CED1;
	Wed, 29 Jan 2025 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738166999;
	bh=++AiKNwTafg/Tu0+drHLEGe7eiAgM2dK0o+PygwO6Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y0Tke49cG/vCSdZhfqV54X6czvmVpLlobJ1Kal6aBMIeaE7NeVLSp6YsQivW8gRFG
	 6rptErsY0WKtUeDwAh2QnE02c9fzjca5Z/f4fdsumLj1nEzX3NbQw1/wqug/iaOMTj
	 eleyG9TZiFaxX4+wX/u7rURtbuzmYtjuigYqMEoxPk0Gs7hrg+z4WIU9kJvKklhhas
	 gq07+EBKZFW8zo0nDTnrTOV5jbAqB9yS39DMzXBhBe8MDRS6/vyyLW4GVTU5H5T1DV
	 qP3kHlw8ehy3YX+jiba/34dmj6pk/27XWQ+SRPOGsg9b24umHrg4O7EyQmjbs5z6DM
	 GnNfBhbC8EPhw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdAdZ-00000004PEO-1lRC;
	Wed, 29 Jan 2025 17:09:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC 2/6] docs: extensions: don't use utf-8 syntax for descriptions
Date: Wed, 29 Jan 2025 17:09:33 +0100
Message-ID: <c9e7d86efa4614e970f5cb42540ee0791d6a7118.1738166451.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738166451.git.mchehab+huawei@kernel.org>
References: <cover.1738166451.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

None of the descriptions at the Sphinx extensions are using
non-ascii characters, so no need to place them under u"""
notation.

Also, according with:
	https://docs.python.org/3/deprecations/pending-removal-in-3.16.html

the 'u' format code is scheduled to be removed in Python 3.16.

So, let's just use """.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/cdomain.py             |  4 ++--
 Documentation/sphinx/kernel_abi.py          |  6 +++---
 Documentation/sphinx/kernel_feat.py         |  4 ++--
 Documentation/sphinx/kernel_include.py      |  4 ++--
 Documentation/sphinx/kfigure.py             | 10 +++++-----
 Documentation/sphinx/load_config.py         |  2 +-
 Documentation/sphinx/maintainers_include.py |  4 ++--
 Documentation/sphinx/rstFlatTable.py        | 10 +++++-----
 8 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
index e6959af25402..6596fd00663f 100644
--- a/Documentation/sphinx/cdomain.py
+++ b/Documentation/sphinx/cdomain.py
@@ -1,6 +1,6 @@
 # -*- coding: utf-8; mode: python -*-
 # pylint: disable=W0141,C0113,C0103,C0325
-u"""
+"""
     cdomain
     ~~~~~~~
 
@@ -145,7 +145,7 @@ class CObject(Base_CObject):
     }
 
     def handle_func_like_macro(self, sig, signode):
-        u"""Handles signatures of function-like macros.
+        """Handles signatures of function-like macros.
 
         If the objtype is 'function' and the signature ``sig`` is a
         function-like macro, the name of the macro is returned. Otherwise
diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 379a877b75f9..9d45ad5d7b7e 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -2,7 +2,7 @@
 # coding=utf-8
 # SPDX-License-Identifier: GPL-2.0
 #
-u"""
+"""
     kernel-abi
     ~~~~~~~~~~
 
@@ -55,7 +55,7 @@ path = os.path.join(srctree, "Documentation/ABI")
 _kernel_abi = None
 
 def get_kernel_abi():
-    u"""
+    """
     Initialize kernel_abi global var, if not initialized yet.
 
     This is needed to avoid warnings during Sphinx module initialization.
@@ -81,7 +81,7 @@ def setup(app):
 
 
 class KernelCmd(Directive):
-    u"""KernelABI (``kernel-abi``) directive"""
+    """KernelABI (``kernel-abi``) directive"""
 
     required_arguments = 1
     optional_arguments = 3
diff --git a/Documentation/sphinx/kernel_feat.py b/Documentation/sphinx/kernel_feat.py
index 03ace5f01b5c..e3a51867f27b 100644
--- a/Documentation/sphinx/kernel_feat.py
+++ b/Documentation/sphinx/kernel_feat.py
@@ -1,7 +1,7 @@
 # coding=utf-8
 # SPDX-License-Identifier: GPL-2.0
 #
-u"""
+"""
     kernel-feat
     ~~~~~~~~~~~
 
@@ -56,7 +56,7 @@ def setup(app):
 
 class KernelFeat(Directive):
 
-    u"""KernelFeat (``kernel-feat``) directive"""
+    """KernelFeat (``kernel-feat``) directive"""
 
     required_arguments = 1
     optional_arguments = 2
diff --git a/Documentation/sphinx/kernel_include.py b/Documentation/sphinx/kernel_include.py
index 638762442336..8db176045bc5 100755
--- a/Documentation/sphinx/kernel_include.py
+++ b/Documentation/sphinx/kernel_include.py
@@ -2,7 +2,7 @@
 # -*- coding: utf-8; mode: python -*-
 # pylint: disable=R0903, C0330, R0914, R0912, E0401
 
-u"""
+"""
     kernel-include
     ~~~~~~~~~~~~~~
 
@@ -56,7 +56,7 @@ def setup(app):
 class KernelInclude(Include):
 # ==============================================================================
 
-    u"""KernelInclude (``kernel-include``) directive"""
+    """KernelInclude (``kernel-include``) directive"""
 
     def run(self):
         env = self.state.document.settings.env
diff --git a/Documentation/sphinx/kfigure.py b/Documentation/sphinx/kfigure.py
index 383f9a695b08..f1a7f13c9c60 100644
--- a/Documentation/sphinx/kfigure.py
+++ b/Documentation/sphinx/kfigure.py
@@ -1,6 +1,6 @@
 # -*- coding: utf-8; mode: python -*-
 # pylint: disable=C0103, R0903, R0912, R0915
-u"""
+"""
     scalable figure and image handling
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -165,7 +165,7 @@ def setup(app):
 
 
 def setupTools(app):
-    u"""
+    """
     Check available build tools and log some *verbose* messages.
 
     This function is called once, when the builder is initiated.
@@ -445,7 +445,7 @@ class kernel_image(nodes.image):
     pass
 
 class KernelImage(images.Image):
-    u"""KernelImage directive
+    """KernelImage directive
 
     Earns everything from ``.. image::`` directive, except *remote URI* and
     *glob* pattern. The KernelImage wraps a image node into a
@@ -481,7 +481,7 @@ class kernel_figure(nodes.figure):
     """Node for ``kernel-figure`` directive."""
 
 class KernelFigure(Figure):
-    u"""KernelImage directive
+    """KernelImage directive
 
     Earns everything from ``.. figure::`` directive, except *remote URI* and
     *glob* pattern.  The KernelFigure wraps a figure node into a kernel_figure
@@ -557,7 +557,7 @@ class kernel_render(nodes.General, nodes.Inline, nodes.Element):
     pass
 
 class KernelRender(Figure):
-    u"""KernelRender directive
+    """KernelRender directive
 
     Render content by external tool.  Has all the options known from the
     *figure*  directive, plus option ``caption``.  If ``caption`` has a
diff --git a/Documentation/sphinx/load_config.py b/Documentation/sphinx/load_config.py
index 8b416bfd75ac..ec50e1ee5223 100644
--- a/Documentation/sphinx/load_config.py
+++ b/Documentation/sphinx/load_config.py
@@ -9,7 +9,7 @@ from sphinx.util.osutil import fs_encoding
 def loadConfig(namespace):
 # ------------------------------------------------------------------------------
 
-    u"""Load an additional configuration file into *namespace*.
+    """Load an additional configuration file into *namespace*.
 
     The name of the configuration file is taken from the environment
     ``SPHINX_CONF``. The external configuration file extends (or overwrites) the
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index dcad0fff4723..d31cff867436 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -3,7 +3,7 @@
 # -*- coding: utf-8; mode: python -*-
 # pylint: disable=R0903, C0330, R0914, R0912, E0401
 
-u"""
+"""
     maintainers-include
     ~~~~~~~~~~~~~~~~~~~
 
@@ -37,7 +37,7 @@ def setup(app):
     )
 
 class MaintainersInclude(Include):
-    u"""MaintainersInclude (``maintainers-include``) directive"""
+    """MaintainersInclude (``maintainers-include``) directive"""
     required_arguments = 0
 
     def parse_maintainers(self, path):
diff --git a/Documentation/sphinx/rstFlatTable.py b/Documentation/sphinx/rstFlatTable.py
index 16bea0632555..180fbb50c337 100755
--- a/Documentation/sphinx/rstFlatTable.py
+++ b/Documentation/sphinx/rstFlatTable.py
@@ -2,7 +2,7 @@
 # -*- coding: utf-8; mode: python -*-
 # pylint: disable=C0330, R0903, R0912
 
-u"""
+"""
     flat-table
     ~~~~~~~~~~
 
@@ -99,7 +99,7 @@ class colSpan(nodes.General, nodes.Element): pass # pylint: disable=C0103,C0321
 class FlatTable(Table):
 # ==============================================================================
 
-    u"""FlatTable (``flat-table``) directive"""
+    """FlatTable (``flat-table``) directive"""
 
     option_spec = {
         'name': directives.unchanged
@@ -135,7 +135,7 @@ class FlatTable(Table):
 class ListTableBuilder(object):
 # ==============================================================================
 
-    u"""Builds a table from a double-stage list"""
+    """Builds a table from a double-stage list"""
 
     def __init__(self, directive):
         self.directive = directive
@@ -212,7 +212,7 @@ class ListTableBuilder(object):
         raise SystemMessagePropagation(error)
 
     def parseFlatTableNode(self, node):
-        u"""parses the node from a :py:class:`FlatTable` directive's body"""
+        """parses the node from a :py:class:`FlatTable` directive's body"""
 
         if len(node) != 1 or not isinstance(node[0], nodes.bullet_list):
             self.raiseError(
@@ -225,7 +225,7 @@ class ListTableBuilder(object):
         self.roundOffTableDefinition()
 
     def roundOffTableDefinition(self):
-        u"""Round off the table definition.
+        """Round off the table definition.
 
         This method rounds off the table definition in :py:member:`rows`.
 
-- 
2.48.1

