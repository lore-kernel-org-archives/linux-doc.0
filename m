Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84838C04AA5
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 12:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235730AbiHYMx4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 08:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234565AbiHYMxz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 08:53:55 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CFB4A58092
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 05:53:54 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx32vScAdjy8cJAA--.38198S2;
        Thu, 25 Aug 2022 20:53:39 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        xiyou.wangcong@gmail.com, hidave.darkstar@gmail.com,
        tekkamanninja@gmail.com, leoyang.li@nxp.com, src.res@email.cn,
        linux-doc-tw-discuss@lists.sourceforge.net
Subject: [PATCH v1 0/3] docs: zh_CN/TW: Update and remove some old documents
Date:   Thu, 25 Aug 2022 20:53:24 +0800
Message-Id: <cover.1661431365.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx32vScAdjy8cJAA--.38198S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKry3Jw4DWFWDJF4fKrWfKrg_yoWktrgEvF
        ykXFW0ya47Grn7Kr48GF17JF17CF48Kw18JF15ta90qrZFk39rWw1qqa93ZFWrXF4UAr98
        GFZ7Wr1rXrn7AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
        n2IY04v7MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUDWrXUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v1:
 Update the translation of io_ordering to 6.0-rc2.
 Remove IRQ(Only zh_CN) and oops-tracing, Because they already have a new translation.
 In this way, zh_CN no longer has homeless documents. >_<

Yanteng Si (3):
  docs/zh_CN: Update the translation of io_ordering to 6.0-rc2
  docs/zh_CN: Remove IRQ and oops-tracing
  docs/zh_TW: Remove oops-tracing

 Documentation/translations/zh_CN/IRQ.txt      |  39 ----
 .../translations/zh_CN/driver-api/index.rst   |   2 +-
 .../zh_CN/driver-api/io_ordering.rst          |  60 +++++
 .../translations/zh_CN/io_ordering.txt        |  67 ------
 .../translations/zh_CN/oops-tracing.txt       | 212 ------------------
 .../translations/zh_TW/oops-tracing.txt       | 212 ------------------
 6 files changed, 61 insertions(+), 531 deletions(-)
 delete mode 100644 Documentation/translations/zh_CN/IRQ.txt
 create mode 100644 Documentation/translations/zh_CN/driver-api/io_ordering.rst
 delete mode 100644 Documentation/translations/zh_CN/io_ordering.txt
 delete mode 100644 Documentation/translations/zh_CN/oops-tracing.txt
 delete mode 100644 Documentation/translations/zh_TW/oops-tracing.txt

-- 
2.31.1

