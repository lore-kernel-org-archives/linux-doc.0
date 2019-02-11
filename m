Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0462C7D099
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Feb 2019 13:43:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbfBKNn1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Feb 2019 08:43:27 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:42648 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbfBKNn1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Feb 2019 08:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7mIeXN+0tiI07JhwEfSGFWIvqsFOrT6KPcLvNs3Ys54=; b=o/3nb4O6CAnFpgqLCpHgNyRlv
        1p+SjsRqcBPgG//drQjLQ3nejCGzunZmjxpA/ctAKWownVEtQ6LBc3l42uEutebTrP8RCRKMSG5GM
        wEVcy/HNQeURBbkHzU59v0fiTq1q6JXaabEW2NPLJQX+vBULNz5a8Tc1KlaInHOCEQqyrH/HvQ3z8
        kT91adSzU32y0TekB0QcwBpp5cGiSj1yzwGDqEf+qakTm3/KAtnnTGI4QlXZc7UpNDvE+dml9Ex32
        aHu8k1/fCpkwCSacNLkceMmouiL1nH/Kr0JDdd6ZbrTX40lQbLsB4S1C2w/OlhqeT1R+2S7cwKx8r
        m8Eb6e/yg==;
Received: from 089144210182.atnat0019.highway.a1.net ([89.144.210.182] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gtBrq-0005ik-Hg; Mon, 11 Feb 2019 13:43:26 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/DMA-ISA-LPC: fix an incorrect reference
Date:   Mon, 11 Feb 2019 14:43:23 +0100
Message-Id: <20190211134323.30856-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

AFAIK we never had a isa_virt_to_phys, it always was
isa_virt_to_bus.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/DMA-ISA-LPC.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/DMA-ISA-LPC.txt b/Documentation/DMA-ISA-LPC.txt
index 8c2b8be6e45b..b1ec7b16c21f 100644
--- a/Documentation/DMA-ISA-LPC.txt
+++ b/Documentation/DMA-ISA-LPC.txt
@@ -52,8 +52,8 @@ Address translation
 -------------------
 
 To translate the virtual address to a bus address, use the normal DMA
-API. Do _not_ use isa_virt_to_phys() even though it does the same
-thing. The reason for this is that the function isa_virt_to_phys()
+API. Do _not_ use isa_virt_to_bus() even though it does the same
+thing. The reason for this is that the function isa_virt_to_bus()
 will require a Kconfig dependency to ISA, not just ISA_DMA_API which
 is really all you need. Remember that even though the DMA controller
 has its origins in ISA it is used elsewhere.
-- 
2.20.1

