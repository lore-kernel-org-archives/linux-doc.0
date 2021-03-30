Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E90C433C1
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 11:49:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DDAE6195C
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 11:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbhC3Lsc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Mar 2021 07:48:32 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46590 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232239AbhC3Lro (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 30 Mar 2021 07:47:44 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxzcjSD2NgLF4CAA--.2278S2;
        Tue, 30 Mar 2021 19:47:30 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 0/8] docs/zh_CN: add cpu-freq translation
Date:   Tue, 30 Mar 2021 19:47:20 +0800
Message-Id: <20210330114728.2680-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxzcjSD2NgLF4CAA--.2278S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rtr15CFWrKr4fZrWkZwb_yoW8GFWUpF
        1DKryrAF10yr17Aw1fGrW7XF15JFs7C3y5tr17JwnYyr15Jw4DtFyUtr47tF1DJr1xZFyY
        qr48Kr1Dur1UAr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r4kMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1l
        IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
        C2KfnxnUUI43ZEXa7VUbLID7UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series of patches:
 translates Documention/cpu-freq/* into Chinese.
 add .../zh_CN/mips to zh_CN index
 add .../zh_CN/iio to zh_CN index
 add .../zh_CN/riscv to zh_CN index

v1 -> v2:

Correction of some errata;
Thanks to Jiaxun and Xiangcheng for their
help,:)

v2 -> v3:

Correction of a small number of errata;

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

