Return-Path: <SRS0=ZV4e=6P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712D5C47253
	for <linux-doc@archiver.kernel.org>; Fri,  1 May 2020 15:38:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA39B24957
	for <linux-doc@archiver.kernel.org>; Fri,  1 May 2020 15:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588347485;
	bh=D+5zg6wcy9IbyWytXdOtfMKjQXROS1kd20OBUZcVkJ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=WBNX1uIJmtMzp78mnTFoSSxn8+jDouwA0mpgSDAonpdM44k7xPBvVCbupVnfEfKSn
	 +7D8WdA/wODsisGOIm0Ou0ththM2+t/SRsmLgx93fmHjTn+TqEmjfK4gj1vTUUTJaa
	 AXS/DMwZbA8soVwd+rC2zV5+B1X5X4PWS0qDDGLE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729118AbgEAPiF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 May 2020 11:38:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:52146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729011AbgEAPiD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 May 2020 11:38:03 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A73AD24958;
        Fri,  1 May 2020 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588347482;
        bh=D+5zg6wcy9IbyWytXdOtfMKjQXROS1kd20OBUZcVkJ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tSSk2/PByk5qV7u4IiRjxJ8CYS0efJiXDGJ5qYBh15QUub4XdHyHobvTflENla3p2
         Pmcz+7WAujdlR03PRgcI8EbTADvuHD6ESbQQCEwW6yugioxLn29Tqe0gaWTewjrY8O
         zpjC+pby2Nbx23iYe0/RNXhIzmvN11GspFc/qM00=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jUXjk-00FE4Q-Us; Fri, 01 May 2020 17:38:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Daniel Jordan <daniel.m.jordan@oracle.com>
Subject: [PATCH 01/14] docs: move DMA kAPI to Documentation/core-api
Date:   Fri,  1 May 2020 17:37:45 +0200
Message-Id: <a1517185418cb9d987f566ef85a5dd5c7c99f34e.1588345503.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588345503.git.mchehab+huawei@kernel.org>
References: <cover.1588345503.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move those files to the core-api, where they belong, renaming
them to ReST and adding to the core API index file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{DMA-API-HOWTO.txt => core-api/dma-api-howto.rst}         | 0
 Documentation/{DMA-API.txt => core-api/dma-api.rst}           | 0
 .../{DMA-attributes.txt => core-api/dma-attributes.rst}       | 0
 Documentation/{DMA-ISA-LPC.txt => core-api/dma-isa-lpc.rst}   | 0
 Documentation/core-api/index.rst                              | 4 ++++
 5 files changed, 4 insertions(+)
 rename Documentation/{DMA-API-HOWTO.txt => core-api/dma-api-howto.rst} (100%)
 rename Documentation/{DMA-API.txt => core-api/dma-api.rst} (100%)
 rename Documentation/{DMA-attributes.txt => core-api/dma-attributes.rst} (100%)
 rename Documentation/{DMA-ISA-LPC.txt => core-api/dma-isa-lpc.rst} (100%)

diff --git a/Documentation/DMA-API-HOWTO.txt b/Documentation/core-api/dma-api-howto.rst
similarity index 100%
rename from Documentation/DMA-API-HOWTO.txt
rename to Documentation/core-api/dma-api-howto.rst
diff --git a/Documentation/DMA-API.txt b/Documentation/core-api/dma-api.rst
similarity index 100%
rename from Documentation/DMA-API.txt
rename to Documentation/core-api/dma-api.rst
diff --git a/Documentation/DMA-attributes.txt b/Documentation/core-api/dma-attributes.rst
similarity index 100%
rename from Documentation/DMA-attributes.txt
rename to Documentation/core-api/dma-attributes.rst
diff --git a/Documentation/DMA-ISA-LPC.txt b/Documentation/core-api/dma-isa-lpc.rst
similarity index 100%
rename from Documentation/DMA-ISA-LPC.txt
rename to Documentation/core-api/dma-isa-lpc.rst
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index b29c4a07beda..c00aef843341 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -80,6 +80,10 @@ more memory-management documentation in :doc:`/vm/index`.
    :maxdepth: 1
 
    memory-allocation
+   dma-api
+   dma-api-howto
+   dma-attributes
+   dma-isa-lpc
    mm-api
    genalloc
    pin_user_pages
-- 
2.25.4

