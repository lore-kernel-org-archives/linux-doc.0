Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B06DC43334
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 10:19:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbiFVKT6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbiFVKT4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 06:19:56 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2EC7E338B7
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 03:19:53 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL03G7LJinBFUAA--.27983S2;
        Wed, 22 Jun 2022 18:19:51 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 9/9] docs/zh_CN: core-api: Update the translation of xarray.rst to 5.19-rc3
Date:   Wed, 22 Jun 2022 18:19:49 +0800
Message-Id: <b7d5f3ca914667ec14ba35a7c0db3ec3506e670d.1655863769.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655863769.git.zhoubinbin@loongson.cn>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxL03G7LJinBFUAA--.27983S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWkKF43CrW5KryUCrWfZrb_yoW8Cw15pF
        97Kryxt3ZrZryj9rnrWry8KF17CFWSgw4Uua97J3ZaqF1DJayFyrs0yF9rtrZ2qryIvay2
        vr4Syry8Xa1jkrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4D
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r
        1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1I6r4UMIIF0xvE
        x4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUpwZcUUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Synchronous translation from upstream commit ac23d1a96460
("XArray: Document the locking requirement for the xa_state")

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 Documentation/translations/zh_CN/core-api/xarray.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/core-api/xarray.rst b/Documentation/translations/zh_CN/core-api/xarray.rst
index ff2d9bcb7c34..fb19324966ce 100644
--- a/Documentation/translations/zh_CN/core-api/xarray.rst
+++ b/Documentation/translations/zh_CN/core-api/xarray.rst
@@ -6,6 +6,7 @@
 :翻译:
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
 
 :校译:
 
@@ -254,7 +255,8 @@ __xa_set_mark() 和 __xa_clear_mark() 函数也适用于你查找一个条目并
 
 高级API是基于xa_state的。这是一个不透明的数据结构，你使用XA_STATE()宏在堆栈中声明。这个宏初始化了
 xa_state，准备开始在XArray上移动。它被用作一个游标来保持在XArray中的位置，并让你把各种操作组合在一
-起，而不必每次都从头开始。
+起，而不必每次都从头开始。xa_state的内容受rcu_read_lock()或xas_lock()的保护。如果需要删除保护状态
+和树的这些锁中的任何一个，你必须调用xas_pause()以便将来的调用不会依赖于状态中未受保护的部分。
 
 xa_state也被用来存储错误(store errors)。你可以调用xas_error()来检索错误。所有的操作在进行之前都
 会检查xa_state是否处于错误状态，所以你没有必要在每次调用之后检查错误；你可以连续进行多次调用，只在
-- 
2.20.1

