Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03587C6FA82
	for <linux-doc@archiver.kernel.org>; Wed, 28 Sep 2022 10:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbiI1Kcq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Sep 2022 06:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbiI1Kcp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 06:32:45 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 44D8E81B29
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 03:32:43 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.220])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPGvCIjRjXkAjAA--.4955S3;
        Wed, 28 Sep 2022 18:32:35 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v1 1/2] docs/zh_CN: Update the translation of ksm to 6.0-rc7
Date:   Wed, 28 Sep 2022 18:31:29 +0800
Message-Id: <60017007349357dc1fd8fa849a5ddb5672f8ab5b.1664360331.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1664360331.git.siyanteng@loongson.cn>
References: <cover.1664360331.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPGvCIjRjXkAjAA--.4955S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww13JF1Uuw4xXF1rZr17Awb_yoW8JFWkpF
        4vk34xGanrW3W8u34UWr1UJFyxJ3Z7Ww47tF1jyw1FqrnYyrWDtFWkKa4IkayxXry8ta98
        ZFsakr909Fyjkr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfU0ksgUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit bc6a2828a963 ("ksm: add the ksm prefix
to the names of the ksm private structures")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/mm/ksm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/mm/ksm.rst b/Documentation/translations/zh_CN/mm/ksm.rst
index d1f82e857ad7..f0f458753d0c 100644
--- a/Documentation/translations/zh_CN/mm/ksm.rst
+++ b/Documentation/translations/zh_CN/mm/ksm.rst
@@ -30,7 +30,7 @@ KSM的用户空间的接口在Documentation/translations/zh_CN/admin-guide/mm/ks
 KSM维护着稳定树中的KSM页的逆映射信息。
 
 当KSM页面的共享数小于 ``max_page_sharing`` 的虚拟内存区域(VMAs)时，则代表了
-KSM页的稳定树其中的节点指向了一个rmap_item结构体类型的列表。同时，这个KSM页
+KSM页的稳定树其中的节点指向了一个ksm_rmap_item结构体类型的列表。同时，这个KSM页
 的 ``page->mapping`` 指向了该稳定树节点。
 
 如果共享数超过了阈值，KSM将给稳定树添加第二个维度。稳定树就变成链接一个或多
-- 
2.31.1

