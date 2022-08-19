Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5552FC32792
	for <linux-doc@archiver.kernel.org>; Fri, 19 Aug 2022 06:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241578AbiHSG2y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Aug 2022 02:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243435AbiHSG2w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Aug 2022 02:28:52 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ACA6057271
        for <linux-doc@vger.kernel.org>; Thu, 18 Aug 2022 23:28:50 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxBOKaLf9iHXUEAA--.22726S2;
        Fri, 19 Aug 2022 14:28:42 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V3 0/4] docs/zh_CN: core-api: Add some translations for the "Data structures" section(Part 1)
Date:   Fri, 19 Aug 2022 14:28:36 +0800
Message-Id: <cover.1660881950.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxBOKaLf9iHXUEAA--.22726S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW3ZF1DJF13ZrykWry7trb_yoW8uFW8pF
        4akw1fJ3WDAFyxCrs3Wry7uFyUJFWfW3s0gws7Xw1Svr4rAFW0vrs0yrya93yxJryvgF1r
        Zrs3KrWDu34jyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r47
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjHUDJUUUUU==
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all:

I have translated all the docs for section "Data structures and low-level utilities"
of the core-api, and I plan to split them into two patchset submissions.

This patchset contains the following files:

idr.rst
circular-buffers.rst
generic-radix-tree.rst
packing.rst

For more details, please see TODOLIST in core-api/index.rst.

Thanks.

Changes since v2:
1. Rebase patchset on jc/docs-next.
2. Take Alex's advices about circular-buffers.rst, thanks.

Details:
https://lore.kernel.org/all/CAJy-AmkZFxNPL52M6Yuxu9prgdPSxkaO-FUs=tfY7ZB=YHoR1w@mail.gmail.com/

Changes since v1:
1. Rebase patchset on jc/docs-next.
2. Take the advices of Xiangcheng and Yanteng, thanks.

Details:
https://lore.kernel.org/all/6904a35b-6425-36af-66a0-ecd0a222a15f@loongson.cn/
https://lore.kernel.org/all/35121f9b-4dd7-4114-9242-caf2dcfa8f9c@loongson.cn/
https://lore.kernel.org/all/86118122-2885-78e3-677e-b3a6ca47a20c@loongson.cn/
https://lore.kernel.org/all/YtKy+z+iSA6D8r9m@bobwxc.mipc/
https://lore.kernel.org/all/YtLF2g8fQdi4%2FaKQ@bobwxc.mipc/

Binbin Zhou (4):
  docs/zh_CN: core-api: Add idr Chinese translation
  docs/zh_CN: core-api: Add circular-buffers Chinese translation
  docs/zh_CN: core-api: Add generic-radix-tree Chinese translation
  docs/zh_CN: core-api: Add packing Chinese translation

 .../zh_CN/core-api/circular-buffers.rst       | 210 ++++++++++++++++++
 .../zh_CN/core-api/generic-radix-tree.rst     |  23 ++
 .../translations/zh_CN/core-api/idr.rst       |  80 +++++++
 .../translations/zh_CN/core-api/index.rst     |   8 +-
 .../translations/zh_CN/core-api/packing.rst   | 160 +++++++++++++
 5 files changed, 477 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/circular-buffers.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/idr.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/packing.rst

-- 
2.31.1

