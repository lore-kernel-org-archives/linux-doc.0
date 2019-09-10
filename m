Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E7A117D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Sep 2019 10:04:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405611AbfIJKEZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Sep 2019 06:04:25 -0400
Received: from foss.arm.com ([217.140.110.172]:60308 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405459AbfIJKEZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Sep 2019 06:04:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F288F28;
        Tue, 10 Sep 2019 03:04:24 -0700 (PDT)
Received: from e121566-lin.cambridge.arm.com (e121566-lin.cambridge.arm.com [10.1.196.217])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C9D8F3F71F;
        Tue, 10 Sep 2019 03:04:23 -0700 (PDT)
From:   Alexandru Elisei <alexandru.elisei@arm.com>
To:     linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     corbet@lwn.net, linux@armlinux.org.uk, ian.campbell@citrix.com,
        will@kernel.org, mchehab@kernel.org, catalin.marinas@arm.com
Subject: [PATCH] docs: arm: Fix RAM offset requirement for loading a raw image
Date:   Tue, 10 Sep 2019 11:03:53 +0100
Message-Id: <1568109833-11780-1-git-send-email-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 83d26d1113d8 ("ARM: 7824/1: update advice on kernel, initramfs and
FDT load address.") changed the offset requirement for loading a raw kernel
image into RAM from 32KiB (0x8000) to TEXT_OFFSET - PAGE_OFFSET, which
results in a negative value. Change the offset to be TEXT_OFFSET, which has
an arch dependent value between 0x8000 and 0x308000.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 Documentation/arm/booting.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arm/booting.rst b/Documentation/arm/booting.rst
index 4babb6c6ae1e..0507e7e3357e 100644
--- a/Documentation/arm/booting.rst
+++ b/Documentation/arm/booting.rst
@@ -178,8 +178,8 @@ prior to decompression, which will make the boot process slightly
 faster.
 
 When booting a raw (non-zImage) kernel the constraints are tighter.
-In this case the kernel must be loaded at an offset into system equal
-to TEXT_OFFSET - PAGE_OFFSET.
+In this case the kernel must be loaded at an offset into system RAM
+equal to TEXT_OFFSET.
 
 In any case, the following conditions must be met:
 
-- 
2.7.4

