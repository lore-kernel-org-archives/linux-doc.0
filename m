Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19953321DC;
	Sun, 22 Mar 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774203785; cv=pass; b=nmJXl8ulNxg8r+ZQ0rmiaDHaXp4bkbsJ91p09+ebf3lkD128++ETScPNzp7lm4g8XklHxDSF8JwXQQpY4Rx3+0kExEGMeepbPVDMoMeDiiScUbSut8UgI5k5K+RRPK5qumzHFoSvHy+2ZvZXidhWD6bLVadPOLrS/8sn07XlMy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774203785; c=relaxed/simple;
	bh=+b6MrhDZJEnpkSe9Df7qQRFJiSFRG+Fd3mO3WH7lij8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkEOdR7HY7Sa9HDyxToYBp+FdHnxUoRzdbxuKtl+QVlrPzUJFMlEhv/iOf80EMVbdciD1GpnlhivwiBBlKnkYQQLN020JCjDbTgRruJrh/4geZgz+CBBv6IgWxhnxwbVx5O+9ixSj+OTkH1w5X6VRYUl8OjNlNYaIZf04qWEkAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=Pg7hHuIk; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="Pg7hHuIk"
ARC-Seal: i=1; a=rsa-sha256; t=1774203777; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Yx1GaM/q9NoY2HFkxu5T6uE59HRVZ5VTuVfuM1ALh9sqduosmkPDrbgssCKZ3izYv3+lH+yPVU1rdNcYHtGeXz2E6ut0+ym2KMYwZ3w9HroPwWo22fDdQGKiB/jkh4Lp6VCrqP5prTZd0UHY/zR8ig8Eh8UL8FLFc3dq61hlLWU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774203777; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2IuEDh5e2ktIJH4PqBbJowtDdhmLY9a5pJ7NRIEkcr4=; 
	b=UEpoC7KE54x7GETMLbJBTwVZ1jeXogBrGfQxup0054l9Mmkx5zYwIwEzBOGVyGvYhKHtOAcCCdo/GWbCQus4eyArxSOFiuVD2NL8k4hIILXXnSxrr0HnjR6r5Vrd4VACF3sJ2UEsklmhoGTOx+UTIrjBRaRw9HY8VraLya538c4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774203777;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2IuEDh5e2ktIJH4PqBbJowtDdhmLY9a5pJ7NRIEkcr4=;
	b=Pg7hHuIk8j7VxzOIw8nbEPh1fTVRHb69OQKX2qlKY9DXnD74xUlz8E2F4y702IDn
	tCb2f4zhoTQhoHBMN1Gjppkt/+AWPcfM3OMSROv8MYK7p1SXqBTvJP2vm/RZXDNWq7X
	lnJmP7McQfpV+D3EYJSmnjk21PidpELsNORN69sw=
Received: by mx.zohomail.com with SMTPS id 1774203774843283.7231274968931;
	Sun, 22 Mar 2026 11:22:54 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH v2] docs: rework footer with semantic markup and responsive layout
Date: Sun, 22 Mar 2026 14:22:51 -0400
Message-ID: <20260322182251.49484-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260321131857.14166-1-rito@ritovision.com>
References: <20260321131857.14166-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The current Alabaster footer uses a generic `div` container, is
hidden entirely at the theme's small-screen breakpoint, and does
not provide a responsive layout for narrower viewports.

Rework the Alabaster footer to use semantic markup while
preserving its existing content, including the copyright notice,
theme attribution, and Page source link. Structure it with a
responsive flexbox so those items remain visible and orderly on
smaller screens.

Scope the change to Alabaster so other supported themes remain
unaffected.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
v2: add Assisted-by attribution

 Documentation/conf.py                      |  6 ++++
 Documentation/sphinx-static/custom.css     | 25 ++++++++++++++++
 Documentation/sphinx/templates/layout.html | 33 ++++++++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 Documentation/sphinx/templates/layout.html

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 679861503..7ad1db83e 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -432,6 +432,12 @@ if html_theme == "alabaster":
 
 sys.stderr.write("Using %s theme\n" % html_theme)
 
+# Expose the active theme so local templates can avoid overriding
+# theme-specific markup for non-default HTML builds.
+html_context = {
+    "kernel_docs_theme": html_theme,
+}
+
 # Add any paths that contain custom static files (such as style sheets) here,
 # relative to this directory. They are copied after the builtin static files,
 # so a file named "default.css" will overwrite the builtin "default.css".
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..dfe550adf 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -23,6 +23,31 @@ div.document {
     margin: 20px 10px 0 10px;
     width: auto;
 }
+/*
+ * Use a semantic footer that stays visible on small screens and wraps
+ * its content as needed.
+ */
+footer.footer {
+    max-width: 65em;
+    margin: 20px auto 30px auto;
+    padding: 0 15px 0 10px;
+    box-sizing: border-box;
+    font-size: 14px;
+    color: #888;
+}
+
+footer.footer a {
+    color: inherit;
+}
+
+footer.footer div.footer-inner {
+    display: flex;
+    justify-content: center;
+    align-items: center;
+    flex-wrap: wrap;
+    gap: 0.35em 0.6em;
+    text-align: center;
+}
 
 /* Size the logo appropriately */
 img.logo {
diff --git a/Documentation/sphinx/templates/layout.html b/Documentation/sphinx/templates/layout.html
new file mode 100644
index 000000000..52727cabc
--- /dev/null
+++ b/Documentation/sphinx/templates/layout.html
@@ -0,0 +1,33 @@
+{# SPDX-License-Identifier: GPL-2.0 #}
+
+{%- extends "!layout.html" %}
+
+{%- block footer %}
+  {% if kernel_docs_theme == "alabaster" %}
+    <footer class="footer" role="contentinfo">
+      <div class="footer-inner">
+      {% if show_copyright %}
+        <span class="footer-item">&#169;{{ copyright }}.</span>
+      {% endif %}
+      {% if show_sphinx %}
+      {% if show_copyright %}
+        <span class="footer-sep" aria-hidden="true">|</span>
+      {% endif %}
+        <span class="footer-item">
+          Powered by <a href="https://www.sphinx-doc.org/">Sphinx {{ sphinx_version }}</a>
+          &amp; <a href="https://alabaster.readthedocs.io">Alabaster {{ alabaster_version }}</a>
+        </span>
+      {% endif %}
+      {%- if show_source and has_source and sourcename %}
+      {% if show_copyright or show_sphinx %}
+        <span class="footer-sep" aria-hidden="true">|</span>
+      {% endif %}
+        <a class="footer-item" href="{{ pathto('_sources/' + sourcename, resource=True)|e }}"
+           rel="nofollow">{{ _('Page source') }}</a>
+      {%- endif %}
+      </div>
+    </footer>
+  {% else %}
+    {{ super() }}
+  {% endif %}
+{%- endblock %}
-- 
2.51.0
