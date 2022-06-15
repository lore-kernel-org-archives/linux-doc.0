Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7A5C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jun 2022 09:24:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbiFOJYk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jun 2022 05:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241256AbiFOJYj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jun 2022 05:24:39 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DDF6515FD7
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 02:24:36 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.64.16.213])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT95RpalikHZDAA--.6185S2;
        Wed, 15 Jun 2022 17:24:34 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/9] docs/zh_CN: core-api: Update the partial translation to 5.19-rc2
Date:   Wed, 15 Jun 2022 17:24:23 +0800
Message-Id: <cover.1655258291.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT95RpalikHZDAA--.6185S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyUXrykJw15JF15ZFWxXrb_yoW8Xw15pF
        W3Kr93X3WkGFyY9wn7WrWDAFWrWFWUX390kw43twnIyrn5K3yUtr4UtryagaykXr92qr1F
        yr4ftrWDu34UAr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4f
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVW8JVWxJwCI
        42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeLvtDUUUU
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series of patches updat the contents of the translated files
in the core-api directory to 5.19-rc2.

In the next step, I plan to translate the untranslated documents
in the core-api directory. For details, see TODOLIST in the
core-api/index.rst file.

Binbin Zhou (9):
  docs/zh_CN: core-api: Update the translation of cachetlb.rst to
    5.19-rc2
  docs/zh_CN: core-api: Update the translation of cpu_hotplug.rst to
    5.19-rc2
  docs/zh_CN: core-api: Update the translation of irq/irq-domain.rst to
    5.19-rc2
  docs/zh_CN: core-api: Update the translation of kernel-api.rst to
    5.19-rc2
  docs/zh_CN: core-api: Update the translation of mm-api.rst to 5.19-rc2
  docs/zh_CN: core-api: Update the translation of printk-basics.rst to
    5.19-rc2
  docs/zh_CN: core-api: Update the translation of printk-format.rst to
    5.19-rc2
  docs/zh_CN: core-api: Update the translation of workqueue.rst to
    5.19-rc2
  docs/zh_CN: core-api: Update the translation of xarray.rst to 5.19-rc2

 .../translations/zh_CN/core-api/cachetlb.rst  |   6 +
 .../zh_CN/core-api/cpu_hotplug.rst            | 435 +++++++++++++++---
 .../zh_CN/core-api/irq/irq-domain.rst         |  22 +-
 .../zh_CN/core-api/kernel-api.rst             |   3 +
 .../translations/zh_CN/core-api/mm-api.rst    |  23 +-
 .../zh_CN/core-api/printk-basics.rst          |   3 +-
 .../zh_CN/core-api/printk-formats.rst         |  13 +-
 .../translations/zh_CN/core-api/workqueue.rst |  21 +-
 .../translations/zh_CN/core-api/xarray.rst    |   4 +-
 9 files changed, 459 insertions(+), 71 deletions(-)

-- 
2.20.1

