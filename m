Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FEAC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81AD661108
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236521AbhIPJQP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:16:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:41016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235550AbhIPJPm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:15:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E9B36126A;
        Thu, 16 Sep 2021 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631783661;
        bh=dXwiGoKK6vzfJMRsq0P46MQOUtatDJXepW0eBvEj4pU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AuyzA4sBG3cvlYqKwzYRPIiQbIJVPHDMH0JInXzM5VZxNLOAQEBdCto3mn0ii5ECh
         B+SU7ql9+6jA4jttTgdxPxr1mZ9nyb9/SZ7TNZMqhy8xuWOMnU6SyIRc9Cn7KXXzA3
         lN2KzpNFjtvTAQdC5+xoTG1PchrM1tik9f7JiqShfjg+4z5qkMkMChWqHoSDVxM7vd
         Srfe59CfWiSBqt40e8xTFJ44hLBaOiFAjW3KDKDBRfuJWfmKeMXK+n76r/hJBwbQLo
         DISa2ym9c99d4E7y8+B6nGerDomSG5wx29P20O3jdzLcjLFS7chwL8DLvTabhDPU5C
         GvcSm4LYTS1OQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnTH-001sLa-RU; Thu, 16 Sep 2021 11:14:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 15/24] MAINTAINERS: update fsl,fec.yaml reference
Date:   Thu, 16 Sep 2021 11:14:08 +0200
Message-Id: <d6a6a7e5a12478dff3c3176565de3a4a41ac4446.1631783482.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631783482.git.mchehab+huawei@kernel.org>
References: <cover.1631783482.git.mchehab+huawei@kernel.org>
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
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dce6cafeedab..0ba88743af92 100644
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

