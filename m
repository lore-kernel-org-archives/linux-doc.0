Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE23C43334
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 11:08:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237763AbiFHLIt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 07:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237981AbiFHLIb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 07:08:31 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 07537206114
        for <linux-doc@vger.kernel.org>; Wed,  8 Jun 2022 04:08:24 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.64.16.213])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx308mg6BixnEtAA--.6094S2;
        Wed, 08 Jun 2022 19:08:22 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 0/2] docs/zh_CN: riscv: Update the translation to 5.19-rc1
Date:   Wed,  8 Jun 2022 19:08:19 +0800
Message-Id: <cover.1654685338.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx308mg6BixnEtAA--.6094S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XryDJr4kGr45CF1DGw1rJFb_yoWxKrg_ua
        s2qF4fAa47Jrn7tFWkGr17CrWfAFyfW347ZF15ta98GwsrKw4UXw1qqrWkur15ZF45Zry3
        GrWkWrySvr4IgjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbhkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
        1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02
        F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4I
        kC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF
        7I0En4kS14v26r126r1DMxkIecxEwVAFwVW8KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
        IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAI
        cVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUY38OUUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The content of riscv Chinese documents lags behind the corresponding
English documents, and the relevant commits are updated synchronously.

Changes since v1:
1.The features.rst file does not need to be translated.
2.Update the commit message.

Binbin Zhou (2):
  docs/zh_CN: riscv: Remove the translation of pmu.rst
  docs/zh_CN: riscv: Update the translation of vm-layout.rst to 5.19-rc1

 .../translations/zh_CN/riscv/index.rst        |   1 -
 .../translations/zh_CN/riscv/pmu.rst          | 235 ------------------
 .../translations/zh_CN/riscv/vm-layout.rst    |  37 +++
 3 files changed, 37 insertions(+), 236 deletions(-)
 delete mode 100644 Documentation/translations/zh_CN/riscv/pmu.rst

-- 
2.20.1

