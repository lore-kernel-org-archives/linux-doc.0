Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B186C433EF
	for <linux-doc@archiver.kernel.org>; Sun, 24 Apr 2022 10:10:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238953AbiDXKNI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Apr 2022 06:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237417AbiDXKNI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Apr 2022 06:13:08 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 83C53DEF7
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 03:10:07 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.130])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxHxD6IWVi03wvAA--.33060S2;
        Sun, 24 Apr 2022 18:10:03 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 0/2] docs/zh_CN: add hmm and numa translation
Date:   Sun, 24 Apr 2022 18:10:48 +0800
Message-Id: <cover.1650794774.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxHxD6IWVi03wvAA--.33060S2
X-Coremail-Antispam: 1UD129KBjvdXoWrCF17Cr18Ww13XFy7XF4Utwb_yoWxWrc_ua
        1kXFWFyF47AFyktFW0kr47JrWjkFs5K348JF1Dtay5Ga9rurWDK34qqwnY9a15XF4Uury5
        GrWkXryfJrsFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbc8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8twCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
* Pick Alex's Reviewed-by tag.
* Modify some word under Alex's advice.

v1:
* Translate .../vm/hmm.rst and .../vm/numa.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add vm hmm translation
  docs/zh_CN: add vm numa translation

 Documentation/translations/zh_CN/vm/hmm.rst   | 361 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |   4 +-
 Documentation/translations/zh_CN/vm/numa.rst  | 101 +++++
 3 files changed, 464 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/hmm.rst
 create mode 100644 Documentation/translations/zh_CN/vm/numa.rst

-- 
2.27.0

