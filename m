Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88729C43334
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 10:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241671AbiFVKTU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347120AbiFVKTJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 06:19:09 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D98963B3F1
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 03:18:59 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+aQ7LJiWBFUAA--.27260S2;
        Wed, 22 Jun 2022 18:18:57 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 0/9] docs/zh_CN: core-api: Update the partial translation to 5.19-rc3
Date:   Wed, 22 Jun 2022 18:18:46 +0800
Message-Id: <cover.1655863769.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+aQ7LJiWBFUAA--.27260S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFWUuw18Jr13XryDXF18Krg_yoW8Zw1rpF
        W3Kr93X3WkGFy3uwn7WrWDAFWrWFWUX390kw4ftwnIyrn5K3y8tr48t34agay8Gr92qF1F
        yr43trWDu3yjyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw1l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
        4UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUFg4SDUUUU
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In this series of patches, I updated the translated file contents in the core-api
directory to 5.19-rc3.

The next step, I plan to translate the untranslated documents in the core-api
directory. For details, please see TODOLIST in the core-api/index.rst file.

Changes since V1:
- Update the code base to 5.19-rc3

- According to the suggestions of Xiangcheng and Yanteng, the translations of
  corresponding documents are updated to make them more readable.
  
  The modified documents are as follows:
    cpu_hotplug.rst
    irq/irq-domain.rst
    printk-format.rst

  If you like, please review the mailing list for details.

In addition, for the translation of the Rust part in "printk-format.rst", I will
reorganize it into a patch to the Rust tree.

Binbin Zhou (9):
  docs/zh_CN: core-api: Update the translation of cachetlb.rst to
    5.19-rc3
  docs/zh_CN: core-api: Update the translation of cpu_hotplug.rst to
    5.19-rc3
  docs/zh_CN: core-api: Update the translation of irq/irq-domain.rst to
    5.19-rc3
  docs/zh_CN: core-api: Update the translation of kernel-api.rst to
    5.19-rc3
  docs/zh_CN: core-api: Update the translation of mm-api.rst to 5.19-rc3
  docs/zh_CN: core-api: Update the translation of printk-basics.rst to
    5.19-rc3
  docs/zh_CN: core-api: Update the translation of printk-format.rst to
    5.19-rc3
  docs/zh_CN: core-api: Update the translation of workqueue.rst to
    5.19-rc3
  docs/zh_CN: core-api: Update the translation of xarray.rst to 5.19-rc3

 .../translations/zh_CN/core-api/cachetlb.rst  |   6 +
 .../zh_CN/core-api/cpu_hotplug.rst            | 435 +++++++++++++++---
 .../zh_CN/core-api/irq/irq-domain.rst         |  22 +-
 .../zh_CN/core-api/kernel-api.rst             |   3 +
 .../translations/zh_CN/core-api/mm-api.rst    |  23 +-
 .../zh_CN/core-api/printk-basics.rst          |   3 +-
 .../zh_CN/core-api/printk-formats.rst         |   3 +-
 .../translations/zh_CN/core-api/workqueue.rst |  21 +-
 .../translations/zh_CN/core-api/xarray.rst    |   4 +-
 9 files changed, 449 insertions(+), 71 deletions(-)

-- 
2.20.1

