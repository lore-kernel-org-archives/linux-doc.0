Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FFEC433EF
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 13:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245483AbiFINZm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Jun 2022 09:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245380AbiFINZk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 09:25:40 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 37F10F3F8C
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 06:25:38 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.55])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf0zM9KFiSWk0AA--.696S2;
        Thu, 09 Jun 2022 21:25:33 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, zhoubinbin@loongson.cn
Subject: [PATCH 0/3] docs/zh_CN: Update the translation of vm to 5.19-rc1
Date:   Thu,  9 Jun 2022 21:27:17 +0800
Message-Id: <cover.1654780922.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxf0zM9KFiSWk0AA--.696S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4Utry5ury7CFyDCw48WFg_yoW8Zw1xpa
        s2kryfW3WxA3ZxCw4xGa18Cr18Aa4xWa15Gr12qwnaqrs7tr4rtrZ8tr9Fga9aqry8AF15
        Xr4FkF4UW34jkFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
        n2kIc2xKxwCY02Avz4vE14v_Xr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
        0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
        17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
        C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUjHGQDUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update .../zh_CN/vm/* to 5.19-rc1.

Yanteng Si (3):
  docs/zh_CN: Update the translation of highmem to 5.19-rc1
  docs/zh_CN: Update the translation of page_owner to 5.19-rc1
  docs/zh_CN: Update the translation of vm index to 5.19-rc1

 .../translations/zh_CN/vm/bootmem.rst         | 13 ++++
 .../translations/zh_CN/vm/highmem.rst         | 77 +++++++++++--------
 Documentation/translations/zh_CN/vm/index.rst | 39 ++++++++--
 Documentation/translations/zh_CN/vm/oom.rst   | 13 ++++
 .../translations/zh_CN/vm/page_allocation.rst | 13 ++++
 .../translations/zh_CN/vm/page_cache.rst      | 13 ++++
 .../translations/zh_CN/vm/page_owner.rst      | 70 +++++++++++++++--
 .../translations/zh_CN/vm/page_reclaim.rst    | 13 ++++
 .../translations/zh_CN/vm/page_tables.rst     | 13 ++++
 .../translations/zh_CN/vm/physical_memory.rst | 13 ++++
 .../translations/zh_CN/vm/process_addrs.rst   | 13 ++++
 Documentation/translations/zh_CN/vm/shmfs.rst | 13 ++++
 Documentation/translations/zh_CN/vm/swap.rst  | 13 ++++
 .../translations/zh_CN/vm/vmalloc.rst         | 13 ++++
 14 files changed, 282 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/bootmem.rst
 create mode 100644 Documentation/translations/zh_CN/vm/oom.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_allocation.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_cache.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_reclaim.rst
 create mode 100644 Documentation/translations/zh_CN/vm/page_tables.rst
 create mode 100644 Documentation/translations/zh_CN/vm/physical_memory.rst
 create mode 100644 Documentation/translations/zh_CN/vm/process_addrs.rst
 create mode 100644 Documentation/translations/zh_CN/vm/shmfs.rst
 create mode 100644 Documentation/translations/zh_CN/vm/swap.rst
 create mode 100644 Documentation/translations/zh_CN/vm/vmalloc.rst

-- 
2.27.0

