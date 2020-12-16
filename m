Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220FCC4361B
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 01:12:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F062322EBD
	for <linux-doc@archiver.kernel.org>; Wed, 16 Dec 2020 01:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgLPBLw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:11:52 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9613 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgLPBLw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Dec 2020 20:11:52 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CwcWD2BBcz15c8M;
        Wed, 16 Dec 2020 09:10:32 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 09:10:36 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <corbet@lwn.net>, <p.zabel@pengutronix.de>,
        <Jonathan.Cameron@huawei.com>, <alexandru.ardelean@analog.com>,
        <bgolaszewski@baylibre.com>, <davem@davemloft.net>,
        <zhengdejin5@gmail.com>, <matti.vaittinen@fi.rohmeurope.com>,
        <daniel.vetter@ffwll.ch>
CC:     <linux-doc@vger.kernel.org>
Subject: [PATCH] Documentation: devres: Add missing DRM functions
Date:   Wed, 16 Dec 2020 09:10:45 +0800
Message-ID: <1608081045-39958-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit d96bc380a50f ("drm/irq: Add the new api to install irq")
introduced devm_drm_irq_install. Add the new functionion to the list of
managed interfaces.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index bb67657..e8f900d 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -264,6 +264,7 @@ DMA
 
 DRM
   devm_drm_dev_alloc()
+  devm_drm_irq_install()
 
 GPIO
   devm_gpiod_get()
-- 
2.7.4

