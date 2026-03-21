Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36B228B4E2;
	Sat, 21 Mar 2026 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100309; cv=pass; b=CTadNHQRdZ9LD3w3iJz0y9sVyvtMst0gLJCWNnT7Mwd3ReQz5aC5K+OqTltvNsGD1zzZg+dkaPvPGNe9+qSlBpW9oA9dQr8Wr1LX9qH4oor0bg6GXc0lL/3/mMDYkD0LJvwd+6/lvxZmUGFAPXMQS6sZRX6YtTVN96s97rCtFps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100309; c=relaxed/simple;
	bh=KIN+rn0OYANebg+XzJ2lsQTvWqF9QLYdsl43H4Tyrwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OC50rQRsElmXzvbL+NdjK0hfq7RQ9kA6z6b6PJ1/7CAXf/WnpPlNaOk2+87hnB/XOqdhjHBPtMwrDXpQW7LOE6SrAQ+wIQffqVHhj/8gdbJvav0MHFg3WsW5VdYMuPI2d2JFNt48z3RZ9wrXTSruOlg5jCA9xSZetT+WdSeTWr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=fhRpX0Od; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="fhRpX0Od"
ARC-Seal: i=1; a=rsa-sha256; t=1774100298; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EwGF8/UQFYzfpsBLht7zXtT1Tno5nL2P2/GIgZU7dpS2PfXYuCNhJmESSQid4rwob3DjLtcRxmTeXHis0nEnSfriElQfalEwkb4trQN8bqCXA7m/qM4F0AW8Bym3vYawCPF4mZC1ZRthMHxyeEuBwBjLm2tr0YqZVQvJmTfQZc4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774100298; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SOS2HEDPUC6Ap2Za6bmsztJss9L6rcR1HGVmp276Kv8=; 
	b=dm2fMQ96TLZy79dFYnpQAdaNnIjnarm6J3CIy+6gyt0TvqST8DLY6+Ua7NUT8sIIGG1GVvWQsr2vjXweDjXjuMrJZ6F+u7dMjjB/56A09NSKRMDI+fBxYXWpUrgHz8A1fyd34AZ0LhghOy++yf3eHY1lTpjKkkrsgowwpQk4+dI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774100298;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SOS2HEDPUC6Ap2Za6bmsztJss9L6rcR1HGVmp276Kv8=;
	b=fhRpX0OdUH/tKqU4DI9avj2k22FRJIck9umpeDVZ3/HfFRUxHbtIFgUbM2bC2HCF
	UZhl+P3i2/UUcJEj1AAmbKqqzbig9kmZnrrocTRaLR7kLmnSC5RwI/NbrleDHl7ecIs
	kj5ulUxy7Hnz277s0EmXYjhi8sJn92F7PzZk7ds0=
Received: by mx.zohomail.com with SMTPS id 17741002970631022.4755935249059;
	Sat, 21 Mar 2026 06:38:17 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH 1/1] docs: wrap generated tables to contain small-screen overflow
Date: Sat, 21 Mar 2026 09:38:11 -0400
Message-ID: <20260321133811.17854-2-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321133811.17854-1-rito@ritovision.com>
References: <20260321133811.17854-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some documentation tables exceed the fixed-width main content column.
On desktop this is usually acceptable because they can overflow the
800px body without harming readability, but on smaller screens the
same tables create page-wide horizontal scroll overflow that breaks the
layout.

Wrap generated HTML tables in a dedicated container. Above
Alabaster's existing 65em breakpoint, the wrapper uses
`display: contents` to preserve current desktop rendering. At and
below that width, it becomes a horizontal scroll container so table
overflow is contained locally instead of breaking page layout.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
---
 Documentation/conf.py                  |  1 +
 Documentation/sphinx-static/custom.css | 16 ++++++++++++++
 Documentation/sphinx/table_wrapper.py  | 30 ++++++++++++++++++++++++++
 3 files changed, 47 insertions(+)
 create mode 100644 Documentation/sphinx/table_wrapper.py

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 679861503..51756d779 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -159,6 +159,7 @@ extensions = [
     "sphinx.ext.autodoc",
     "sphinx.ext.autosectionlabel",
     "sphinx.ext.ifconfig",
+    "table_wrapper",
     "translations",
 ]
 # Since Sphinx version 3, the C function parser is more pedantic with regards
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..d7c8c4f18 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -23,6 +23,13 @@ div.document {
     margin: 20px 10px 0 10px;
     width: auto;
 }
+/*
+ * Wrap generated tables in a container that preserves desktop overflow
+ * while allowing contained scrolling on smaller screens.
+ */
+div.body div.table-overflow {
+    display: contents;
+}
 
 /* Size the logo appropriately */
 img.logo {
@@ -96,6 +103,15 @@ input.kernel-toc-toggle { display: none; }
     div.kerneltoc a { color: black; }
 }
 
+@media screen and (max-width: 65em) {
+    div.body div.table-overflow {
+        display: block;
+        max-width: 100%;
+        overflow-x: auto;
+        overflow-y: hidden;
+    }
+}
+
 /* Language selection menu */
 
 div.admonition {
diff --git a/Documentation/sphinx/table_wrapper.py b/Documentation/sphinx/table_wrapper.py
new file mode 100644
index 000000000..dfe8c139b
--- /dev/null
+++ b/Documentation/sphinx/table_wrapper.py
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+"""Wrap generated HTML tables in a responsive overflow container."""
+
+from sphinx.writers.html5 import HTML5Translator
+
+__version__ = "1.0"
+
+
+class TableWrapperHTMLTranslator(HTML5Translator):
+    """Add a wrapper around tables so CSS can control overflow behavior."""
+
+    def visit_table(self, node):
+        self.body.append('<div class="table-overflow">\n')
+        super().visit_table(node)
+
+    def depart_table(self, node):
+        super().depart_table(node)
+        self.body.append("</div>\n")
+
+
+def setup(app):
+    for builder in ("html", "dirhtml", "singlehtml"):
+        app.set_translator(builder, TableWrapperHTMLTranslator, override=True)
+
+    return dict(
+        version=__version__,
+        parallel_read_safe=True,
+        parallel_write_safe=True,
+    )
-- 
2.51.0

