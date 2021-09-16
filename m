Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1F1C43217
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:55:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 994EC61216
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbhIPJ5C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:57:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236194AbhIPJ4s (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:56:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BB4261260;
        Thu, 16 Sep 2021 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631786126;
        bh=O6tO7kn7hqKkbA5z6e/F1LpaXU8rkhUkSsbrwIN8b1w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Tfw79Zci58Tcm6tPGbJvdJCIXSxxIThpagYOl3bpCkh/nR4DMGe0JXgQbNLup0k7A
         NtV8ofIjh1DNPhd4/zz1aKguthTHkWv6dWS8VJXy4cLyVnaoNrgB58nfSD5AunO8qk
         TLOMSnAFAjNTPnumU5AQf0Z4ACoivKIYp21S8HUBu5zmgsiFJeNu0N+6gHtXHzigwR
         KTdfKyMwhKiqR9OeinLicm6NNJ2Er1MDNzqFYLQF1SGLxJkm7zPzyl85QurFFAnB5m
         ekuLinwZagzy/IVGN0KU2TZ6odnAtMtpTcUyx5Pfs0cFJJqpXEZfREdIKz6wjHjzJX
         EUcc/eUN2ZmRw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQo72-001vUE-LU; Thu, 16 Sep 2021 11:55:24 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/23] MAINTAINERS: update fsl,fec.yaml reference
Date:   Thu, 16 Sep 2021 11:55:13 +0200
Message-Id: <3c74188dbff1f8599d79582649f882b9a829818c.1631785820.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631785820.git.mchehab+huawei@kernel.org>
References: <cover.1631785820.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 96e4781b3d93 ("dt-bindings: net: fec: convert fsl,*fec bindings to yaml")
renamed: Documentation/devicetree/bindings/net/fsl-fec.txt
to: Documentation/devicetree/bindings/net/fsl,fec.yaml.

Update its cross-reference accordingly.

Fixes: 96e4781b3d93 ("dt-bindings: net: fec: convert fsl,*fec bindings to yaml")
Reviewed-by: Joakim Zhang <qiangqing.zhang@nxp.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index edf8d4253142..9cf038e2c783 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7451,7 +7451,7 @@ FREESCALE IMX / MXC FEC DRIVER
 M:	Joakim Zhang <qiangqing.zhang@nxp.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/net/fsl-fec.txt
+F:	Documentation/devicetree/bindings/net/fsl,fec.yaml
 F:	drivers/net/ethernet/freescale/fec.h
 F:	drivers/net/ethernet/freescale/fec_main.c
 F:	drivers/net/ethernet/freescale/fec_ptp.c
-- 
2.31.1

