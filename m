Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1FD947D085
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Jun 2018 16:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966154AbeFOQgj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Jun 2018 12:36:39 -0400
Received: from osg.samsung.com ([64.30.133.232]:64864 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966093AbeFOQbH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 15 Jun 2018 12:31:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id CF2A222BCB;
        Fri, 15 Jun 2018 09:31:06 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qNlS3YEilTlJ; Fri, 15 Jun 2018 09:31:06 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.114.220.dynamic.adsl.gvt.net.br [177.41.114.220])
        by osg.samsung.com (Postfix) with ESMTPSA id A47EC22B4E;
        Fri, 15 Jun 2018 09:30:58 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.91)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fTrcm-00084H-FF; Fri, 15 Jun 2018 13:30:56 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v4 17/26] bindings: nvmem/zii: Fix location of nvmem.txt
Date:   Fri, 15 Jun 2018 13:30:45 -0300
Message-Id: <29bf5ab9b101ebbaed580edc89d1501f0f8dd4bd.1529079120.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1529079119.git.mchehab+samsung@kernel.org>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1529079119.git.mchehab+samsung@kernel.org>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The location pointed there is missing "bindings/" on its path.

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
index d5e22fc67d66..0df79d9e07ec 100644
--- a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
+++ b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
@@ -18,7 +18,7 @@ Optional properties:
 Data cells:
 
 Data cells are child nodes of eerpom node, bindings for which are
-documented in Documentation/bindings/nvmem/nvmem.txt
+documented in Documentation/devicetree/bindings/nvmem/nvmem.txt
 
 Example:
 
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
