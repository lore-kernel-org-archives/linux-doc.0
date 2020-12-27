Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C4FC433E0
	for <linux-doc@archiver.kernel.org>; Sun, 27 Dec 2020 07:33:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E55132084D
	for <linux-doc@archiver.kernel.org>; Sun, 27 Dec 2020 07:33:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgL0Hdh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 27 Dec 2020 02:33:37 -0500
Received: from m12-12.163.com ([220.181.12.12]:42110 "EHLO m12-12.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbgL0Hdh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 27 Dec 2020 02:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=U1E2nHjvAHl9sTWvIk
        fd0iDL775g9uAG+881yFD/zfs=; b=a8wr6Mhv7i3QbzFf++IrZ8J4MjUM4ETlhh
        qH0OnHhF+IGAutkbM1bD4zITPmKow6wQgwiKCyOqxrOZ7I7YNUn/aNLhcZGum7YX
        aPB2DuaZLK4yXPhc6l5QvyDbfYPDUt24LiHuEq7ZO/9SuhcCMPkMZgEpAbmIXZMr
        6hFV3CYJI=
Received: from localhost.localdomain.localdomain (unknown [171.221.128.54])
        by smtp8 (Coremail) with SMTP id DMCowACXS9mjNOhf1Ux_JA--.60335S2;
        Sun, 27 Dec 2020 15:15:47 +0800 (CST)
From:   winndows@163.com
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liao Pingfang <winndows@163.com>
Subject: [PATCH] docs/mm: concepts.rst: Correct the threshold to low watermark
Date:   Sun, 27 Dec 2020 15:15:19 +0800
Message-Id: <1609053319-3112-1-git-send-email-winndows@163.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: DMCowACXS9mjNOhf1Ux_JA--.60335S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1fXr4ruw43tr43ZFWxtFb_yoWkurbEka
        4UXFs29a1xA348G3yfJ3ZYvFW29r4Ig34fCwn3Ar47J3yUuan8AF1kuF1Yy34fJr429r43
        Wr98Jr97Kr1a9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8rMaUUUUUU==
X-Originating-IP: [171.221.128.54]
X-CM-SenderInfo: hzlq0vxrzvqiywtou0bp/1tbiMAgImVWBwhgVhQAAs3
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Liao Pingfang <winndows@163.com>

It should be "low watermark" where we wake up kswapd daemon.

Signed-off-by: Liao Pingfang <winndows@163.com>
---
 Documentation/admin-guide/mm/concepts.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/concepts.rst b/Documentation/admin-guide/mm/concepts.rst
index fa0974f..b966fcf 100644
--- a/Documentation/admin-guide/mm/concepts.rst
+++ b/Documentation/admin-guide/mm/concepts.rst
@@ -184,7 +184,7 @@ pages either asynchronously or synchronously, depending on the state
 of the system. When the system is not loaded, most of the memory is free
 and allocation requests will be satisfied immediately from the free
 pages supply. As the load increases, the amount of the free pages goes
-down and when it reaches a certain threshold (high watermark), an
+down and when it reaches a certain threshold (low watermark), an
 allocation request will awaken the ``kswapd`` daemon. It will
 asynchronously scan memory pages and either just free them if the data
 they contain is available elsewhere, or evict to the backing storage
-- 
1.8.3.1


