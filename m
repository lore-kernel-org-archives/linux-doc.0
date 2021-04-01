Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF7BC433ED
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:27:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CD4D60C3E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 18:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236455AbhDAS11 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 14:27:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:44970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237372AbhDASNC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 14:13:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4719B61175;
        Thu,  1 Apr 2021 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617279476;
        bh=/xzGftxF6g9AvylB9tQLFJ3NI/iugICh5iPIYaiNVXU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZSzLTItMVis7wI5/xxa5rCscDle9SqYwCNNowCQBk5UEjlmQwNZkRrYmTQsTA4rb6
         JUNsiLeHHe2FYR1CZQUxoIs/wKR05+Vq70/GiDKD3WRswDeW0cWbnPz+D4/+2cvxGX
         Rj+hPtDVUSVcFitRE7LOEJGCJt6t06r2wnGOa7sEuH7QSXupncy44UjjOQNLXjyGNY
         0RuQKdelX5q3lTaWErJgdUnW+xhlfLZEoVCBkHASxfyctbvvJje/j06zggl/TlfJIV
         oOxQxd8/axDjHT3gJXblgPbXVqWq6C332mw+sgn77bFBc6IdS+g7BOPq//l6yRQteO
         nSJmFerGi57pQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lRwGo-001c3M-BN; Thu, 01 Apr 2021 14:17:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 23/32] MAINTAINERS: update ovti,ov2680.yaml reference
Date:   Thu,  1 Apr 2021 14:17:43 +0200
Message-Id: <f6474fa072117ec42bef82379abb5df958fab426.1617279355.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The file name: Documentation/devicetree/bindings/media/i2c/ov2680.yaml
should be, instead: Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml.

Update its cross-reference accordingly.

Fixes: 57226cd8c8bf ("media: dt-bindings: ov2680: convert bindings to yaml")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ee42d68a269..1644b6e9697c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13351,7 +13351,7 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/ov2680.yaml
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
 F:	drivers/media/i2c/ov2680.c
 
 OMNIVISION OV2685 SENSOR DRIVER
-- 
2.30.2

