Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36BEC43334
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 09:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234456AbiGYJUc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 05:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234054AbiGYJUb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 05:20:31 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 102AA62C2
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 02:20:28 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9JPYN5igls2AA--.13314S2;
        Mon, 25 Jul 2022 17:20:17 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: [PATCH 0/8] Docs/zh_CN: Update some translation to 5.19-rc8
Date:   Mon, 25 Jul 2022 17:20:45 +0800
Message-Id: <cover.1658740151.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9JPYN5igls2AA--.13314S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr13Wry8JFW3XFykAr48tFb_yoWkArc_ua
        4kZanrAwsrXryftr4xWr13uw4rCayjg34UtFs8ta98Gws8Gr4DZF1UXFsYgF45WFsxAFW7
        GrWxWr1Svr1SgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbVkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
        n2IY04v7MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUjMmh5UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update the following Chinese documents to 5.19-rc8:

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

