Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D323126C0;
	Mon,  3 Aug 2026 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767773; cv=none; b=QhV9jHbBgQJRdbE9rLZkO1vh2RINMWIXclLI38SQJ4qlbSkEV41XAHDiClHn4EpBWduOgpIvo510DY6NnoxKTy43tLvQ47qtv/MFyrjOSliPZsvkOdTzmrsYET32rITfD7XlG8PBBDIahw0hDVl3TQPlmQpY0uQl16g6+3p2b+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767773; c=relaxed/simple;
	bh=kknA4YQe5BWnRbjMCYbMJBl3CYn62bwWLo/IYUoxOCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBgIgYPYMYWgRH0P+K3dkJfPMGLG4RStR7MhnVZFPYI6nwPyeiw1RDYS28/6ZMLExKj4M/ApQvBjA5C1oeh7O01wqQ5YSZ384f4vcTwONVOtrvwHnVRey5gv5AM157zuA+4uU8zJ3aQIbdSKMnxLoZ5l6BA3leHFKedwh1uN1/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tpYNYnov; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tpYNYnov"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D48671A13D3;
	Mon,  3 Aug 2026 14:36:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A94BF6029B;
	Mon,  3 Aug 2026 14:36:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCC6E11C30E68;
	Mon,  3 Aug 2026 16:36:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785767769; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oV5+IVdMGEuhE189tEa+3I+/nt0jZxPBiY2i9t/JrI8=;
	b=tpYNYnovU5LzLDKOkBFQvyDw5X3mfFGgO39nH3u4vBBnWCNgbPochNW/XA7yufZzOSs6e5
	TaZ3DLEQW+NJ9wujdBU54mp5XmrpEURNNj1twfevet1N1APCWu+w5j1oup8RJKYLzcZmZD
	9KOU95WVRQD3csqpz4WuyJTpvIvMXmM7K4WM6QDciy6Yi9eVO9Q4mN0dpim+0yQaM9iFtE
	6Rxu2jWg2EuhmZwMhwEIT0X3eGqDcq2zvmQ0M0ylkZBXP3DWGbMakyJycjTHJdvKDXStbW
	EwRaNfsM3fUiwS2C/K/gxjKJKyB/CX77DU07Vb1la5aeBzUpa+yHFJPk0utiLg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 03 Aug 2026 16:35:50 +0200
Subject: [PATCH 1/2] Documentation: html: show sections in the sidebar
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260803-show-sections-in-sidebar-v1-1-b4fdc847525d@bootlin.com>
References: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com>
In-Reply-To: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3241;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=kknA4YQe5BWnRbjMCYbMJBl3CYn62bwWLo/IYUoxOCQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqcKdWebCG9Gz3fOCMG56f4x4aFgzFw1nW+OurW
 aOp7n3I+sCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanCnVgAKCRDRgEFAKaOo
 NkmZEADLpLaRcHDkvJsamarV1ZwHIOx4wZZ3HjSrPPqT1t/Ajl2Iyk+xLZeUFbCd3jmcAQ2BvDm
 m2/TUVTkioLVQA+Z49Gq/32gHkhiR+h8GXn2bFyE2PRsMFrBrG755NSQY5TS5zOHgHBhZaP/kd1
 YZ7GoUCw+HHc8IH5kKnKxwoEM8A80RlEsKb5ttLylaL7YlqHCgP7AI6tkFJn1cxqExwoXt0rD3o
 8uUh68TRsYRzJ4wMEh5i/hUcn5xddsYmHTh02Zmk3sla7+UDncq+y5yS/otbsctmRyFxef1QYii
 DN1Fudo7vEvfwcF4jyPtoFxv7Fy5R4DO3gUHf3z/kGvC0NoFj+u0g9bpnFc6R19+3V3mrSTBI8m
 fVXNC89V70Oq1Adn4lV9YX7oWBvh1t+egqugDLv2/15kLZME67imRdwSYTF88nuHJyCq2qVnG9O
 gZD/C1P1l2hdHi/eI0ayZhz005NQbmu58rH+y4kWcrut/j2L0Ypi63CgkfWkX2eMJBH+7pKvW7z
 0Kkwc417OGhF26wDIQw56NeGyMxdR6T4KrAbLG2D9GeP0s7q6Ca8JFdvZUtNpQ8chMCVABEllic
 5O4C8jIMfE4ATCZiHuGGeDCT3wbKD7PFwezPNBzZNgm0Zpo4MMR5sjGK5pvKW4Ykd36mNdfhDG9
 QVDlUk1I9yOFsIQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

The current sidebar in the HTML version of the documentation does not
display the section titles because the toctree directives in the
top-level index.rst document do not contain ":caption:" properties.
Replacing the current section titles by ":caption:" properties would not
allow having text between those and the table of contents.

To workaround this issue, add the ":caption:" properties in the toctree
calls which makes them show up in the sidenbar, but hide them from the
index page with a custom CSS addition.

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

