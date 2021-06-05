Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1EAC49EB9
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 13:18:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 738E961420
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 13:18:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbhFENU0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Jun 2021 09:20:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:34970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229998AbhFENUZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 5 Jun 2021 09:20:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86ED56140B;
        Sat,  5 Jun 2021 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622899117;
        bh=pxoSN73zJJuQ6vHiSkCfEyamr8hKl0m3ki99xeowtwM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d0nNnR3argi0EGqAAVeydBHy0o5VOz7vOtj7IQIBBcZjk1EXt0suDfEWACrLeBxwt
         HzsfFEDrFLaQfOetTlvAxPzZJevq7j0ifot1up5FJjhc5urBrTBMXWdwLvkitQ/gxs
         CFOLbDHCnbYqvlTc2A8SuSUqoo4rsJqDR3A0KgaEGHXgl3yhDY/JoEMrSdT0nC9ilX
         lQ0/mq2l1JDP70L05boqOoVMTUACWtUpZlVSv4v3QCqpVOu0LA6Z5Esm1tE/8E8MfK
         /Qp46NmglEeQxW4YMNfGU3JN1qfXWCDsNS05mp+x+octCjdMg68zVzuVBIcmEc8AHr
         1Bd07wddnBc8w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lpWCB-008GF7-Lw; Sat, 05 Jun 2021 15:18:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     "Jonathan Corbet" <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org
Subject: [PATCH 10/34] docs: block: biodoc.rst: avoid using ReSt :doc:`foo` markup
Date:   Sat,  5 Jun 2021 15:18:09 +0200
Message-Id: <7370bcabcefd9c119770c376571c8f4934668bb4.1622898327.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1622898327.git.mchehab+huawei@kernel.org>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The :doc:`foo` tag is auto-generated via automarkup.py.
So, use the filename at the sources, instead of :doc:`foo`.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/block/biodoc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/block/biodoc.rst b/Documentation/block/biodoc.rst
index 1d4d71e391af..2098477851a4 100644
--- a/Documentation/block/biodoc.rst
+++ b/Documentation/block/biodoc.rst
@@ -196,7 +196,7 @@ a virtual address mapping (unlike the earlier scheme of virtual address
 do not have a corresponding kernel virtual address space mapping) and
 low-memory pages.
 
-Note: Please refer to :doc:`/core-api/dma-api-howto` for a discussion
+Note: Please refer to Documentation/core-api/dma-api-howto.rst for a discussion
 on PCI high mem DMA aspects and mapping of scatter gather lists, and support
 for 64 bit PCI.
 
-- 
2.31.1

