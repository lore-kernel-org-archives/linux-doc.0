Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C057FC43460
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:28:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A74F7601FC
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:28:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234922AbhDAS2F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:28:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239668AbhDASQp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 14:16:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B81761156;
        Thu,  1 Apr 2021 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617279476;
        bh=4m1LMXNQLKEULRzw9a/ker9aMb6QrWwHEPQ0MMmnRwk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZYlmrc4nlyup/WyuOh1UF0vhkGPngnnNqQhMdqEks+S3AbthKuIQ3dNw0b8QCDn/n
         8fWeFf73zEL9ePe1aQFuF98OcBqyBNITeAn1Hq6apx2pS9MfEVBFQQdL6bY/eVIZ/K
         hm38mRws9r/DT9XQI4ov+jSBuEQxU9LIYPJj9+s09q/y92amO2x00AMXcElqygCEXj
         pAJLhE6Qz6x3m84ngCHbrgquSEvgBVQpinLqSBGR/n9lF0kHY1L2J1LKO/qXwbyF8C
         f4PXEPptWCmi9IPKh19ZB4tXCEOIGE+YqjqOqqL3LQ+JPU02+q11jha9NvoWto7fNJ
         fHtWj9scguwbA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lRwGo-001c33-4G; Thu, 01 Apr 2021 14:17:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 17/32] MAINTAINERS: update renesas,rcar-gyroadc.yaml reference
Date:   Thu,  1 Apr 2021 14:17:37 +0200
Message-Id: <aa999b76bb0b6c3ca4cb0c1a8679c22c91690429.1617279355.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 8c41245872e2 ("dt-bindings:iio:adc:renesas,rcar-gyroadc: txt to yaml conversion.")
renamed: Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
to: Documentation/devicetree/bindings/iio/adc/renesas,rcar-gyroadc.yaml.

Update its cross-reference accordingly.

Fixes: 8c41245872e2 ("dt-bindings:iio:adc:renesas,rcar-gyroadc: txt to yaml conversion.")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 636b29fd2d4b..97763e68b8e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15437,7 +15437,7 @@ RENESAS R-CAR GYROADC DRIVER
 M:	Marek Vasut <marek.vasut@gmail.com>
 L:	linux-iio@vger.kernel.org
 S:	Supported
-F:	Documentation/devicetree/bindings/iio/adc/renesas,gyroadc.txt
+F:	Documentation/devicetree/bindings/iio/adc/renesas,rcar-gyroadc.yaml
 F:	drivers/iio/adc/rcar-gyroadc.c
 
 RENESAS R-CAR I2C DRIVERS
-- 
2.30.2

