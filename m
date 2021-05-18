Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B77C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 03:08:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 460EB611CA
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 03:08:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbhERDJk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 23:09:40 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51896 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238085AbhERDJj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 23:09:39 -0400
Received: from localhost.localdomain (unknown [112.20.109.240])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxicmaL6NgxqgYAA--.37699S2;
        Tue, 18 May 2021 11:08:11 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: [PATCH 0/2] docs/zh_CN:add core-api refcount-vs-atomic.rst and local_ops.rst translation.
Date:   Tue, 18 May 2021 11:08:50 +0800
Message-Id: <cover.1621255695.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxicmaL6NgxqgYAA--.37699S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr4rZr18WFy3GFWxZFykuFg_yoWxuFb_C3
        WkJay0yF47AF9rtFZ5uw15JFW09F4Sg34v9F4UtF98CayDA34Dur1DXas8Wa18Xan8ZrW3
        GF93ur1SqrnrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbVAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
        VjvjDU0xZFpf9x0JU-miiUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/refcount-vs-atomic.rst and .../local_ops.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN:add core-api refcount-vs-atomic.rst translation.
  docs/zh_CN: add core api local_ops.rst translation

 .../translations/zh_CN/core-api/index.rst     |   4 +-
 .../translations/zh_CN/core-api/local_ops.rst | 194 ++++++++++++++++++
 .../zh_CN/core-api/refcount-vs-atomic.rst     | 154 ++++++++++++++
 3 files changed, 350 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/local_ops.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst

-- 
2.27.0

