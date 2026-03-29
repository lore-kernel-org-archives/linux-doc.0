Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632C9385528;
	Sun, 29 Mar 2026 18:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774807505; cv=pass; b=g7RzZMHdlBTVa97bStm7xH6g5m8n+fIYIC+gwlNrWSVquCssz+Zsu6ud2GN45ulscdkSu+wGbqYAgyH9LlxddstpYNSznIqBByQsoTVt1TgwgEQ7v/cgLwFK/G5Wmo1Fur04Mrfiy+ryRZ8ZcvS/GK2WuclehlrMPybf/2KNEao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774807505; c=relaxed/simple;
	bh=fFYmbTXxvFc8VX1L+0x+x/bgwh0HDs2OE0cH9hRYnpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QyPqqM1D/8GomWr8V+UMhBlTLEEJHCRctcsTWUUv1PIKna3cga7zyXJo+k5J83ehDKQ49Q2GmkYL3mXzj8ooEx0QU+Z8RddEOPPkZIQfNdt0KbVgLwAe0kpUos1kTe2v19vReo/ocZr3abS/FWlmOnaTTtKwbK2Tzst29E8e2kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=X0a/1clL; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="X0a/1clL"
ARC-Seal: i=1; a=rsa-sha256; t=1774807496; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZdD0yQPlbSw8PISiU9V8J8EYAE6mXFIYcdhSRkSdKkGKJlOYrhI5iPgEoh7QOka7nTKnGu5DX1uk5PqtROkcwDzlPd4t59iRwxsgSNxpBFkoWA1DmnZrTCWN2cjaIVRGTt4q0qfZ6voxVnxOUYmfyaFQUzYHqCzkvOampVie33s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774807496; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ADG7IOicePgt7pQb54xbvTjvQh+NYSMvhfrdIAvZ3VI=; 
	b=Fo4e1IXVnqDL+/C8Jx52N1nRNcGw4N/DQ/Jj//nw9m/uhhi/q12TzVmkYz1fdqHCaLqDEgaqdbSWQBVedMrhPs307Ek+2SH/3/5foXj+8jjcDfpz/kTQhVimiX3KzHN76J/6qoJHGeB0TyHLuIZLJNbKqOJIsl+PBfQTHTHGkTQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774807496;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ADG7IOicePgt7pQb54xbvTjvQh+NYSMvhfrdIAvZ3VI=;
	b=X0a/1clLkk98IvTVP9sLYo89PEdFur8U7dJyRnKY5gGjLJhO5kQt4fzid+LXk6YL
	S2Vxe20CywS53ds5rMn32y9dSCfEclzmzK/VUu7wS2r8nqocjhS912RWAvAM94kUqoF
	N+QG+Vs9nJvvVcL00ai8xwsPtHOdPi71SeXW96lY=
Received: by mx.zohomail.com with SMTPS id 1774807493610522.0861230864004;
	Sun, 29 Mar 2026 11:04:53 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH] docs: generate a static 404 page
Date: Sun, 29 Mar 2026 14:04:48 -0400
Message-ID: <20260329180448.24614-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260329152047.5736-1-rito@ritovision.com>
References: <20260329152047.5736-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Broken links in static deployments currently fall back to a
generic web server 404 page, which leaves users on an orphaned
error page with no direct way to continue navigating the
documentation site. Add a dedicated not-found page so deployments
can serve a project-specific 404 instead.

It keeps the normal documentation layout around the error state so
users still have the search box, table of contents, footer links,
and a clear route back to the documentation root. The penguin
logo makes it less generic and adds character to what is
otherwise a frustrating page to encounter.

For translated documentation, generate 404 pages whose return
link keeps users inside the current translation instead of always
sending them back to the English root documentation.

Actual 404 handling remains a web server concern.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
---
V2 adds multi-language routing support.

For 404 handling to work in nginx, point the site root at the
built documentation tree and route missing paths to the
generated 404 pages, for example:

    location / {
        error_page 404 /404.html;
        try_files $uri $uri/ =404;
    }

For translated documentation subtrees, add matching location
blocks that serve the subtree-specific 404 page, for example:

    location /translations/zh_CN/ {
        error_page 404 /translations/zh_CN/404.html;
        try_files $uri $uri/ =404;
    }

Repeat that pattern for the other translation subtrees so missing
translated pages keep users inside the current translation
instead of sending them back to the English root documentation.

I've tested the setup locally with nginx for all present translations
and the routing works fine.

These screenshots show the generated 404 page being served live in
Chrome on desktop and mobile.

Desktop screenshot:
https://github.com/user-attachments/assets/085eff0b-8661-4919-a651-6109e505ff05

