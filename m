Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CDCC433ED
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:02:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95865613AD
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 07:02:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234283AbhDFHC6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 03:02:58 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57120 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230320AbhDFHC5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 03:02:57 -0400
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax_ciRB2xgbLYEAA--.5852S2;
        Tue, 06 Apr 2021 15:02:43 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 0/8] docs/zh_CN: add cpu-freq translation
Date:   Tue,  6 Apr 2021 15:02:31 +0800
Message-Id: <20210406070239.19910-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax_ciRB2xgbLYEAA--.5852S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw1rtr15CFWrKr4fZrWkZwb_yoW8Xr4fpF
        1DKryrAF10yr17Aw1fGrW7XF15Jan7C3y5Kr17JwnYvrn8Jw4DtFyUtrsFqFnrJr1xZFyY
        qr48Kr1Dur1UAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
        ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAF
        wI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
        7VUbXdbUUUUUU==
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

v3 -> v4:

add Reviewed-by: Alex Shi <alexs@kernel.org>

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

