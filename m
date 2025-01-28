Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A81E531;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=hTlYKrE+sAN+zm+ZCi++ifIT7sdXDTa2JuUnpKbq/o3OFbpBi1TFrcoKl34Q80ToJfp9KYYLsoiznqR7ZwtEE+rc3ktyn7XmYitM99t6JMWxqC2zB0qiu6/q+EkaUcFrv6vr7Qwta/1u8SOEZMyR0YcQsXckEAvdpKr2PpblF2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=lDLPH7kUn/3QJcu8UsvVEA9i6yHiVOXJJkOvW7zCEkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=heSZvPdZRVtVjojvgTQtMWFj/bi/2GEX3AdyJ2vVdlf//arSxmmiP8q12PkfakOMrIyHkuC2c7rZR0iIK7A2dvW9gz3lCWzHTLwbD87nka8TkKCdUqliESRdeQJpGiVUXYM1P0QebUQUFE7ulcxUUl3H0NJe/q76RcIGTgd4LXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZY9ADmT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZY9ADmT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE40C116B1;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=lDLPH7kUn/3QJcu8UsvVEA9i6yHiVOXJJkOvW7zCEkY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sZY9ADmTIv/spHSMKkyM5ei5mSJQPp/xJtOD9WIt+iWQgOfyGJj3j9twECJZ+71/8
	 Y1DgeKvmgeRF8TDPZNA3FEZC6W4StqFxQFWszBLZnDwISWhOqD5f+g/Bj7duvJckbF
	 DCvye64iC0PiK6fxNg7BdIhy8ioAXwqjUDeNomjtRdw5Zy15huWmdLLoWTrZq1Chi9
	 Wc5AvctqrEGMv/BRs7M6xdP6JLQDrzj2iNkY5AU0dInhhp6GfV6yAs6kyeQI0eWF5/
	 tBn4oCIur5kR81tJ/XgIxF8SeE/6+otZKUY1TKIuN1K1Hb3CL6ykyKSx5QKRMIHzAV
	 YDnmEpljVnJaQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRLz-0zdR;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 25/38] docs: sphinx/automarkup: add cross-references for ABI
Date: Tue, 28 Jan 2025 01:06:14 +0100
Message-ID: <27d09dbf5e3020b4f4fb17db9f8b7c76690b24be.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Now that all ABI files are handled together, we can add a feature
at automarkup for it to generate cross-references for ABI symbols.

The cross-reference logic can produce references for all existing
files, except for README (as this is not parsed).

For symbols, they need to be an exact match of what it is
described at the docs, which is not always true due to wildcards.

If symbols at /sys /proc and /config are identical, a cross-reference
will be used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/automarkup.py | 45 ++++++++++++++++++++++++++++++
 scripts/get_abi.py                 | 11 ++++++++
 2 files changed, 56 insertions(+)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index a413f8dd5115..7d91c39b4ca6 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -11,6 +11,8 @@ from sphinx.errors import NoUri
 import re
 from itertools import chain
 
+from kernel_abi import kernel_abi
+
 #
 # Python 2 lacks re.ASCII...
 #
@@ -48,6 +50,8 @@ RE_typedef = re.compile(r'\b(typedef)\s+([a-zA-Z_]\w+)', flags=ascii_p3)
 # an optional extension
 #
 RE_doc = re.compile(r'(\bDocumentation/)?((\.\./)*[\w\-/]+)\.(rst|txt)')
+RE_abi_file = re.compile(r'(\bDocumentation/ABI/[\w\-/]+)')
+RE_abi_symbol = re.compile(r'(\b/(sys|config|proc)/[\w\-/]+)')
 
 RE_namespace = re.compile(r'^\s*..\s*c:namespace::\s*(\S+)\s*$')
 
@@ -84,10 +88,14 @@ def markup_refs(docname, app, node):
     # Associate each regex with the function that will markup its matches
     #
     markup_func_sphinx2 = {RE_doc: markup_doc_ref,
+                           RE_abi_file: markup_abi_ref,
+                           RE_abi_symbol: markup_abi_ref,
                            RE_function: markup_c_ref,
                            RE_generic_type: markup_c_ref}
 
     markup_func_sphinx3 = {RE_doc: markup_doc_ref,
+                           RE_abi_file: markup_abi_ref,
+                           RE_abi_symbol: markup_abi_ref,
                            RE_function: markup_func_ref_sphinx3,
                            RE_struct: markup_c_ref,
                            RE_union: markup_c_ref,
@@ -270,6 +278,43 @@ def markup_doc_ref(docname, app, match):
     else:
         return nodes.Text(match.group(0))
 
+#
+# Try to replace a documentation reference of the form Documentation/ABI/...
+# with a cross reference to that page
+#
+def markup_abi_ref(docname, app, match):
+    stddom = app.env.domains['std']
+    #
+    # Go through the dance of getting an xref out of the std domain
+    #
+    fname = match.group(1)
+    target = kernel_abi.xref(fname)
+
+    # Kernel ABI doesn't describe such file or symbol
+    if not target:
+        return nodes.Text(match.group(0))
+
+    pxref = addnodes.pending_xref('', refdomain = 'std', reftype = 'ref',
+                                  reftarget = target, modname = None,
+                                  classname = None, refexplicit = False)
+
+    #
+    # XXX The Latex builder will throw NoUri exceptions here,
+    # work around that by ignoring them.
+    #
+    try:
+        xref = stddom.resolve_xref(app.env, docname, app.builder, 'ref',
+                                   target, pxref, None)
+    except NoUri:
+        xref = None
+    #
+    # Return the xref if we got it; otherwise just return the plain text.
+    #
+    if xref:
+        return xref
+    else:
+        return nodes.Text(match.group(0))
+
 def get_c_namespace(app, docname):
     source = app.env.doc2path(docname)
     with open(source) as f:
diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 7435ed1071b8..faae51201504 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -404,6 +404,17 @@ class AbiParser:
 
         return desc + "\n\n"
 
+    def xref(self, fname):
+        """
+        Converts a Documentation/ABI + basename into a ReST cross-reference
+        """
+
+        xref = self.file_refs.get(fname)
+        if not xref:
+            return None
+        else:
+            return xref
+
     def desc_rst(self, desc):
         """Enrich ReST output by creating cross-references"""
 
-- 
2.48.1