Mobile screenshot:
https://github.com/user-attachments/assets/85a171f7-c2ff-483d-bc35-6719202a70e1

The screenshots above are hosted in a GitHub issue. For
convenience, anyone is welcome to post additional screenshots
there and reference them from the mailing list for discussion of
this patch:
https://github.com/ritovision/linux-kernel-docs/issues/4

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 679861503..32f3aa698 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -130,6 +130,17 @@ def config_init(app, config):
                                     "The kernel development community",
                                     "manual"))
 
+    # Generate the root 404 page and per-translation copies for full-doc builds.
+    config.html_additional_pages = {"404": "404.html"}
+    if os.path.samefile(kern_doc_dir, app.srcdir):
+        translations_dir = os.path.join(kern_doc_dir, "translations")
+        for lang in sorted(os.listdir(translations_dir)):
+            full = os.path.join(translations_dir, lang)
+            if not os.path.isdir(full):
+                continue
+
+            config.html_additional_pages[f"translations/{lang}/404"] = "404.html"
+
 # helper
 # ------
 
@@ -437,6 +448,10 @@ sys.stderr.write("Using %s theme\n" % html_theme)
 # so a file named "default.css" will overwrite the builtin "default.css".
 html_static_path = ["sphinx-static"]
 
+# Generate a simple static 404 page. Serving it for missing paths is left to
+# the web server configuration.
+html_additional_pages = {}
+
 # If true, Docutils "smart quotes" will be used to convert quotes and dashes
 # to typographically correct entities.  However, conversion of "--" to "—"
 # is not always what we want, so enable only quotes.
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..c4d28e1d4 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -169,3 +169,72 @@ a.manpage {
 	font-weight: bold;
 	font-family: "Courier New", Courier, monospace;
 }
+
+/* Center the 404 body copy without affecting normal pages.
+ * This minimum height ensures the footer remains positioned
+ * visibly at the bottom of the page despite most of the page
+ * being empty.
+ * 100% width allows for contained centering of inner contents */
+div.kernel-404-page {
+    align-items: center;
+    box-sizing: border-box;
+    display: flex;
+    justify-content: center;
+    min-height: 90vh;
+    padding: 2rem 1rem;
+    width: 100%;
+}
+
+/* Group the content as a vertical stack */
+div.kernel-404-content {
+    display: flex;
+    flex-direction: column;
+    gap: 0.75rem;
+    max-width: 28rem;
+}
+
+a.kernel-404-logo-link {
+    align-self: stretch;
+    border-bottom: none;
+}
+
+a.kernel-404-logo-link:hover {
+    border-bottom: none;
+}
+
+img.kernel-404-logo {
+    display: block;
+    height: auto;
+    margin-inline: auto;
+}
+
+div.kernel-404-content h1,
+div.kernel-404-content p {
+    margin: 0;
+}
+
+/* Make the header larger and more prominent. */
+div.kernel-404-content h1 {
+    font-size: 300%;
+}
+
+p.kernel-404-home {
+    margin-top: 0.5rem;
+    text-align: center;
+}
+
+@media screen and (max-width: 65em) {
+    /* Less viewport height because the mobile sidebar is taking
+     * up large chunk of the screen already */
+    div.kernel-404-page {
+        min-height: 40vh;
+    }
+
+    img.kernel-404-logo {
+        width: 70%;
+    }
+
+    div.kernel-404-content h1 {
+        font-size: 240%;
+    }
+}
diff --git a/Documentation/sphinx/templates/404.html b/Documentation/sphinx/templates/404.html
new file mode 100644
index 000000000..1222f3fe1
--- /dev/null
+++ b/Documentation/sphinx/templates/404.html
@@ -0,0 +1,22 @@
+{# SPDX-License-Identifier: GPL-2.0-only #}
+{% extends "layout.html" %}
+{% set path_parts = pagename.split('/') %}
+{% set home_doc = master_doc %}
+{% if path_parts|length >= 2 and path_parts[0] == 'translations' %}
+  {% set home_doc = path_parts[0] ~ '/' ~ path_parts[1] ~ '/index' %}
+{% endif %}
+{% set title = "404 Not Found" %}
+
+{% block body %}
+  <div class="kernel-404-page">
+    <div class="kernel-404-content">
+      <a class="kernel-404-logo-link" href="{{ pathto(home_doc) }}"
+         aria-label="Return home">
+        <img class="kernel-404-logo" src="{{ pathto('_static/logo.svg', 1) }}" alt="" />
+      </a>
+      <h1>404 Not Found</h1>
+      <p>The page you are searching for doesn't exist.</p>
+      <p class="kernel-404-home"><a href="{{ pathto(home_doc) }}">Return home</a></p>
+    </div>
+  </div>
+{% endblock %}
-- 
2.51.0

