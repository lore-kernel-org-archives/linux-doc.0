Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2095C63799
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:00:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D72BA61264
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhGVJTt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 05:19:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:49366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231496AbhGVJTp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Jul 2021 05:19:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A827F6128D;
        Thu, 22 Jul 2021 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626948020;
        bh=cX73aMRi815qONIgavFLz1MNrSenb17gGoBg0lJnVgY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VD9rI5uej6wGcysvaTxDT4CGTPPyM/GW/+DxyCHzqzKgrmVnz+MgoFr1F1tBKMIjU
         umgMpHnAfG2dKFgkLjCJ80j09EkUJQb7E55TA+m+gtBGA4/ZOu9CbzSxtugHkGUbZq
         umVeARKZj82VxbiWKHSAIccOtUbt5ZHAz66N4iqZDd6pNhELMZBjIwn4akIIW+rBRO
         Tgo4PyMGOTHgRMBrdGjQQ465p9FfoeKHUKZU2ojnGPBpWsW1aUcW3re4tQPsIgeAZw
         RpOHjs9d3TrQJ8mmIVqNmB8Smw1+l4EDf0Pbb16y05br+U5azIMIsIz5v9+xmeXo0q
         9fgi67OULsuWw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1m6VV0-008mHu-24; Thu, 22 Jul 2021 12:00:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 10/15] MAINTAINERS: update ti,am654-hbmc.yaml reference
Date:   Thu, 22 Jul 2021 12:00:07 +0200
Message-Id: <9636f47edefb0ab7aa062f83d951867c58a440fb.1626947923.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626947923.git.mchehab+huawei@kernel.org>
References: <cover.1626947923.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 6947ad674944 ("dt-bindings: mtd: Convert ti, am654-hbmc.txt to YAML schema")
renamed: Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
to: Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml.

Update its cross-reference accordingly.

Fixes: 6947ad674944 ("dt-bindings: mtd: Convert ti, am654-hbmc.txt to YAML schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf8843b778a2..9853e5154bd9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8634,7 +8634,7 @@ Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
 C:	irc://irc.oftc.net/mtd
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/next
 F:	Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
-F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
+F:	Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml
 F:	drivers/mtd/hyperbus/
 F:	include/linux/mtd/hyperbus.h
 
-- 
2.31.1

