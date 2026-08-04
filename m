Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A340471D0F
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859210; cv=none; b=lcUMvZ2pFdVBe+miBaUwHDClbzIztGKxUG59fcktw8KA72zIupuw8izYX7mEytSIxYhfdGA4OmKBomWWI5sdWwDCKmVTqlQGC3L0HNq/J9jhX3FaPRsvZFztK+oiFbTOtBHNwcz6FNSTEZrnwIfYMS9iwG1oMR2vqjyxXAnJUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859210; c=relaxed/simple;
	bh=HU7cYmvbSbRshrJ/kuuJMfToQoDrY3Cm0VY2le3w8Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVihu613qkeWahdDOCUrDlZvmPoHln5rspzWIUQoIgus3IY+DFvD4UXWAE/EFK7MCzbPgxly+hY0NCYuFnWp8dYr2SulDqgUzr0NhJJIbuYShJrMcLW8IhloDEk0/VKUlWHqMxflbx49LkvCvZMuINrYG1KjDF0phyE40qnZhKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RjSZjgyw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RjSZjgyw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7E3A51A140F
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 16:00:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BE516029E;
	Tue,  4 Aug 2026 16:00:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9328911C330E9;
	Tue,  4 Aug 2026 17:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785859198; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YkZvC1p+DD+q5AG/e9wSRjV6RfiGviNH1J47rikniv8=;
	b=RjSZjgywtw7+cghx2B1uCgbzUrGq1c61hzaL+yt5dVxZNAjROhIu4S1JXCv5ZB6q9QcCzL
	58EDX/TAIzzSOA/D14ya5NQ65RKO9d73RnuyX+bIEh0XKQDNQA7bTRS40YzwlGms3wM9+Q
	oADkcoPk8t4vPB3xJbDBbtmt57mR0nK+kyRnp8LNlct1kpc9q5CtxW+WYMZsgZljst6vcB
	07k5/WkHpH6bcLrpUczgL8K8ViIXejwFF7ijPvr+X13MlimSW3PtYUShjcQtykJFZcMypg
	vz5TPWjA8FYMWX6ZeLYyluLXIk0BH9XP8i9DfP2+ofAUSZnHET2Br/1z2qQO1g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 04 Aug 2026 17:59:34 +0200
Subject: [PATCH v2 1/2] Documentation: html: show sections in the sidebar
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260804-show-sections-in-sidebar-v2-1-a68d23bbc79d@bootlin.com>
References: <20260804-show-sections-in-sidebar-v2-0-a68d23bbc79d@bootlin.com>
In-Reply-To: <20260804-show-sections-in-sidebar-v2-0-a68d23bbc79d@bootlin.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Randy Dunlap <rdunlap@infradead.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3340;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HU7cYmvbSbRshrJ/kuuJMfToQoDrY3Cm0VY2le3w8Ps=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqcgx2+i+R3m6d7Gw8jT0bad58wUqDzsXLdTr/d
 2BUbgqsMuuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanIMdgAKCRDRgEFAKaOo
 NjOvEACO0qfT2jS+dx0+QQcoKt+9kuCI4uSjRC8OSyckFL1s2388hL21wM+/f0iOibO/nIL/pF7
 T9se/eyDUwPQabi4YM4FYr5WmsftoqRfWK1sqBkBkOOQeqwdf+NBEzz/VMlBT97ULknlfUCmZkb
 lp0M+tNh2GmwtPHiM3WGV4amSlyZ52je8Ia53pIFAEbSp3v5XoSaBS54mBbiDOCZTkgefw9fspD
 QyrHMzZm4ykPvbYPls5g7kEeTHdQMcK+L4Gve9fxJQP9E80wgzfN+Z6Bwx7o4/+U/G10FWygk9+
 slp/oS/AQWrJSz7JROfL4652F3QR2JoYPG0R7y2rH3aKyLamOefFU1ssXIHEjApqMZDC2XzbyNs
 wMTHoim3xCsfG0KfOn5bx6hABe869mJ219e/EV0CJ1w7Rh3hdflOyDhdZz9JkC3VIpLLEHFm0VZ
 44oGUFH1a8uAF1hM7XdQjGjS+uyneRzDkFMyojLrdWdWSBHz+hu6AMCUAuOX0aI1FvQGZck3U0Z
 FFWpTGX7C6JUkorvkNFYaTg+XePt5gZjdgLf7k54FuDXetvCkHdm0Ay46HgQMBOBB5jkYREj8o+
 fVzvoSnfp0tBd2wh/D7tvUTR/smGkVLxKpLYaBhf7RIUOTAWZN8XP9vHsb7x/1mPm5vzXqlueC2
 inQoRm7KegLX4Ew==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

The current sidebar in the HTML version of the documentation does not
display the section titles because the toctree directives in the
top-level index.rst document do not contain ":caption:" properties.
Replacing the current section titles by ":caption:" properties would not
allow having text between those and the table of contents.

To workaround this issue, add the ":caption:" properties in the toctree
calls which makes them show up in the sidebar, but hide them from the
index page with a custom CSS addition.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 Documentation/index.rst                | 8 ++++++++
 Documentation/sphinx-static/custom.css | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index c0cf79a87c3a..a9eba8187de6 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -21,6 +21,7 @@ community and getting your work upstream.
 
 .. toctree::
    :maxdepth: 1
+   :caption: Working with the development community
 
    Development process <process/development-process>
    Submitting patches <process/submitting-patches>
@@ -37,6 +38,7 @@ kernel.
 
 .. toctree::
    :maxdepth: 1
+   :caption: Internal API manuals
 
    Core API <core-api/index>
    Driver APIs <driver-api/index>
@@ -50,6 +52,7 @@ Various other manuals with useful information for all kernel developers.
 
 .. toctree::
    :maxdepth: 1
+   :caption: Development tools and processes
 
    Licensing rules <process/license-rules>
    Writing documentation <doc-guide/index>
@@ -71,6 +74,7 @@ developers seeking information on the kernel's user-space APIs.
 
 .. toctree::
    :maxdepth: 1
+   :caption: User-oriented documentation
 
    Administration <admin-guide/index>
    Build system <kbuild/index>
@@ -88,6 +92,7 @@ platform firmware.
 
 .. toctree::
    :maxdepth: 1
+   :caption: Firmware-related documentation
 
    Firmware <firmware-guide/index>
    Firmware and Devicetree <devicetree/index>
@@ -98,6 +103,7 @@ Architecture-specific documentation
 
 .. toctree::
    :maxdepth: 2
+   :caption: Architecture-specific documentation
 
    CPU architectures <arch/index>
 
@@ -111,6 +117,7 @@ to reStructuredText format, or are simply too old.
 
 .. toctree::
    :maxdepth: 1
+   :caption: Other documentation
 
    Unsorted documentation <staging/index>
 
@@ -120,6 +127,7 @@ Translations
 
 .. toctree::
    :maxdepth: 2
+   :caption: Translations
 
    Translations <translations/index>
 
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 5aa0a1ed9864..0576d4fcb2a3 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -75,6 +75,12 @@ div.kerneltoc li.current ul { margin-left: 0; }
 div.kerneltoc { background-color: #eeeeee; }
 div.kerneltoc li.current ul { background-color: white; }
 
+/*
+ * Hide toctree captions on the welcome page, they should only be shown in the
+ * sidebar.
+ */
+section#the-linux-kernel-documentation p.caption { display: none; }
+
 /*
  * The CSS magic to toggle the contents on small screens.
  */

-- 
2.55.0

