Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1FFC43334
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jul 2022 13:52:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbiGSNwg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jul 2022 09:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237169AbiGSNwX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 09:52:23 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3062C114161
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 06:04:29 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axn+LYq9ZiM4QoAA--.11347S2;
        Tue, 19 Jul 2022 21:04:25 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/4] docs/zh_CN: core-api: Add some translations for the "Data structures" section(Part 1)
Date:   Tue, 19 Jul 2022 21:04:14 +0800
Message-Id: <cover.1658196777.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axn+LYq9ZiM4QoAA--.11347S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW3ZF1DJF13ZrykWry7trb_yoW8CFWUpF
        4akr1fJ3WDAFyxCrs3Wry7WFy5JFWfW3s0gws7Xw1SvrWrAayFvrs0yrya9ayxJryvgFyr
        Zrs3KrWDu34jyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Xr4l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjHGQDUUUUU==
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

 .../zh_CN/core-api/circular-buffers.rst       | 209 ++++++++++++++++++
 .../zh_CN/core-api/generic-radix-tree.rst     |  23 ++
 .../translations/zh_CN/core-api/idr.rst       |  77 +++++++
 .../translations/zh_CN/core-api/index.rst     |   8 +-
 .../translations/zh_CN/core-api/packing.rst   | 159 +++++++++++++
 5 files changed, 472 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/circular-buffers.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/idr.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/packing.rst

-- 
2.20.1

