Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A92C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jul 2022 13:06:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239345AbiGNNGL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jul 2022 09:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238893AbiGNNGK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jul 2022 09:06:10 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C753FB493
        for <linux-doc@vger.kernel.org>; Thu, 14 Jul 2022 06:06:07 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9C8FNBizz8eAA--.21883S2;
        Thu, 14 Jul 2022 21:06:04 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        zhoubb.aaron@gmail.com, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/4] docs/zh_CN: core-api: Add some translations for the "Data structures" section(Part 1)
Date:   Thu, 14 Jul 2022 21:05:59 +0800
Message-Id: <cover.1657796498.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr9C8FNBizz8eAA--.21883S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW3ZF1DJF13ZrykWry7trb_yoW8GryrpF
        1fKr1fG3WDAF12krs3WryUXryrJFWxW398K3y2qw1ftFn5JFWFvrs8tryakayfJr92vFyF
        vr43KrWku34jyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6ry8
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnsjbUUUUU
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

Binbin Zhou (4):
  docs/zh_CN: core-api: Add idr Chinese translation
  docs/zh_CN: core-api: Add circular-buffers Chinese translation
  docs/zh_CN: core-api: Add generic-radix-tree Chinese translation
  docs/zh_CN: core-api: Add packing Chinese translation

 .../zh_CN/core-api/circular-buffers.rst       | 205 ++++++++++++++++++
 .../zh_CN/core-api/generic-radix-tree.rst     |  23 ++
 .../translations/zh_CN/core-api/idr.rst       |  74 +++++++
 .../translations/zh_CN/core-api/index.rst     |   8 +-
 .../translations/zh_CN/core-api/packing.rst   | 154 +++++++++++++
 5 files changed, 460 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/circular-buffers.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/idr.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/packing.rst

-- 
2.20.1

