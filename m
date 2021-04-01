Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B85C43461
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:27:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 385DB601FC
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:27:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236978AbhDAS1s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:27:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:45702 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239625AbhDASQn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 14:16:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04A9561152;
        Thu,  1 Apr 2021 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617279476;
        bh=ZbBNdR6/lKLsrThW7zQ1YGJB9s6d5kBVitky4KDqGfY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XkWKj50moZkWD+BcOpQblaBDy8D7qjhWuJK4PFmavA/ctdyo/ypOX8J0QQKyhLSF2
         CM4CB8g+CQZHCce2QIJ1uN6nQMjqIkk22yon4aMiNvSRsQ64VHdLTOOePE5/b24jWy
         bLy7rX1k4Ps+Jsrbq7qY/FQlsjWSopnGEZ92FPl1BT7NAkU76cgrc5IwDgXuwZk6uR
         y0vr5SJ0340t2VLgnFly69n4cHTAIdwdqhK9aeQvHgJdO6ok4ZgXYhrQT+ZmOYtH3s
         nLsWo+6XHXJWbP6LVhlUw0Lf9IE7WchvUvax4VPU4FN6y8IDY2SjgpyPBuK7Dg9JdC
         0UUBuGvApNlxw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lRwGo-001c2z-21; Thu, 01 Apr 2021 14:17:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 15/32] MAINTAINERS: update atmel,sama5d2-adc.yaml reference
Date:   Thu,  1 Apr 2021 14:17:35 +0200
Message-Id: <4574e4b7612f5fd683fddbcd7d7307d5e6d02988.1617279355.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 58ff1b519753 ("dt-bindings:iio:adc:atmel,sama5d2-adc: txt to yaml conversion")
renamed: Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
to: Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml.

Update its cross-reference accordingly.

Fixes: 58ff1b519753 ("dt-bindings:iio:adc:atmel,sama5d2-adc: txt to yaml conversion")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 576d1bcabb20..89ed435ca6c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11930,7 +11930,7 @@ MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER
 M:	Eugen Hristev <eugen.hristev@microchip.com>
 L:	linux-iio@vger.kernel.org
 S:	Supported
-F:	Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt
+F:	Documentation/devicetree/bindings/iio/adc/atmel,sama5d2-adc.yaml
 F:	drivers/iio/adc/at91-sama5d2_adc.c
 F:	include/dt-bindings/iio/adc/at91-sama5d2_adc.h
 
-- 
2.30.2

