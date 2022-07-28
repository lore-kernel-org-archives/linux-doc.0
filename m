Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9E3C04A68
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 05:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbiG1FFq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jul 2022 01:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiG1FFq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jul 2022 01:05:46 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EA79F2019A
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 22:05:44 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT+MZGeJiBDk+AA--.39258S2;
        Thu, 28 Jul 2022 13:05:30 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH v2 0/8] Docs/zh_CN: Update some translation to 5.19-rc8
Date:   Thu, 28 Jul 2022 13:05:55 +0800
Message-Id: <cover.1658983157.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT+MZGeJiBDk+AA--.39258S2
X-Coremail-Antispam: 1UD129KBjvJXoW7XrW8CrW5XrW3XFy5Aw47urg_yoW8Jr1xpF
        ZxKF97t3W0yFy5uw18CrWUZFWkWFn3J398Jw1Iqwnaqr4vqr48tF17JryIg3yxXrWIvF1f
        Ar4rCrWUua4Uu3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
        8cxan2IY04v7MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
        WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
        67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
        IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1l
        IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
        C2KfnxnUUI43ZEXa7VUbDDG5UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
*Take Alex's advice and modify "狗粮测试" to "自我测试" .

v1:
* Update the following Chinese documents to 5.19-rc8:

iio
dev-tools
mm/damon
PCI
scheduler

Yanteng Si (8):
  Docs/zh_CN: Update the translation of iio_configfs to 5.19-rc8
  Docs/zh_CN: Update the translation of kasan to 5.19-rc8
  Docs/zh_CN: Update the translation of sparse to 5.19-rc8
  Docs/zh_CN: Update the translation of testing-overview to 5.19-rc8
  Docs/zh_CN: Update the translation of usage to 5.19-rc8
  Docs/zh_CN: Update the translation of pci-iov-howto to 5.19-rc8
  Docs/zh_CN: Update the translation of pci to 5.19-rc8
  Docs/zh_CN: Update the translation of sched-stats to 5.19-rc8

 .../translations/zh_CN/PCI/pci-iov-howto.rst  |   7 +-
 Documentation/translations/zh_CN/PCI/pci.rst  |   6 +-
 .../zh_CN/admin-guide/mm/damon/usage.rst      |   2 +
 .../translations/zh_CN/dev-tools/kasan.rst    | 117 ++++++++++++------
 .../translations/zh_CN/dev-tools/sparse.rst   |   2 +
 .../zh_CN/dev-tools/testing-overview.rst      |  25 ++++
 .../translations/zh_CN/iio/iio_configfs.rst   |  12 +-
 .../zh_CN/scheduler/sched-stats.rst           |   8 +-
 8 files changed, 123 insertions(+), 56 deletions(-)

-- 
2.31.1

