Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC10DC43460
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 07:10:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC520613BF
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 07:10:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbhEUHLb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 03:11:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46186 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231866AbhEUHL1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 May 2021 03:11:27 -0400
Received: from localhost.localdomain (unknown [112.20.113.102])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj0LEXKdgAB4CAA--.883S2;
        Fri, 21 May 2021 15:09:56 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com
Subject: [PATCH v2 0/2] docs/zh_CN:add core-api refcount-vs-atomic.rst and local_ops.rst translation.
Date:   Fri, 21 May 2021 15:10:35 +0800
Message-Id: <cover.1621579507.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj0LEXKdgAB4CAA--.883S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFyrXrWUKw1xArW5uw1xKrg_yoW3WFg_Ca
        s5Jay0yFsrAFnrtFZ5uw13JFW09F4Sg34v9F4Ut398uayDC3yDWr1DXas0qw48Xan8ArW3
        GF97Wr1fXrnFkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbc8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8CwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYMKZDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:

Some translations have been modified as suggested by Xiangcheng.

v1:

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

