Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BD32E7F3A;
	Sun, 29 Mar 2026 21:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774820908; cv=pass; b=cDepJLQbHlO/n/x+ecXWDEVKeZPj77pBqlaS1tRSIlzEoeskeYghlVkJgkiYTfNcMYCFqwn9dcwh3phl1koqjkV3U6MlgoBLw6/h7OGHx6+9CmsStmDb2ntfpHrE+qufLysa6NQlwjHBNneMhfKY/YSa3UYJfH45OWHoqtip4/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774820908; c=relaxed/simple;
	bh=d8R6/4dVbOCXRByIKijW4Y1+CW+caYPnKNTIzEgiDKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=olUTAfD/mRWbEZmNff+vr22poIlq4Y6wCJmKzHXy4P4LDJ71AYd7OmT+RUKuoh/ITNlYDF+UqFByFBOWE2zprdwjKXTtP3sgf1r0PYB9MIEpDtv8CHV+xICsmUyI9NAFI+AMmVBrbu4eQEohVMARfNjw626WGErSEAy0USvPa8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=OSOVVAFu; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="OSOVVAFu"
ARC-Seal: i=1; a=rsa-sha256; t=1774820903; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R8kN6S8Afh6PaTWFNpfJDC0F4ApVR3nwHvVIJmnP6Ly/f8vBVhZfHm4/qA5OHt9btCFpfN9Pemt09Us89m5zExRopygGd3pivjCATwwLwUVlLCKHyIieu8lC0oUtPxNcI1wQgdgPBzv3j+yeEaAnOUeIhWr1zklLCCEtvJ+E90Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774820903; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+ZA4/u6ZrfwuWP2Ph9ju9tOMYFUf5iL/rIFqbjWwC90=; 
	b=RZmfhfYoGUusFT6Go0czbkuS1vlooW10y9Zf190eBmErRisuIIPSJuQKTh+xuD81Sezj7LbnLE2wEVCrAUrN4BcZntfI7agpQNAIvQJgWPf9oOpvKtrWq5F7CVLExPpwBtlTxU5/jK3oKpacClFTzyqXHB+CLVVgaCz+MRGMpfU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774820903;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+ZA4/u6ZrfwuWP2Ph9ju9tOMYFUf5iL/rIFqbjWwC90=;
	b=OSOVVAFuY5pQ/QdYDOXi3eMLSdNlls4A/CPWuUF1OdnMzx5+t6KeUx7ppB7SHn7j
	KYMHMVnvtYVppW81L31Om9Cj43HXKdba3R8S+sr8WDZOt+5dvOAotPnRMAosr8n3fu9
	p5WWqpuy9VgPE0iSVgfcPss/XskhzNXXsde2DYZY=
Received: by mx.zohomail.com with SMTPS id 1774820900903460.598804283806;
	Sun, 29 Mar 2026 14:48:20 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rito Rhymes <rito@ritovision.com>
Subject: [PATCH] docs: add copy buttons for code blocks
Date: Sun, 29 Mar 2026 17:48:16 -0400
Message-ID: <20260329214816.10553-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add a copy button to highlighted code blocks in the documentation
that copies the full contents of the code block to the clipboard.

This is faster and less error-prone than manually selecting and
copying code from the page, especially for longer examples where
part of the block can be accidentally missed.

Keep the control hidden until the user interacts with the block so
it stays out of the way during normal reading. Reveal it on hover,
focus, and touch interaction, then copy the block contents to the
clipboard with a small success or failure state.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: Codex:GPT-5.4
Assisted-by: Claude Opus 4.6
---
Live demo:
https://kernel-docs-cp.ritovision.com/accounting/delay-accounting.html

I am willing to maintain this small feature and handle follow-up
fixes if problems come up. I do not expect it to expand
significantly beyond its current scope.

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 679861503..ac63a3448 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -376,6 +376,7 @@ highlight_language = "none"
 # Default theme
 html_theme = "alabaster"
 html_css_files = []
