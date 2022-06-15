Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4B9C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jun 2022 13:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244100AbiFON2D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jun 2022 09:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243950AbiFON2C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jun 2022 09:28:02 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DE8DC1115A
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 06:27:59 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.64.16.213])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxH+Zd3qliMeZDAA--.6698S2;
        Wed, 15 Jun 2022 21:27:58 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 9/9] docs/zh_CN: core-api: Update the translation of xarray.rst to 5.19-rc2
Date:   Wed, 15 Jun 2022 21:27:56 +0800
Message-Id: <017ad43f42a13b30d725d069497fa7cbc02c2a11.1655258291.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655258291.git.zhoubinbin@loongson.cn>
References: <cover.1655258291.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxH+Zd3qliMeZDAA--.6698S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWkKF43CrW5KryUCrWfZrb_yoW8Cw15pF
        97Kryxt3ZrZryj9rnrWry8KF17CFWSgw4Uua97J3ZaqF1DJayFyrs0yF9rtrZ2qryIvay2
        vr4Syry8Xa1jkrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5GwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUtVW8Zw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2
        jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73Uj
        IFyTuYvjfUefOzUUUUU
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

