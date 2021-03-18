Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D08C433E6
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 03:26:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4ADD64EEE
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 03:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhCRD0Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Mar 2021 23:26:25 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44902 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231304AbhCRD0Q (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 17 Mar 2021 23:26:16 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [112.20.110.110])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Bx4+RMyFJgffEBAA--.6905S3;
        Thu, 18 Mar 2021 11:26:09 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Namjae Jeon <namjae.jeon@samsung.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Steve French <stfrench@microsoft.com>,
        Gibeom Kim <gibeomii.kim@samsung.com>,
        linux-doc@vger.kernel.org, Huacai chen <chenhuacai@gmail.com>,
        siyanteng@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 1/2] docs: filesystems: cifsd: fix document title markup
Date:   Thu, 18 Mar 2021 11:26:03 +0800
Message-Id: <20210318032604.9727-2-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210318032604.9727-1-siyanteng@loongson.cn>
References: <20210318032604.9727-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Bx4+RMyFJgffEBAA--.6905S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1fXFWDXw4DKF1rCryrtFb_yoWfuFb_C3
        4xXF4UJr1UZr1rJa1xCF15Xr15ArW7tFyrAr45Jry5Jw1UJrWkJa4DAw1rJw18Jrs7urn8
        JF4DJw17XF1UtjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbh8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
        0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gr4l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU1_MaDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As warned by sphinx:

linux-next/Documentation/filesystems/cifs/cifsd.rst:3: WARNING:
Title overline too short.

=========================
CIFSD - SMB3 Kernel Server
=========================

so,just increase it!
---
 Documentation/filesystems/cifs/cifsd.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/cifs/cifsd.rst b/Documentation/filesystems/cifs/cifsd.rst
index e0c33d03f290..af3589da6923 100644
--- a/Documentation/filesystems/cifs/cifsd.rst
+++ b/Documentation/filesystems/cifs/cifsd.rst
@@ -1,8 +1,8 @@
 .. SPDX-License-Identifier: GPL-2.0
 
-=========================
+==========================
 CIFSD - SMB3 Kernel Server
-=========================
+==========================
 
 CIFSD is a linux kernel server which implements SMB3 protocol in kernel space
 for sharing files over network.
-- 
2.25.1