+html_js_files = ["copy-code.js"]
 
 if "DOCS_THEME" in os.environ:
     html_theme = os.environ["DOCS_THEME"]
diff --git a/Documentation/sphinx-static/copy-code.js b/Documentation/sphinx-static/copy-code.js
new file mode 100644
index 000000000..2684e9855
--- /dev/null
+++ b/Documentation/sphinx-static/copy-code.js
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+
+(function () {
+    const BUTTON_LABEL = "Copy code";
+    const COPIED_LABEL = "Copied";
+    const FAILED_LABEL = "Copy failed";
+    const RESET_DELAY_MS = 2000;
+
+    const COPY_ICON = `
+        <svg viewBox="0 0 24 24" aria-hidden="true" fill="none"
+             stroke="currentColor" stroke-width="2"
+             stroke-linecap="round" stroke-linejoin="round">
+            <g transform="translate(24 0) scale(-1 1)">
+                <rect width="14" height="14" x="8" y="8" rx="2" ry="2"></rect>
+                <path d="M4 16c-1.1 0-2-.9-2-2V4c0-1.1.9-2 2-2h10c1.1 0 2 .9 2 2"></path>
+            </g>
+        </svg>`;
+
+    const COPIED_ICON = '<span aria-hidden="true">✓</span>';
+    const FAILED_ICON = '<span aria-hidden="true">×</span>';
+
+    function resetButtonState(button, status) {
+        button.dataset.copyState = "idle";
+        button.setAttribute("aria-label", BUTTON_LABEL);
+        button.setAttribute("title", BUTTON_LABEL);
+        button.innerHTML = COPY_ICON;
+        status.textContent = "";
+    }
+
+    function setButtonState(button, status, state, label, icon) {
+        button.dataset.copyState = state;
+        button.setAttribute("aria-label", label);
+        button.setAttribute("title", label);
+        button.innerHTML = icon;
+        status.textContent = label;
+
+        if (button.resetTimer) {
+            window.clearTimeout(button.resetTimer);
+        }
+
+        button.resetTimer = window.setTimeout(function () {
+            resetButtonState(button, status);
+        }, RESET_DELAY_MS);
+    }
+
+    async function copyText(text) {
+        if (navigator.clipboard && navigator.clipboard.writeText) {
+            try {
+                await navigator.clipboard.writeText(text);
+                return true;
+            } catch (error) {
+                /* Fall back to execCommand below. */
+            }
+        }
+
+        /* Fall back for browsers where the async clipboard API is unavailable. */
+        const textarea = document.createElement("textarea");
+        textarea.value = text;
+        textarea.setAttribute("readonly", "");
+        textarea.style.position = "fixed";
+        textarea.style.left = "-9999px";
+        document.body.appendChild(textarea);
+        textarea.select();
+
+        try {
+            return document.execCommand("copy");
+        } catch (error) {
+            return false;
+        } finally {
+            document.body.removeChild(textarea);
+        }
+    }
+
+    function hideVisibleButtons(exceptWrapper) {
+        document
+            .querySelectorAll("div.highlight.kernel-copy-visible")
+            .forEach(function (wrapper) {
+                if (wrapper !== exceptWrapper) {
+                    wrapper.classList.remove("kernel-copy-visible");
+                }
+            });
+    }
+
+    function addCopyButton(wrapper) {
+        const pre = wrapper.querySelector("pre");
+
+        if (!pre || wrapper.querySelector(":scope > button.kernel-copy-button")) {
+            return;
+        }
+
+        const button = document.createElement("button");
+        const status = document.createElement("span");
+
+        button.className = "kernel-copy-button";
+        button.type = "button";
+        button.innerHTML = COPY_ICON;
+        resetButtonState(button, status);
+
+        status.className = "kernel-visually-hidden";
+        status.setAttribute("aria-live", "polite");
+        status.setAttribute("aria-atomic", "true");
+
+        button.addEventListener("click", async function () {
+            const ok = await copyText(pre.textContent || "");
+
+            if (ok) {
+                setButtonState(button, status, "copied", COPIED_LABEL, COPIED_ICON);
+            } else {
+                setButtonState(button, status, "error", FAILED_LABEL, FAILED_ICON);
+            }
+        });
+
+        wrapper.appendChild(button);
+        wrapper.appendChild(status);
+        wrapper.classList.add("kernel-copy-block");
+    }
+
+    function initCopyButtons() {
+        document.querySelectorAll("div.highlight").forEach(addCopyButton);
+
+        document.addEventListener("pointerdown", function (event) {
+            /* Hover already handles mouse users; this is for touch-style reveal. */
+            if (event.pointerType === "mouse") {
+                return;
+            }
+
+            const wrapper = event.target.closest("div.highlight.kernel-copy-block");
+            hideVisibleButtons(wrapper);
+
+            if (wrapper) {
+                wrapper.classList.add("kernel-copy-visible");
+            }
+        });
+
+        document.addEventListener("keydown", function (event) {
+            if (event.key === "Escape") {
+                hideVisibleButtons(null);
+            }
+        });
+    }
+
+    if (document.readyState === "loading") {
+        document.addEventListener("DOMContentLoaded", initCopyButtons, { once: true });
+    } else {
+        initCopyButtons();
+    }
+})();
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index db24f4344..57c6d5327 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -169,3 +169,76 @@ a.manpage {
 	font-weight: bold;
 	font-family: "Courier New", Courier, monospace;
 }
