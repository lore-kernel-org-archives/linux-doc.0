Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6FCC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 10:19:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235899AbiFVKTd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 06:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349258AbiFVKTO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 06:19:14 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 539813B57C
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 03:19:04 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxr+aQ7LJiWBFUAA--.27260S5;
        Wed, 22 Jun 2022 18:19:02 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 3/9] docs/zh_CN: core-api: Update the translation of irq/irq-domain.rst to 5.19-rc3
Date:   Wed, 22 Jun 2022 18:18:49 +0800
Message-Id: <eb82606f323c4c25e497a01a060e1e76f18be72f.1655863769.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655863769.git.zhoubinbin@loongson.cn>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxr+aQ7LJiWBFUAA--.27260S5
X-Coremail-Antispam: 1UD129KBjvJXoWxWryUAF45Jw1UWF45Kr1rZwb_yoWrWw48pF
        W2939Igw43Jr1jqrWkWr1UWw13JFy8Ga12van5GF9rXFn8Z3yvkr4qqFy5G3y3Jr9IqrW2
        vF4SgrW8uF1Yka7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw1l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF3kuDUUUU
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Synchronous translation from the following commits(Latest in front):

[1]: commit 0953fb263714("irq: remove handle_domain_{irq,nmi}()")

[2]: commit 0ddc5e55e6f1("Documentation: Fix irq-domain.rst build warning")

[3]: commit 991007ba6cca("Documentation: Update
     irq_domain.rst with new lookup APIs")

[4]: commit 405e94e9aed2("irqdomain: Kill irq_domain_add_legacy_isa")

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../zh_CN/core-api/irq/irq-domain.rst         | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
index 7d077742f758..9174fce12c1b 100644
--- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
@@ -5,6 +5,7 @@
 :翻译:
 
  司延腾 Yanteng Si <siyanteng@loongson.cn>
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
 
 .. _cn_irq-domain.rst:
 
@@ -52,8 +53,18 @@ irq_domain和一个hwirq号作为参数。 如果hwirq的映射还不存在，
 一个新的Linux irq_desc，将其与hwirq关联起来，并调用.map()回调，这样驱动
 程序就可以执行任何必要的硬件设置。
 
-当接收到一个中断时，应该使用irq_find_mapping()函数从hwirq号中找到
-Linux IRQ号。
+一旦建立了映射，可以通过多种方法检索或使用它：
+
+- irq_resolve_mapping()返回一个指向给定域和hwirq号的irq_desc结构指针，
+  如果没有映射则返回NULL。
+
+- irq_find_mapping()返回给定域和hwirq的Linux IRQ号，如果没有映射则返回0。
+
+- irq_linear_revmap()现与irq_find_mapping()相同，已被废弃。
+
+- generic_handle_domain_irq()处理一个由域和hwirq号描述的中断。
+
+请注意，irq域的查找必须发生在与RCU读临界区兼容的上下文中。
 
 在调用irq_find_mapping()之前，至少要调用一次irq_create_mapping()函数，
 以免描述符不能被分配。
@@ -119,7 +130,8 @@ irq_domain_add_tree()和irq_domain_create_tree()在功能上是等价的，除
 Linux IRQ号编入硬件本身，这样就不需要映射了。 调用irq_create_direct_mapping()
 会分配一个Linux IRQ号，并调用.map()回调，这样驱动就可以将Linux IRQ号编入硬件中。
 
-大多数驱动程序不能使用这个映射。
+大多数驱动程序无法使用此映射，现在它由CONFIG_IRQ_DOMAIN_NOMAP选项控制。
+请不要引入此API的新用户。
 
 传统映射类型
 ------------
@@ -128,7 +140,6 @@ Linux IRQ号编入硬件本身，这样就不需要映射了。 调用irq_create
 
 	irq_domain_add_simple()
 	irq_domain_add_legacy()
-	irq_domain_add_legacy_isa()
 	irq_domain_create_simple()
 	irq_domain_create_legacy()
 
@@ -137,6 +148,9 @@ Linux IRQ号编入硬件本身，这样就不需要映射了。 调用irq_create
 一组用于IRQ号的定义（#define），这些定义被传递给struct设备注册。 在这种情况下，
 不能动态分配Linux IRQ号，应该使用传统映射。
 
+顾名思义，\*_legacy()系列函数已被废弃，只是为了方便对古老平台的支持而存在。
+不应该增加新的用户。当\*_simple()系列函数的使用导致遗留行为时，他们也是如此。
+
 传统映射假设已经为控制器分配了一个连续的IRQ号范围，并且可以通过向hwirq号添加一
 个固定的偏移来计算IRQ号，反之亦然。 缺点是需要中断控制器管理IRQ分配，并且需要为每
 个hwirq分配一个irq_desc，即使它没有被使用。
-- 
2.20.1

