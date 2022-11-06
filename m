Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B69AC4332F
	for <linux-doc@archiver.kernel.org>; Sun,  6 Nov 2022 07:00:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiKFG77 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 6 Nov 2022 01:59:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiKFG76 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Nov 2022 01:59:58 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D800E95AA
        for <linux-doc@vger.kernel.org>; Sat,  5 Nov 2022 23:59:56 -0700 (PDT)
Received: from loongson.cn (unknown [223.106.24.7])
        by gateway (Coremail) with SMTP id _____8AxHLZqW2dj_L8EAA--.3987S3;
        Sun, 06 Nov 2022 14:59:54 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.24.7])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx9VZpW2djQfANAA--.20658S2;
        Sun, 06 Nov 2022 14:59:53 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V3 0/3] docs/zh_CN: core-api: Add some translations for the "Data structures" section(Part 2)
Date:   Sun,  6 Nov 2022 14:57:47 +0800
Message-Id: <cover.1666689138.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx9VZpW2djQfANAA--.20658S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7tFy7CF45CFyfAryxWw4xXrb_yoW8WFyfpF
        ZIkrn3G3ZrCF12yws3WrZrXF15AayfW3y0g3s7Xw1SvF45JF1FyrZYkryagFWUZryktF1F
        vrs3trn8u34jyrJanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bVAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
        x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1ln4kS
        14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
        1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
        67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
        Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAq
        x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r
        1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF
        7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
        WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5
        xhLUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all:

Sorry, it may have been a while since the V2 patchset. Thanks to Alex
for his comments.

As a continuation of the previous patchset
(https://lore.kernel.org/all/cover.1660881950.git.zhoubinbin@loongson.cn/),
this patchset contains the Chinese translations of the remaining three files.

As follows:

this_cpu_ops.rst
timekeeping.rst
errseq.rst

So far, the docs for section "Data structures and low-level utilities" of
the core-api has been translated completely.

Thanks.

Changes since V2:
- Take Alex's advices, thanks.

Details: 
https://lore.kernel.org/all/CAJy-Am=mtZxQv2AgH+PxVLsJ8FeW1NRQV2bkLD1RRLGQLxUPgQ@mail.gmail.com/

Changes since V1:
- Take Xiangcheng's advices, thanks.

Details: 
https://lore.kernel.org/all/Y0wsWoI+BXXCuRbF@bobwxc.mipc/
https://lore.kernel.org/all/Y02EcgD3E0%2FlML5H@bobwxc.mipc/

Binbin Zhou (3):
  docs/zh_CN: core-api: Add this_cpu_ops Chinese translation
  docs/zh_CN: core-api: Add timekeeping Chinese translation
  docs/zh_CN: core-api: Add errseq Chinese translation

 .../translations/zh_CN/core-api/errseq.rst    | 145 +++++++++
 .../translations/zh_CN/core-api/index.rst     |   5 -
 .../zh_CN/core-api/this_cpu_ops.rst           | 285 ++++++++++++++++++
 .../zh_CN/core-api/timekeeping.rst            | 177 +++++++++++
 4 files changed, 607 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/errseq.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/timekeeping.rst

-- 
2.31.1

