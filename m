Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A674C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 19 Oct 2022 10:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbiJSKEP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Oct 2022 06:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234408AbiJSKDo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 06:03:44 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7679AF53DB
        for <linux-doc@vger.kernel.org>; Wed, 19 Oct 2022 02:41:43 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8AxDdmXxE9jMbQAAA--.3705S3;
        Wed, 19 Oct 2022 17:34:15 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTuCVxE9jJD0BAA--.5274S2;
        Wed, 19 Oct 2022 17:34:13 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 0/3] docs/zh_CN: core-api: Add some translations for the "Data structures" section(Part 2)
Date:   Wed, 19 Oct 2022 17:32:34 +0800
Message-Id: <cover.1666171735.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxTuCVxE9jJD0BAA--.5274S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ZFyDWFy7Wr1kWr1xGF4kZwb_yoW8GF45pF
        ZFkr1fGFnrCF17Cws3WrZrAF15AayxW3yYg34xXw1SvF45JF1rtrsYyryagFWUZryvqF1F
        vrs3Kr98u34jyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
        IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
        McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
        0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1EksDUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi all:

As a continuation of the previous patchset
(https://lore.kernel.org/all/cover.1660881950.git.zhoubinbin@loongson.cn/),
this patchset contains the Chinese translations of the remaining three files.

As follows:

this_cpu_ops.rst
timekeeping.rst
errseq.rst

So far, the docs for section "Data structures and low-level utilities" of
the core-api has been translated completely.

Thanks.

Changes since V1:
- Take Xiangcheng's advices, thanks.

Details: 
https://lore.kernel.org/all/Y0wsWoI+BXXCuRbF@bobwxc.mipc/
https://lore.kernel.org/all/Y02EcgD3E0%2FlML5H@bobwxc.mipc/

Binbin Zhou (3):
  docs/zh_CN: core-api: Add this_cpu_ops Chinese translation
  docs/zh_CN: core-api: Add timekeeping Chinese translation
  docs/zh_CN: core-api: Add errseq Chinese translation

 .../translations/zh_CN/core-api/errseq.rst    | 145 +++++++++
 .../translations/zh_CN/core-api/index.rst     |   5 -
 .../zh_CN/core-api/this_cpu_ops.rst           | 285 ++++++++++++++++++
 .../zh_CN/core-api/timekeeping.rst            | 177 +++++++++++
 4 files changed, 607 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/errseq.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/timekeeping.rst

-- 
2.31.1

