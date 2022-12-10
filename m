Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D96C4332F
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 03:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiLJDYe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 22:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiLJDYd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 22:24:33 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D650925C4B
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 19:24:31 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8BxlfDu+5NjApgEAA--.10331S3;
        Sat, 10 Dec 2022 11:24:30 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxb+Lt+5NjY_IpAA--.37197S2;
        Sat, 10 Dec 2022 11:24:30 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 00/13] docs/zh_CN: Update the translation to 6.1-rc8
Date:   Sat, 10 Dec 2022 11:24:45 +0800
Message-Id: <cover.1670642548.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+Lt+5NjY_IpAA--.37197S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJr17KryUAryrZFWfAw1UKFg_yoW8Cr48pF
        93KFyfX3Z2yFy3uw1fCrWUZF4rXa18J398tw12qwn5tw1vqw4UtFyUJFyag3y2vrWfZF1f
        Ar4rCr4Du34jkw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b28YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
        IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4j6F4U
        McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
Modify some words under Xiangcheng's advice.

v1:
The following files were updated to 6.1-rc8:
accounting
admin-guide/mm
core-api
dev-tools
mm
PCI
power

Yanteng Si (13):
  docs/zh_CN: Update the translation of delay-accounting to 6.1-rc8
  docs/zh_CN: Update the translation of kernel-api to 6.1-rc8
  docs/zh_CN: Update the translation of mm-api to 6.1-rc8
  docs/zh_CN: Update the translation of highmem to 6.1-rc8
  docs/zh_CN: Update the translation of page_owner to 6.1-rc8
  docs/zh_CN: Update the translation of kasan to 6.1-rc8
  docs/zh_CN: Update the translation of testing-overview to 6.1-rc8
  docs/zh_CN: Update the translation of reclaim to 6.1-rc8
  docs/zh_CN: Update the translation of start to 6.1-rc8
  docs/zh_CN: Update the translation of usage to 6.1-rc8
  docs/zh_CN: Update the translation of ksm to 6.1-rc8
  docs/zh_CN: Update the translation of msi-howto to 6.1-rc8
  docs/zh_CN: Update the translation of energy-model to 6.1-rc8

 .../translations/zh_CN/PCI/msi-howto.rst      | 11 +++
 .../zh_CN/accounting/delay-accounting.rst     |  7 +-
 .../zh_CN/admin-guide/mm/damon/reclaim.rst    |  4 -
 .../zh_CN/admin-guide/mm/damon/start.rst      | 12 +--
 .../zh_CN/admin-guide/mm/damon/usage.rst      | 68 ++++++++++++-----
 .../translations/zh_CN/admin-guide/mm/ksm.rst | 50 +++++++++++++
 .../zh_CN/core-api/kernel-api.rst             | 10 ++-
 .../translations/zh_CN/core-api/mm-api.rst    |  2 +-
 .../translations/zh_CN/dev-tools/kasan.rst    | 74 ++++++++++---------
 .../zh_CN/dev-tools/testing-overview.rst      | 27 +++++++
 .../translations/zh_CN/mm/highmem.rst         | 20 ++++-
 .../translations/zh_CN/mm/page_owner.rst      | 17 +----
 .../translations/zh_CN/power/energy-model.rst | 36 +++++++--
 13 files changed, 243 insertions(+), 95 deletions(-)

-- 
2.31.1

