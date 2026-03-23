Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3861B388E7D;
	Mon, 23 Mar 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774280259; cv=pass; b=YgpcleZWkk4y9fVBsTUIUX1wfSgjGNbqBaEBGofDlMnvb1FJvCa9+JTqC0AlFtMdOdcUYF7Vo1eQ7mnzFJA/6rvNsNqy4piWoFMy9weLM0x+18X1/wYAove7EuIzD6Bvu+UiO2S1HYMpBi1/0sALsCmQSE5RoaEPnv9xaXcz9Fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774280259; c=relaxed/simple;
	bh=kRd9MamsZhHFX0eXeHK52K6PQIUtE4kq1Kg13hQI2kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdTJg2VeBJUE9+ulAvdNBnUo0104k5QLodz+6EGnxm3NP9+HD8m9cqpSXvGqtAFQrBV6P4XOeX8R4eUKMc7yKsxLKXnMKB9TVfzRpprrz/X54EJAMr+qOssjbmRvgml/XSEmsslCkNH2a38bw2QaPr0r1UyBuutZR4H8IQbCHio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=myxW9xtA; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="myxW9xtA"
ARC-Seal: i=1; a=rsa-sha256; t=1774280245; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EjUWoDY1aiHrpRmcavcih4CIUoB+hDcwNQ0hNmtdcZLKxKrX5Ifbo97yQIs4ECKbw0ZBWDOHJ8eMPmbQgvZF4iGZb45jgTigZqPbdNwXVtiDyaTsXWWhz0XK4o/BE6ZX0oJDFJbDT5vYWub5R/sPOdhB3Km7JFLkvGe9oHgBJtc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774280245; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hwx5iPsfiTD+smIHpTbJOj3oQ8RJOB3tC6ppa36fcak=; 
	b=HKVXQeiEbADGKuidE/pQ69Yqsya8bgioWaluQtlQgtLaOpFIFjploUMznPWyFqrFQJiAPzDKxZcF+n5h31GoY+Du1UJ/YjJx3pxFg8CzelnkVcqCV6dm8NLzWdX55z+yfY6tgjPjT0ogvF4IU707CITjk5vDOqsAvU+SzM4/pBI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774280245;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Hwx5iPsfiTD+smIHpTbJOj3oQ8RJOB3tC6ppa36fcak=;
	b=myxW9xtAxT3tb/dxNU0uSMPZC56r8rNRkhKRWq/4dp49hWd9seV0f0zl1yXgqc5E
	eTCt5znnx7RuTxOdYu0vBQBM23gJJl7U6E5E01wcQxEFvuteQaopLvG+RVVMtwgT9rX
	sCw8OUEOf0enaibsSP4QmxRBL1yforT+5bNblbmI=
Received: by mx.zohomail.com with SMTPS id 1774280244592714.6661640224551;
	Mon, 23 Mar 2026 08:37:24 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v3] docs: wrap generated tables to contain small-screen overflow
Date: Mon, 23 Mar 2026 11:37:23 -0400
Message-ID: <20260323153723.34735-1-rito@ritovision.com>
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

Examples:
  https://docs.kernel.org/6.15/kernel-hacking/locking.html
  https://docs.kernel.org/6.15/arch/arc/features.html

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v3: add latest public versioned URL examples to the patchlog

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
