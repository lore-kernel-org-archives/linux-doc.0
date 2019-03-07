Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B61877D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Mar 2019 21:12:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfCGVMr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Mar 2019 16:12:47 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:52445 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726477AbfCGVMr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Mar 2019 16:12:47 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E90C43731;
        Thu,  7 Mar 2019 16:12:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 07 Mar 2019 16:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=oq0v+nLo1K2gap8mtyDiO6SBWF7lLVMd6iiaBpjzuy0=; b=0KntyWgw
        2ZFtK52pPxDGbVzwIyH9u81M8Md55i8f1U28oLSFAyRjK7xYwvvOWBDa2C19Y+jr
        0oB3jWrfYmz6rHwuo/CWQPzhhH+ERDNR8NPJEDV7mVKZcPiSJvB578r4SNday80Y
        BxU0abm2EMqYRlTsEECIAYpcRb5hBOVpcnsn2CUmPyl9XzJURlZRTzCxDb3+4FpJ
        izgevQWfLjvTbH+kR2sUZDERnd79x6oxg1EKGGcDb0aj8Bwn74/6J3PeeFPNH8DF
        Yk0zZn2OtyOnqawTMPkHAEUkLYNoIM1HKkKaEcL6TsdDpZs0Bt0KXjsuuNuEusX+
        p5Uh6Ya3/ByOuw==
X-ME-Sender: <xms:TYmBXJyxnPAQ0s6WDHcV-tA8NO9KNOpk9mKGDOnPar0bPst0Gv6QWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfeekgdduhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpedfvfhosghi
    nhcuvedrucfjrghrughinhhgfdcuoehtohgsihhnsehkvghrnhgvlhdrohhrgheqnecukf
    hppeduvdegrdduieelrdehrdduheeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehtohgs
    ihhnsehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpeei
X-ME-Proxy: <xmx:TYmBXDgAC9otDulKbS_mpy0OYoMtg35cFt1Pr0XDdPW-0dumqppqPA>
    <xmx:TYmBXCQUxnnSIrbRlFvM8x2vpuQjrUiMACFmvTCfWgKbTkysIYEbZw>
    <xmx:TYmBXDIK3rZJ5XJdw_ZuXXVYFZk9PrdCyN_5mhdQ8jKI06PQR3ad_Q>
    <xmx:TYmBXEyy0CJ0DAIHKwH-lMBkxMivgm5g_Km7Yf0W-PXg4W6wPuGClQ>
Received: from eros.localdomain (124-169-5-158.dyn.iinet.net.au [124.169.5.158])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8351C1033A;
        Thu,  7 Mar 2019 16:12:43 -0500 (EST)
From:   "Tobin C. Harding" <tobin@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "Tobin C. Harding" <tobin@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] docs: Add blank line after SPDX licence identifier
Date:   Fri,  8 Mar 2019 08:11:53 +1100
Message-Id: <20190307211153.28400-10-tobin@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190307211153.28400-1-tobin@kernel.org>
References: <20190307211153.28400-1-tobin@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx emits warning

	WARNING: Explicit markup ends without a blank line; unexpected
	unindent.

This is caused by a missing line after the SPDX license identifier.

Add blank line after SPDX licence identifier.

Signed-off-by: Tobin C. Harding <tobin@kernel.org>
---
 Documentation/laptops/lg-laptop.rst   | 1 +
 Documentation/misc-devices/ibmvmc.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/laptops/lg-laptop.rst b/Documentation/laptops/lg-laptop.rst
index d9e560dfd045..f2012d2dcb9d 100644
--- a/Documentation/laptops/lg-laptop.rst
+++ b/Documentation/laptops/lg-laptop.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0+
+
 LG Gram laptop extra features
 =============================
 
diff --git a/Documentation/misc-devices/ibmvmc.rst b/Documentation/misc-devices/ibmvmc.rst
index 46ded79554d4..b46df4ea2b81 100644
--- a/Documentation/misc-devices/ibmvmc.rst
+++ b/Documentation/misc-devices/ibmvmc.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0+
+
 ======================================================
 IBM Virtual Management Channel Kernel Driver (IBMVMC)
 ======================================================
-- 
2.21.0

