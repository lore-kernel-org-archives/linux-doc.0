Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A574DC43334
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 05:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbiFMFCN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 01:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiFMFCL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 01:02:11 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AFF9DB15
        for <linux-doc@vger.kernel.org>; Sun, 12 Jun 2022 22:02:09 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxOeTLxKZiLn49AA--.4099S2;
        Mon, 13 Jun 2022 13:02:05 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, zhoubinbin@loongson.cn
Subject: [PATCH v2 0/3] docs/zh_CN: Update the translation of vm to 5.19-rc1
Date:   Mon, 13 Jun 2022 13:03:39 +0800
Message-Id: <cover.1655094814.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxOeTLxKZiLn49AA--.4099S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW3Kw47WF1xAF43Ar47urg_yoW8tFW5pa
        97KryfW3WxA3ZIkw4xGa18Cr18Aa4xWa15Gr12qwnaqrs7tr4rtrZ0yr9Fga93Xry8AF15
        Xr4FkF4UW34jkFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
        evJa73UjIFyTuYvjfUOb18DUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
Modify some words under Xiangcheng's advice.
add disclaimer-zh_CN to [PATCH 3/3].

v1:
Update .../zh_CN/vm/* to 5.19-rc1.

Yanteng Si (3):
  docs/zh_CN: Update the translation of highmem to 5.19-rc1
  docs/zh_CN: Update the translation of page_owner to 5.19-rc1
  docs/zh_CN: Update the translation of vm index to 5.19-rc1

 .../translations/zh_CN/vm/bootmem.rst         | 14 ++++
 .../translations/zh_CN/vm/highmem.rst         | 77 +++++++++++--------
 Documentation/translations/zh_CN/vm/index.rst | 37 +++++++--
 Documentation/translations/zh_CN/vm/oom.rst   | 14 ++++
 .../translations/zh_CN/vm/page_allocation.rst | 14 ++++
 .../translations/zh_CN/vm/page_cache.rst      | 14 ++++
 .../translations/zh_CN/vm/page_owner.rst      | 72 +++++++++++++++--
 .../translations/zh_CN/vm/page_reclaim.rst    | 14 ++++
 .../translations/zh_CN/vm/page_tables.rst     | 14 ++++
 .../translations/zh_CN/vm/physical_memory.rst | 14 ++++
 .../translations/zh_CN/vm/process_addrs.rst   | 14 ++++
 Documentation/translations/zh_CN/vm/shmfs.rst | 14 ++++
 Documentation/translations/zh_CN/vm/slab.rst  | 14 ++++
 Documentation/translations/zh_CN/vm/swap.rst  | 14 ++++
 .../translations/zh_CN/vm/vmalloc.rst         | 14 ++++
 15 files changed, 306 insertions(+), 48 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/bootmem.rst
 create mode 100644 Documentation/translations/zh_CN/vm/oom.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_allocation.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_cache.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_reclaim.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_tables.rst
 create mode 100644 Documentation/translations/zh_CN/vm/physical_memory.rst
 create mode 100644 Documentation/translations/zh_CN/vm/process_addrs.rst
 create mode 100644 Documentation/translations/zh_CN/vm/shmfs.rst
 create mode 100644 Documentation/translations/zh_CN/vm/slab.rst
 create mode 100644 Documentation/translations/zh_CN/vm/swap.rst
 create mode 100644 Documentation/translations/zh_CN/vm/vmalloc.rst

-- 
2.27.0

