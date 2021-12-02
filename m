Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6209EC433EF
	for <linux-doc@archiver.kernel.org>; Thu,  2 Dec 2021 21:58:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349121AbhLBWBY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Dec 2021 17:01:24 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38722 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242771AbhLBWBY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Dec 2021 17:01:24 -0500
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A249A459CC;
        Thu,  2 Dec 2021 21:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1638482281; bh=ZVPpzB6rSNcngrIBnZii0uhQIavPsuCgmP8/mOzVavE=;
        h=From:To:Cc:Subject:Date:From;
        b=L7YnaS0vQx3fTlAeYVedMHwNa1hkBi4fleITEWzhP2SG+y2Yx439NI8KpvTxGdgjk
         y8/9UIirG9DLGDdioVh8a7CcKCaGoCM1R7aukYyYzi04cUNFae4mP/rbDwoeFOZPyh
         FBL70ll4iHRikjdWjF8nqa5iXcQNPPW27ZLZ1SeiEC+AhFVgkrMP0hdonlGqlrH5sw
         oUR7rEfyrNDFHbvaR4265VgRbG6bDVNq6rJ+/nGCHSQr84Jy0AYzWgquo8O9s+lqcX
         pb84HmH+0anL5KeOGzehq8phcNrhwh/YfKK4VJhhb3iiVulk6TnKIvAUN7cOT19843
         8BmPLnwZg1kYQ==
Received: from abrodkin-5550.internal.synopsys.com (unknown [10.225.48.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id EC080A005C;
        Thu,  2 Dec 2021 21:57:56 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From:   Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-snps-arc@lists.infradead.org,
        Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH] docs: ARC: Improve readability
Date:   Fri,  3 Dec 2021 00:57:47 +0300
Message-Id: <20211202215747.19923-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There were some things which made rendered document
look not very elegant. That was because:

1. Numbered lists were formatted in more of Markdown way
   rather than true reStructuredText and so were displayed
   as a plain text with leading numbers.

   Well, moreover numbered lists were not needed as in all cases
   we were just listing a couple of options w/o any intention to
   follow any particular order, so a simpler unordered list fits
   better and looks cleaner.

2. URL's of external resources were added as they are
   (which is OK in a plain text, but make not much sense in
   a HTML where we may use more human-friendly link names
   with URL's hidden.

3. Some URL's had trailing slashes which were not really needed

Fix all items from above!

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Vineet Gupta <vgupta@kernel.org>
---
 Documentation/arc/arc.rst | 62 +++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 29 deletions(-)

diff --git a/Documentation/arc/arc.rst b/Documentation/arc/arc.rst
index 249d03c6be8e..6c4d978f3f4e 100644
--- a/Documentation/arc/arc.rst
+++ b/Documentation/arc/arc.rst
@@ -9,24 +9,27 @@ Other sources of information
 Below are some resources where more information can be found on
 ARC processors and relevant open source projects.
 
-1. `<https://embarc.org/>`_ - Community portal for open source on ARC.
-Good place to start to find relevant FOSS projects, toolchain releases,
-news items and more.
-
-2. `<https://github.com/foss-for-synopsys-dwc-arc-processors>`_ -
-Home for all development activities regarding open source projects for
-ARC processors. Some of the projects are forks of various upstream projects,
-where "work in progress" is hosted prior to submission to upstream projects.
-Other projects are developed by Synopsys and made available to community
-as open source for use on ARC Processors.
-
-3. `<https://www.synopsys.com/designware-ip/processor-solutions.html>`_ -
-Official Synopsys ARC Processors website location, with access to some IP
-documentation (Programmer's Reference Manuals, AKA "PRM's", see
-`<https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf>`_)
-and commercial tools (Free nSIM,
-`<https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi>`_ and
-MetaWare Light Edition, `<https://www.synopsys.com/cgi-bin/arcmwtk_lite/reg1.cgi>`_)
+- `<https://embarc.org>`_ - Community portal for open source on ARC.
+  Good place to start to find relevant FOSS projects, toolchain releases,
+  news items and more.
+
+- `<https://github.com/foss-for-synopsys-dwc-arc-processors>`_ -
+  Home for all development activities regarding open source projects for
+  ARC processors. Some of the projects are forks of various upstream projects,
+  where "work in progress" is hosted prior to submission to upstream projects.
+  Other projects are developed by Synopsys and made available to community
+  as open source for use on ARC Processors.
+
+- `Official Synopsys ARC Processors website
+  <https://www.synopsys.com/designware-ip/processor-solutions.html>`_ -
+  location, with access to some IP documentation (`Programmer's Reference
+  Manual, AKA PRM for ARC HS processors
+  <https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf>`_)
+  and free versions of some commercial tools (`Free nSIM
+  <https://www.synopsys.com/cgi-bin/dwarcnsim/req1.cgi>`_ and
+  `MetaWare Light Edition <https://www.synopsys.com/cgi-bin/arcmwtk_lite/reg1.cgi>`_).
+  Please note though, registration is required to access both the documentation and
+  the tools.
 
 Important note on ARC processors configurability
 ################################################
@@ -52,22 +55,23 @@ Building the Linux kernel for ARC processors
 The process of kernel building for ARC processors is the same as for any other
 architecture and could be done in 2 ways:
 
-1. cross-compilation: process of compiling for ARC targets on a development
-host with a different processor architecture (generally x86_64/amd64).
-
-2. native compilation: process of compiling for ARC on a ARC platform
-(hardware board or a simulator like QEMU) with complete development environment
-(GNU toolchain, dtc, make etc) installed on the platform.
+- Cross-compilation: process of compiling for ARC targets on a development
+  host with a different processor architecture (generally x86_64/amd64).
+- Native compilation: process of compiling for ARC on a ARC platform
+  (hardware board or a simulator like QEMU) with complete development environment
+  (GNU toolchain, dtc, make etc) installed on the platform.
 
 In both cases, up-to-date GNU toolchain for ARC for the host is needed.
 Synopsys offers prebuilt toolchain releases which can be used for this purpose,
 available from:
 
-1. Synopsys GNU toolchain releases:
-`<https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases>`_
-2. Linux kernel compilers collection:
-`<https://mirrors.edge.kernel.org/pub/tools/crosstool/>`_
-3. Bootlin's toolchain collection: `<https://toolchains.bootlin.com/>`_
+- Synopsys GNU toolchain releases:
+  `<https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases>`_
+
+- Linux kernel compilers collection:
+  `<https://mirrors.edge.kernel.org/pub/tools/crosstool>`_
+
+- Bootlin's toolchain collection: `<https://toolchains.bootlin.com>`_
 
 Once the toolchain is installed in the system, make sure its "bin" folder
 is added in your ``PATH`` environment variable. Then set ``ARCH=arc`` &
-- 
2.25.1

