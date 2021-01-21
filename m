Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49357C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 19:36:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 134DC23A40
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 19:36:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbhAUTg1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 14:36:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:44690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727340AbhAUTfW (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 21 Jan 2021 14:35:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB38123A33;
        Thu, 21 Jan 2021 19:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611257674;
        bh=oh/fypEkAavTkr/02VH5olySWshxzl2fjfyqZGPVPrM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nLBw1wzwjAwbug6kH3AN8SggxUD5qkZE2H0AlQp6pWZeq5wfqxz93qSDbFM8YDUKR
         6OM3mfi/2bXxJp4Juin/H5Lv6Bx79pYCT0DumUAeT003YU2mo1aGWDFiYbQrV/t5BT
         c7RR9pH2yVD3fNM65YDGBDz3fzwqrTm8YSYrNBomJNUCLCrn7qhQVhCxeH1kYjdkwQ
         ndCMZiqFHgFocWpwPkl+Q1mv44gnYMBr5ULVSL8bEBOrKK3yq51i3cc0AdAEWdsu13
         khl2fIcXVGSXPM4Kgot6IaJDhWcZFkEufId7d6iT2JE3JN42Btf1raqQaGS6X0JexP
         v3BXG8j+kDIfQ==
Received: by pali.im (Postfix)
        id A32A1774; Thu, 21 Jan 2021 20:34:32 +0100 (CET)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Documentation: arm: marvell: Add link to public Armada 37xx Hardware Spec
Date:   Thu, 21 Jan 2021 20:34:18 +0100
Message-Id: <20210121193418.22678-2-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121193418.22678-1-pali@kernel.org>
References: <20210121193418.22678-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 Documentation/arm/marvell.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/arm/marvell.rst b/Documentation/arm/marvell.rst
index 16ab2eb085b8..b16e6f7e8dbe 100644
--- a/Documentation/arm/marvell.rst
+++ b/Documentation/arm/marvell.rst
@@ -185,6 +185,9 @@ EBU Armada family ARMv8
   Product Brief:
 	http://www.marvell.com/embedded-processors/assets/PB-88F3700-FNL.pdf
 
+  Hardware Spec:
+	http://www.marvell.com/content/dam/marvell/en/public-collateral/embedded-processors/marvell-embedded-processors-armada-37xx-hardware-specifications-2019-09.pdf
+
   Device tree files:
 	arch/arm64/boot/dts/marvell/armada-37*
 
-- 
2.20.1

