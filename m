Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A07C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 08:05:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B154239EB
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 08:05:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbhANIFm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jan 2021 03:05:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:58584 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727211AbhANIFk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 14 Jan 2021 03:05:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E43C8238EA;
        Thu, 14 Jan 2021 08:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610611500;
        bh=8YHXF8LwX1TmwYygkprhErueMSfBozRvFPLxH1qoi5Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gs7qjjJkeGF8uLleroYhYg/5dscGsLzSDT+69GsZnwAw97R1eOkQVGfBdxGVRQWn2
         Q7cA5ooVAToCvCcxltHd4d/TWCPb314W6SUMC244PxG3+FV1xHnVluWyzp+QupEqCq
         a/hNpvoG+bGlFRN0gpT2uPXrvW7xjjhCUGZ3nQAdYA4JhklUK200KvWVWm5gMvd5ho
         4zAFxLsp9GCtibcaybB8AmdzIL+mAO4vcEZonhPLfgBRXQdEAysfMGZ1YkpI2nOzpp
         xJHiqIML5h4SqYkAnPTi7cjNbim+6JrVK4GqzrJBL27ItFTkR181GRmxrCmOs/P2jM
         KavhgTUyoFdtQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kzxcn-00EQ6R-Nm; Thu, 14 Jan 2021 09:04:57 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexandre Bounine <alex.bou9@gmail.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/16] rapidio: fix kernel-doc a markup
Date:   Thu, 14 Jan 2021 09:04:38 +0100
Message-Id: <e23e64983788a51dd9099e2b0d881e1f64ecbc5b.1610610937.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610610937.git.mchehab+huawei@kernel.org>
References: <cover.1610610937.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Probaly this was due to a cut and paste issue.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/rapidio/rio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index c2b79736a92b..e74cf09eeff0 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -749,7 +749,7 @@ int rio_map_outb_region(struct rio_mport *mport, u16 destid, u64 rbase,
 EXPORT_SYMBOL_GPL(rio_map_outb_region);
 
 /**
- * rio_unmap_inb_region -- Unmap the inbound memory region
+ * rio_unmap_outb_region -- Unmap the inbound memory region
  * @mport: Master port
  * @destid: destination id mapping points to
  * @rstart: RIO base address window translates to
-- 
2.29.2

