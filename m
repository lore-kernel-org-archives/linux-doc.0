Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4012DC43217
	for <linux-doc@archiver.kernel.org>; Sun, 16 Oct 2022 07:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiJPHZi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 Oct 2022 03:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiJPHZg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 Oct 2022 03:25:36 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 420A332D8E
        for <linux-doc@vger.kernel.org>; Sun, 16 Oct 2022 00:25:34 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPGvpsUtjHfMvAA--.43218S2;
        Sun, 16 Oct 2022 15:25:30 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/3] docs/zh_CN: core-api: Add some translations for the "Data structures" section(Part 2)
Date:   Sun, 16 Oct 2022 15:23:55 +0800
Message-Id: <cover.1665130536.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPGvpsUtjHfMvAA--.43218S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xw1ktw15XrWfAw1ktFy8Grg_yoWkuFg_ua
        4kJFW0y3WxAF1xKFWrGw1UJryUuF4Fg3sYgF45ta9rArWUZrWDG39rXr95urW3Za1DArZx
        Ga97WrySvrnrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbc8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
        Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
        WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4x
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYMKZDUUUU
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
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

So far, the docs for the "Data structures and low-level utilities"
section of core-api has been fully translated.

Thanks.

Binbin Zhou (3):
  docs/zh_CN: core-api: Add this_cpu_ops Chinese translation
  docs/zh_CN: core-api: Add timekeeping Chinese translation
  docs/zh_CN: core-api: Add errseq Chinese translation

 .../translations/zh_CN/core-api/errseq.rst    | 141 +++++++++
 .../translations/zh_CN/core-api/index.rst     |   5 -
 .../zh_CN/core-api/this_cpu_ops.rst           | 281 ++++++++++++++++++
 .../zh_CN/core-api/timekeeping.rst            | 172 +++++++++++
 4 files changed, 594 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/errseq.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/timekeeping.rst

-- 
2.31.1

