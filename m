Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79184C63798
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:00:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F51361249
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbhGVJT4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 05:19:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231510AbhGVJTp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Jul 2021 05:19:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A516861289;
        Thu, 22 Jul 2021 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626948020;
        bh=l8VGU1hjXyPGo7zdUSMauBTwvhIkDdGr7T6s8JiQjDM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L7Nq0IjUaK5n4tYT/cIofIbMEVgqeRZw5GUoaNFiLTSGtCjo2GeGo23CpBEujuSNi
         8KKOFkziy39nnCMaxApaFagMpfvMX3z0XWlaB6KVx5UFVJ1Ab7VPhUvjZD0Hx9MG9x
         uyi86Z4z5zrEg6N6PJ/4VagSY/8cMpgU1O4TWOBQI6IUhYDTTb2Fu3+hS+JKygECLz
         5A6kmTEPMoDpnzTQzRGTf/STSfgufWGT94nOT/rveQ6zMYQqIf0Uyt6n2vTLAlBVNn
         bx1fotKatl/2F2O+dFeJ9rbMlKS+Rao98jHygrHKloE55QfUg/2aHwgg0AWH0xZ6s0
         XRfp8e8KpEPng==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1m6VV0-008mI9-Ca; Thu, 22 Jul 2021 12:00:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 15/15] MAINTAINERS: update nxp,imx8-jpeg.yaml reference
Date:   Thu, 22 Jul 2021 12:00:12 +0200
Message-Id: <25e33e45949ca758c1ab7237989b4f50d67225bb.1626947923.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626947923.git.mchehab+huawei@kernel.org>
References: <cover.1626947923.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The file name: Documentation/devicetree/bindings/media/imx8-jpeg.yaml
should be, instead: Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml.

Update its cross-reference accordingly.

Fixes: be157db0a3d8 ("media: Add maintainer for IMX jpeg v4l2 driver")
Fixes: b16ed1e66008 ("media: dt-bindings: Add bindings for i.MX8QXP/QM JPEG driver")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index efcd2d461fc0..6538389c7f5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13429,7 +13429,7 @@ M:	Mirela Rabulea <mirela.rabulea@nxp.com>
 R:	NXP Linux Team <linux-imx@nxp.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/imx8-jpeg.yaml
+F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/imx-jpeg
 
 NZXT-KRAKEN2 HARDWARE MONITORING DRIVER
-- 
2.31.1

