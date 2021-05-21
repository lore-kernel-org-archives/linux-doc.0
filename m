Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260BFC433B4
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 07:38:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01B0E6135B
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 07:38:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhEUHjw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 03:39:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52760 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230050AbhEUHjw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 May 2021 03:39:52 -0400
Received: from localhost.localdomain (unknown [112.20.113.102])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX0NwY6dgAiICAA--.1028S2;
        Fri, 21 May 2021 15:38:24 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     dan.j.williams@intel.com, ben.widawsky@intel.com,
        Jonathan.Cameron@huawei.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs: driver-api: documentation build warning fix
Date:   Fri, 21 May 2021 15:39:05 +0800
Message-Id: <20210521073905.3728255-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxX0NwY6dgAiICAA--.1028S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr15trW5Zw43XFW8urWDtwb_yoWfWFg_CF
        yDuFsxAryjqa4rtw45uFn8ZF1jv3WfKr4v93Wft393A343t3y3W34qy3y2vFykXrWDuFn8
        A3yDZrsakFnxKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8CwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUh4SOUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 5f653f7590ab7db7379f668b2975744585206b0d rename bus.c to core.c, but introduced a new documentation warnings:

Documentation/driver-api/cxl/memory-devices.rst:32: WARNING: Title underline too short.

CXL Core
-------

Core is longer than bus, so just add a "-"

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/driver-api/cxl/memory-devices.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/cxl/memory-devices.rst b/Documentation/driver-api/cxl/memory-devices.rst
index 71495ed77069..73f6b246c583 100644
--- a/Documentation/driver-api/cxl/memory-devices.rst
+++ b/Documentation/driver-api/cxl/memory-devices.rst
@@ -29,7 +29,7 @@ CXL Memory Device
    :internal:
 
 CXL Core
--------
+--------
 .. kernel-doc:: drivers/cxl/core.c
    :doc: cxl core
 
-- 
2.27.0

