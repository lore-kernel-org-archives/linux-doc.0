Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE5FC433E1
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 02:54:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0122D6193A
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 02:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbhC2Cx0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Mar 2021 22:53:26 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46132 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229645AbhC2CxA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 28 Mar 2021 22:53:00 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxCcr_QGFgLdABAA--.4771S2;
        Mon, 29 Mar 2021 10:52:48 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     alexs@kernel.org, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        "Wu X . C ." <bobwxc@email.cn>, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 0/8] docs/zh_CN: add cpu-freq translation
Date:   Mon, 29 Mar 2021 10:51:36 +0800
Message-Id: <20210329025144.9776-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxCcr_QGFgLdABAA--.4771S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rtr15CFWrKry8AFWkZwb_yoW8GrWUpF
        1DKryrAF18Ar17Aw1fGrW7JF15JFs7C398tr17JwnYyr15Jw4UtryUtrW7tF1DJr1xZFyY
        qr48Kr1Dur1UAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
        628vn2kIc2xKxwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
        v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
        1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIx
        AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyU
        JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
        nIWIevJa73UjIFyTuYvjfUF3kuDUUUU
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

