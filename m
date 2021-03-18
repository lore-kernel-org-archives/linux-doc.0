Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625BDC433E9
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 03:26:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D1A664EEC
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 03:26:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhCRD0X (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Mar 2021 23:26:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44856 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231249AbhCRD0O (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 17 Mar 2021 23:26:14 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [112.20.110.110])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Bx4+RMyFJgffEBAA--.6905S2;
        Thu, 18 Mar 2021 11:26:05 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Namjae Jeon <namjae.jeon@samsung.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Steve French <stfrench@microsoft.com>,
        Gibeom Kim <gibeomii.kim@samsung.com>,
        linux-doc@vger.kernel.org, Huacai chen <chenhuacai@gmail.com>,
        siyanteng@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 0/2] docs/filesystems:fixes two build warnings
Date:   Thu, 18 Mar 2021 11:26:02 +0800
Message-Id: <20210318032604.9727-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Bx4+RMyFJgffEBAA--.6905S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF48uFWrur1xWrWfGF18uFg_yoW3Grg_C3
        4xXFWkJr1UZ3WxJ3WxCF15WF13CFW7K3Wruw45Jry8Ja47JrWDJa4Dt34rtw48JFsxuryD
        JFsrX3savFnrtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
        0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r48
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjQBMtUUUU
        U==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series of patches fix some warnings:

linux-next/Documentation/filesystems/cifs/cifsd.rst:3: WARNING: Title overline too short.

=========================
CIFSD - SMB3 Kernel Server
=========================

linux-next/Documentation/filesystems/cifs/cifsd.rst: WARNING: document isn't included in any toctree

Yanteng Si(2):

docs: filesystems: cifsd: fix document title markup
docs: filesystems: add cifs to the index file

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
Documentation/filesystems/cifs/cifsd.rst |  4 ++--
Documentation/filesystems/cifs/index.rst | 12 ++++++++++++
Documentation/filesystems/index.rst      |  2 +-
3 files changed, 15 insertions(+), 3 deletions(-)

