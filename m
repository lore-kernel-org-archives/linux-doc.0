Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B367C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 15:08:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E443619A4
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 15:08:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236489AbhCXPHw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Mar 2021 11:07:52 -0400
Received: from mail.loongson.cn ([114.242.206.163]:47070 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236410AbhCXPHk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 24 Mar 2021 11:07:40 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [153.37.224.188])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxU+C1VVtgilQAAA--.1175S2;
        Wed, 24 Mar 2021 23:07:33 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 0/8] docs/zh_CN: add cpu-freq translation
Date:   Wed, 24 Mar 2021 23:07:23 +0800
Message-Id: <20210324150731.4512-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxU+C1VVtgilQAAA--.1175S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rtr1rJryUGFyDuw4rZrb_yoW8JF4DpF
        1DKryrZF10yr13Jw1fGrW7JF15JF4xC3y5tr17JwnYvr15Jw4UtFyUtrW7tF9rJr1xXFyY
        qr4rKr1Dur1UAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5WwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
        1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUgmRUUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series of patches:
 translates Documention/cpu-freq/* into Chinese.
 add .../zh_CN/mips to zh_CN index
 add .../zh_CN/iio to zh_CN index
 add .../zh_CN/riscv to zh_CN index

Yabteng Si(8):
docs/zh_CN: add cpu-freq core.rst translation
docs/zh_CN: add cpu-freq cpu-drivers.rst translation
docs/zh_CN: add cpu-freq cpufreq-stats.rst translation
docs/zh_CN: add cpu-freq index.rst translation
docs/zh_CN: add cpu-freq to zh_CN index
docs/zh_CN: add mips to zh_CN index
docs/zh_CN: add iio to zh_CN index
docs/zh_CN: add riscv to zh_CN index

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/cpu-freq/core.rst          | 105
+++++++++++++++++++++++++++++++++++++++++++++
 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst   | 259
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst | 130
++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/translations/zh_CN/cpu-freq/index.rst         |  45
++++++++++++++++++++
 Documentation/translations/zh_CN/index.rst                  |   4 ++
 5 files changed, 543 insertions(+)

