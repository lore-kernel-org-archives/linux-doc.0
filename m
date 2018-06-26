Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 67F707DF8A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 09:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933995AbeFZJuv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 05:50:51 -0400
Received: from osg.samsung.com ([64.30.133.232]:58147 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933990AbeFZJtT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 26 Jun 2018 05:49:19 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 2394D30BB7;
        Tue, 26 Jun 2018 02:49:19 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LT25OUfTFRla; Tue, 26 Jun 2018 02:49:18 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.130.70.dynamic.adsl.gvt.net.br [177.41.130.70])
        by osg.samsung.com (Postfix) with ESMTPSA id 7D26830B8C;
        Tue, 26 Jun 2018 02:49:16 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.91)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fXkb4-0000m2-82; Tue, 26 Jun 2018 06:49:14 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 6/9] gpio.h: fix location of gpio legacy documentation
Date:   Tue, 26 Jun 2018 06:49:08 -0300
Message-Id: <60e0372bb4d96f7795404e28d776a4600e38efe2.1530005114.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1530005114.git.mchehab+samsung@kernel.org>
References: <cover.1530005114.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1530005114.git.mchehab+samsung@kernel.org>
References: <cover.1530005114.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The location of this doc file was moved. Change its reference
accordingly.

Fixes: 7ee2c13080c9 ("Documentation: gpio: Move legacy documentation to driver-api")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 include/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 91ed23468530..39745b8bdd65 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -14,7 +14,7 @@
 
 #include <linux/errno.h>
 
-/* see Documentation/gpio/gpio-legacy.txt */
+/* see Documentation/driver-api/gpio/legacy.rst */
 
 /* make these flag values available regardless of GPIO kconfig options */
 #define GPIOF_DIR_OUT	(0 << 0)
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
