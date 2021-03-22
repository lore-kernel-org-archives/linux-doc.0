Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F38C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 15:11:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91F3061998
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 15:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhCVPKa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Mar 2021 11:10:30 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51610 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230056AbhCVPKC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Mar 2021 11:10:02 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [153.37.224.188])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxM+U9s1hgDzcFAA--.14597S2;
        Mon, 22 Mar 2021 23:09:52 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Namjae Jeon <namjae.jeon@samsung.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Steve French <stfrench@microsoft.com>,
        Gibeom Kim <gibeomii.kim@samsung.com>,
        linux-doc@vger.kernel.org, Huacai chen <chenhuacai@gmail.com>,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2] docs: filesystems: add cifs to the index file
Date:   Mon, 22 Mar 2021 23:09:48 +0800
Message-Id: <20210322150948.5102-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxM+U9s1hgDzcFAA--.14597S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFW8urykKw15GF1kXw1rtFb_yoWktrbEvr
        yfJFWkAFWjyF1xXa4xAFn8WF1IkrZIk3WrZw15ArZ8Xw17J397AFyqgwnYyayUGrZI9ry5
        AFsxXrnxXFnrtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbwkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
        1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
        cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
        ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l
        4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
        AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
        cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
        8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
        wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

    Filesystems has a new cifs folder. Add it to the index file.
    Should address this warning:

	linux-next/Documentation/filesystems/cifs/cifsd.rst: WARNING:
	document isn't included in any toctree
---
 Documentation/filesystems/cifs/index.rst | 11 +++++++++++
 Documentation/filesystems/index.rst      |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/filesystems/cifs/index.rst

diff --git a/Documentation/filesystems/cifs/index.rst b/Documentation/filesystems/cifs/index.rst
new file mode 100644
index 000000000000..1decf6017bdf
--- /dev/null
+++ b/Documentation/filesystems/cifs/index.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====
+CIFS
+====
+
+.. toctree::
+   :maxdepth: 1
+
+   cifsd
+   cifsroot
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index d4853cb919d2..bdba80ae2bb1 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -72,7 +72,7 @@ Documentation for filesystem implementations.
    befs
    bfs
    btrfs
-   cifs/cifsroot
+   cifs/index
    ceph
    coda
    configfs
-- 
2.25.1

