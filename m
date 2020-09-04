Return-Path: <SRS0=2c8a=CN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2938C43461
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 10:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D16DC2084D
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 10:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbgIDKWC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Sep 2020 06:22:02 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:10770 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726171AbgIDKWB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 4 Sep 2020 06:22:01 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 80AEFF4CCB3D714445AD;
        Fri,  4 Sep 2020 18:21:59 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.200.21) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Fri, 4 Sep 2020 18:21:52 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <corbet@lwn.net>
CC:     <linux-doc@vger.kernel.org>,
        Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH] Documentation: core-api/cpu_hotplug: fix a typo
Date:   Fri, 4 Sep 2020 22:19:02 +1200
Message-ID: <20200904101902.29560-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.200.21]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

fourV CPUs should be four CPUs.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 Documentation/core-api/cpu_hotplug.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index 298c9c8..a2c96be 100644
--- a/Documentation/core-api/cpu_hotplug.rst
+++ b/Documentation/core-api/cpu_hotplug.rst
@@ -30,7 +30,7 @@ which didn't support these methods.
 Command Line Switches
 =====================
 ``maxcpus=n``
-  Restrict boot time CPUs to *n*. Say if you have fourV CPUs, using
+  Restrict boot time CPUs to *n*. Say if you have four CPUs, using
   ``maxcpus=2`` will only boot two. You can choose to bring the
   other CPUs later online.
 
-- 
2.9.5