+
+/* Copy button for code blocks */
+/* Anchor the copy button to the highlighted code block. */
+div.highlight {
+    position: relative;
+}
+
+/* Hide the control until interaction so it stays out of the way and
+ * cannot be clicked while invisible.
+ */
+button.kernel-copy-button {
+    align-items: center;
+    background: #fafafa;
+    border: 1px solid #cccccc;
+    border-radius: 4px;
+    color: #333333;
+    cursor: pointer;
+    display: inline-flex;
+    height: 2rem;
+    justify-content: center;
+    opacity: 0;
+    padding: 0;
+    pointer-events: none;
+    position: absolute;
+    right: 0.5rem;
+    top: 0.5rem;
+    transition: opacity 0.12s ease-in-out, color 0.12s ease-in-out,
+                border-color 0.12s ease-in-out,
+                background-color 0.12s ease-in-out;
+    width: 2rem;
+    z-index: 1;
+}
+
+/* Reveal on hover/focus, or when JS marks the block visible for touch. */
+div.highlight:hover > button.kernel-copy-button,
+div.highlight:focus-within > button.kernel-copy-button,
+div.highlight.kernel-copy-visible > button.kernel-copy-button {
+    opacity: 1;
+    pointer-events: auto;
+}
+
+button.kernel-copy-button:hover,
+button.kernel-copy-button:focus-visible {
+    background: #eeeeee;
+    border-color: #cccccc;
+    color: #333333;
+}
+
+button.kernel-copy-button svg {
+    height: 1rem;
+    width: 1rem;
+}
+
+button.kernel-copy-button span {
+    font-size: 1.2rem;
+    font-weight: bold;
+    line-height: 1;
+}
+
+/* Keep live status text available to assistive technology without
+ * showing it visually.
+ */
+.kernel-visually-hidden {
+    border: 0;
+    clip: rect(0 0 0 0);
+    height: 1px;
+    margin: -1px;
+    overflow: hidden;
+    padding: 0;
+    position: absolute;
+    white-space: nowrap;
+    width: 1px;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 96ea84948..84b0cdd39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7652,6 +7652,12 @@ X:	Documentation/power/
 X:	Documentation/spi/
 X:	Documentation/userspace-api/media/
 
+DOCUMENTATION COPY CODE BUTTON
+R:	Rito Rhymes <rito@ritovision.com>
+L:	linux-doc@vger.kernel.org
+S:	Supported
+F:	Documentation/sphinx-static/copy-code.js
+
 DOCUMENTATION PROCESS
 M:	Jonathan Corbet <corbet@lwn.net>
 R:	Shuah Khan <skhan@linuxfoundation.org>
-- 
2.51.0

