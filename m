Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6022CC48BE5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 06:27:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 481C4613D3
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 06:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhFPG3z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 02:29:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:59678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231344AbhFPG3x (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 Jun 2021 02:29:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9F20613C7;
        Wed, 16 Jun 2021 06:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623824867;
        bh=pxoSN73zJJuQ6vHiSkCfEyamr8hKl0m3ki99xeowtwM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iPrOblHFJDouRXw3IswyMdr5upPLM87BWy8oSKi28EmvMzIZDBDl4UQbLiv1Tq3Cs
         fvN+pCTlN6aj4T6EGBPXRWb49OeCamhUm+YbzDsJzecv6z7/scwl64b/CZys7n/kd0
         NKsyj7gd+W+6nH2BgfNO947U/t0ByL6cgp7OLrUosnZ+aA7qp9n+Mkr0Av9QWgNroP
         leYdpwhZg6/A+8GWHt41axASpBEFYIInczwiCmwMnzrmGZwlNqXtStn0OVcBCIRX7C
         aisMwFWL4bHt3vWSi3jl62GsiW49A1LYTAgF2tbGMSdxdszCmDz7boipXmdQaC+nAI
         ZglixR3uw9bXQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1ltP1e-004kIg-4I; Wed, 16 Jun 2021 08:27:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/29] docs: block: biodoc.rst: avoid using ReST :doc:`foo` markup
Date:   Wed, 16 Jun 2021 08:27:21 +0200
Message-Id: <1d26256b305e02da82a6a990910a5b5fb9a0355e.1623824363.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623824363.git.mchehab+huawei@kernel.org>
References: <cover.1623824363.git.mchehab+huawei@kernel.org>
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

