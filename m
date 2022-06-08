Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4028BC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 05:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbiFHFhr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 01:37:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234058AbiFHFhh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 01:37:37 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 49A322FCB61
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 20:04:21 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.64.16.213])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxf+awEaBiWKIoAA--.40690S2;
        Wed, 08 Jun 2022 11:04:16 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/3] docs/zh_CN: riscv: Update the translation to 5.19-rc1
Date:   Wed,  8 Jun 2022 11:04:12 +0800
Message-Id: <cover.1654652729.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxf+awEaBiWKIoAA--.40690S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XryDJr4kGr45CF1DGw1rJFb_yoW3twb_ua
        s7XF4Iy3WUJryxKF4kGr1UCrWfAFySg347Xrn8tayDWwsrKw4DJw1qqFZ3WFy5ZF45Zry3
        GrZ7ZrySqr1IgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r48
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r
        1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUfxhLUUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The content of riscv Chinese documents lags behind the corresponding
English documents, and the relevant commits are updated synchronously.

Binbin Zhou (3):
  docs/zh_CN: riscv: Update the translation of features.rst to 5.19-rc1
  docs/zh_CN: riscv: Update the translation of pmu.rst to 5.19-rc1
  docs/zh_CN: riscv: Update the translation of vm-layout.rst to 5.19-rc1

 .../translations/zh_CN/riscv/features.rst     |   8 +
 .../translations/zh_CN/riscv/index.rst        |   2 +-
 .../translations/zh_CN/riscv/pmu.rst          | 235 ------------------
 .../translations/zh_CN/riscv/vm-layout.rst    |  37 +++
 4 files changed, 46 insertions(+), 236 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/riscv/features.rst
 delete mode 100644 Documentation/translations/zh_CN/riscv/pmu.rst

-- 
2.20.1

