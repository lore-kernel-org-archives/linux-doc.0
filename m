Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428E1C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29A13611C8
	for <linux-doc@archiver.kernel.org>; Thu, 16 Sep 2021 09:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236067AbhIPJPu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:15:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:40968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235506AbhIPJPm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 16 Sep 2021 05:15:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 770166124E;
        Thu, 16 Sep 2021 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631783661;
        bh=8Ro2FsxamdMeFBrSZph9MHcLk9XnSAx4/v/4v1j7aVU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HWhxEi3pVwbLxSQN+wkXwKp487637BgirewEJ3Rc/CLm3oxt3gXDnpBdnd5C/te3k
         d6BHLjsN2hShrGCD8Hn8L7dB4sSJx7E0P/UoaHW1ubP3yhW0JuD1992zXXjYG5rSaq
         tyeQO+DVTMr47fqdcmeUkzrNwCkN1xPV4mKr10Hnbqfu08UEi2pJdzJjpRQUEK+Ik5
         8DjBf7+N0dcWTUXn8fSxbA2apEfTxtwBM3/1SNl7zRRGYJcUnmWXEw01+vJCHheR/8
         Hg60KlZ2RF/T5DArvKxkfa52HNq+uabGjkdULXYGi4+Vh+oStrgyplFmu3uNawMqNT
         3iBH7jSwIq1qw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mQnTH-001sLO-Nf; Thu, 16 Sep 2021 11:14:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/24] MAINTAINERS: update arm,vic.yaml reference
Date:   Thu, 16 Sep 2021 11:14:05 +0200
Message-Id: <61989ac6bc0bece7078c32320049c74443bbb5ba.1631783482.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631783482.git.mchehab+huawei@kernel.org>
References: <cover.1631783482.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset b7705ba6d0c4 ("dt-bindings: interrupt-controller: Convert ARM VIC to json-schema")
renamed: Documentation/devicetree/bindings/interrupt-controller/arm,vic.txt
to: Documentation/devicetree/bindings/interrupt-controller/arm,vic.yaml.

Update its cross-reference accordingly.

Fixes: b7705ba6d0c4 ("dt-bindings: interrupt-controller: Convert ARM VIC to json-schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ea4cd772a0c..f02d1c94a219 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1550,7 +1550,7 @@ ARM PRIMECELL VIC PL190/PL192 DRIVER
 M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/interrupt-controller/arm,vic.txt
+F:	Documentation/devicetree/bindings/interrupt-controller/arm,vic.yaml
 F:	drivers/irqchip/irq-vic.c
 
 ARM SMC WATCHDOG DRIVER
-- 
2.31.1

