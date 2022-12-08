Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82D0C63708
	for <linux-doc@archiver.kernel.org>; Thu,  8 Dec 2022 12:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbiLHM4v (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Dec 2022 07:56:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbiLHM4q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Dec 2022 07:56:46 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E87B28C460
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 04:56:44 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8Dx_+sL35FjlRwEAA--.9587S3;
        Thu, 08 Dec 2022 20:56:43 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxj+AJ35Fj+BQoAA--.32260S2;
        Thu, 08 Dec 2022 20:56:42 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v1 00/13] docs/zh_CN: Update the translation to 6.1-rc8
Date:   Thu,  8 Dec 2022 20:57:05 +0800
Message-Id: <cover.1670502763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxj+AJ35Fj+BQoAA--.32260S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Ww4kJFy5Gr1kWF45ZrW7twb_yoW8AFy3pF
        93KFyfZ3Z7AFy3uw1fCrW8ZF4rXa1kJ398tw12qwnYyw4vqw4UtFyUXFyag3y2vrWfZF1f
        Ar4rCr4Du34jkw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b7xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64
        kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm
        72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I3I
        0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
        GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
        0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
        rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r
        4UYxBIdaVFxhVjvjDU0xZFpf9x07jYSoJUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v1:
The following files were updated to 6.1-rc8:
accounting
admin-guide/mm
core-api
dev-tools
mm
PCI
power

Yanteng Si (13):
  docs/zh_CN: Update the translation of delay-accounting to 6.1-rc8
  docs/zh_CN: Update the translation of kernel-api to 6.1-rc8
  docs/zh_CN: Update the translation of mm-api to 6.1-rc8
  docs/zh_CN: Update the translation of highmem to 6.1-rc8
  docs/zh_CN: Update the translation of page_owner to 6.1-rc8
  docs/zh_CN: Update the translation of kasan to 6.1-rc8
  docs/zh_CN: Update the translation of testing-overview to 6.1-rc8
  docs/zh_CN: Update the translation of reclaim to 6.1-rc8
  docs/zh_CN: Update the translation of start to 6.1-rc8
  docs/zh_CN: Update the translation of usage to 6.1-rc8
  docs/zh_CN: Update the translation of ksm to 6.1-rc8
  docs/zh_CN: Update the translation of msi-howto to 6.1-rc8
  docs/zh_CN: Update the translation of energy-model to 6.1-rc8

 .../translations/zh_CN/PCI/msi-howto.rst      | 11 +++
 .../zh_CN/accounting/delay-accounting.rst     |  7 +-
 .../zh_CN/admin-guide/mm/damon/reclaim.rst    |  4 -
 .../zh_CN/admin-guide/mm/damon/start.rst      | 12 +--
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 68 +++++++++++-----
 .../translations/zh_CN/admin-guide/mm/ksm.rst | 50 ++++++++++++
 .../zh_CN/core-api/kernel-api.rst             | 10 ++-
 .../translations/zh_CN/core-api/mm-api.rst    |  2 +-
 .../translations/zh_CN/dev-tools/kasan.rst    | 77 +++++++++++--------
 .../zh_CN/dev-tools/testing-overview.rst      | 27 +++++++
 .../translations/zh_CN/mm/highmem.rst         | 20 ++++-
 .../translations/zh_CN/mm/page_owner.rst      | 17 +---
 .../translations/zh_CN/power/energy-model.rst | 36 +++++++--
 13 files changed, 246 insertions(+), 95 deletions(-)

-- 
2.31.1

