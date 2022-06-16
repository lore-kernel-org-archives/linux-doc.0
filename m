Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6104C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jun 2022 07:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359652AbiFPHnq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Jun 2022 03:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359628AbiFPHnn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 03:43:43 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 867685C840
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 00:43:42 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr08o36pipIVFAA--.8884S2;
        Thu, 16 Jun 2022 15:43:37 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn
Subject: [PATCH v3 0/3] docs/zh_CN: Update the translation of vm to 5.19-rc1
Date:   Thu, 16 Jun 2022 15:44:55 +0800
Message-Id: <cover.1655362610.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr08o36pipIVFAA--.8884S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF4kGw4xAF15KFW8Gr1xXwb_yoWxZwc_Za
        ykZFZYyw4jyF93tFW8Kr4fCrWrCrWj9ryjqFn8t3yDJw4Dtr1DXr1kXanYgFn5WF43CFyU
        GrWkCw1ftrnIqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
        42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
        evJa73UjIFyTuYvjfUYMKZDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:
* Remove empty files.
* Add the missing text in v2,and replace space with tab.

v2:
Modify some words under Xiangcheng's advice.
add disclaimer-zh_CN to [PATCH 3/3].

v1:
Update .../zh_CN/vm/* to 5.19-rc1.

Yanteng Si (3):
  docs/zh_CN: Update the translation of highmem to 5.19-rc1
  docs/zh_CN: Update the translation of page_owner to 5.19-rc1
  docs/zh_CN: Update the translation of vm index to 5.19-rc1

 .../translations/zh_CN/vm/highmem.rst         | 77 ++++++++++--------
 Documentation/translations/zh_CN/vm/index.rst | 27 +++++--
 .../translations/zh_CN/vm/page_owner.rst      | 79 ++++++++++++++++---
 3 files changed, 134 insertions(+), 49 deletions(-)

-- 
2.27.0

