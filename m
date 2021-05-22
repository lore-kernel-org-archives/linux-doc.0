Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A94C04FF3
	for <linux-doc@archiver.kernel.org>; Sat, 22 May 2021 03:13:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28EB4613CC
	for <linux-doc@archiver.kernel.org>; Sat, 22 May 2021 03:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbhEVDOq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 23:14:46 -0400
Received: from [43.250.32.171] ([43.250.32.171]:47328 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S231149AbhEVDOp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 May 2021 23:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=From:To:Date; bh=vJkq7wa9Z6jij7BO6V7KBAE4fXZ75ffcsEThU
        MYmmcI=; b=LdF2icMMMCb78EVmZHM1+KM4zkRx9nij8pA+LOzvG9EzkQmk74APa
        ZFls4PJB/nhCamDC3yw57IY1JyPRFhSO4AG5AISaYVPKtauj0jmmC7SLDh6iJtds
        gqxd2JrWHC2fwlhAv1PnF46MbLkLJMriCGUxFriHvF7heCzb3EbBlM=
Received: from localhost.localdomain (unknown [113.251.14.223])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgCnbkHMdqhgA+A3AA--.18569S2;
        Sat, 22 May 2021 11:13:16 +0800 (CST)
From:   Hu Haowen <src.res@email.cn>
To:     alexs@kernel.org, corbet@lwn.net, bobwxc@email.cn,
        maskray@google.com, bernard@vivo.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hu Haowen <src.res@email.cn>
Subject: [PATCH v2 1/3] docs/zh_CN: update a translation in zh_CN/dev-tools/gcov
Date:   Sat, 22 May 2021 11:13:13 +0800
Message-Id: <20210522031314.57982-1-src.res@email.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LCKnCgCnbkHMdqhgA+A3AA--.18569S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw4Dtr13Xw1ruFyfXF4fZrb_yoWftrc_Gw
        1kWF4vyFy3Jry2gr4rAF1kJr1fZF4rKw18Arn0ya98Jw15G39rGa4DX3s5ZFW3WF43urW3
        CrZ7ZrZ3trn2yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbF8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWUJVWUGwA2ocxC64kI
        II0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7
        xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2
        z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc
        02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1UJr1lOx8S6xCaFVCjc4AY
        6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7
        AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s02
        6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
        I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
        6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj4
        0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
        JrUvcSsGvfC2KfnxnUUI43ZEXa7VU0hZ23UUUUU==
X-Originating-IP: [113.251.14.223]
X-CM-SenderInfo: hvufh21hv6vzxdlohubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The original file has added some words in commit c797997a244cd2c58908
("Documentation: dev-tools: Add Testing Overview"), hence update the
Chinese translation of them.

Signed-off-by: Hu Haowen <src.res@email.cn>
---
 Documentation/translations/zh_CN/dev-tools/index.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/translations/zh_CN/dev-tools/index.rst b/Documentation/translations/zh_CN/dev-tools/index.rst
index fd73c479917b..7ba02fc392a6 100644
--- a/Documentation/translations/zh_CN/dev-tools/index.rst
+++ b/Documentation/translations/zh_CN/dev-tools/index.rst
@@ -11,6 +11,9 @@
 目前这些文档已经整理在一起，不需要再花费额外的精力。
 欢迎任何补丁。
 
+有关测试专用工具的简要概述，参见
+Documentation/dev-tools/testing-overview.rst
+
 .. class:: toc-title
 
 	   目录
-- 
2.25.1

