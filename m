Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABFCC4332F
	for <linux-doc@archiver.kernel.org>; Thu,  8 Dec 2022 12:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiLHM6l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Dec 2022 07:58:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbiLHM6k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Dec 2022 07:58:40 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 87C018138B
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 04:58:38 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8CxpfB935Fj0xwEAA--.9336S3;
        Thu, 08 Dec 2022 20:58:37 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxj+B735FjMRUoAA--.32265S3;
        Thu, 08 Dec 2022 20:58:36 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v1 09/13] docs/zh_CN: Update the translation of start to 6.1-rc8
Date:   Thu,  8 Dec 2022 20:59:11 +0800
Message-Id: <a357bd0a1e042b3ac11351de0bc5272b1681d151.1670502763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670502763.git.siyanteng@loongson.cn>
References: <cover.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxj+B735FjMRUoAA--.32265S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kw4xJr43AFW7Aw43XrWxCrg_yoW8XF48pa
        sa9ryIga17AFy5A34UCF1rAF1xtFZ7Za15Ga4xZ3ZYkFnYyw1ktr4UK3yrGr9xWrWfCFWa
        9FZYyry8ZFy2k3DanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        ba8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
        w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Wrv_ZF1lYx0Ex4A2
        jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2Iq
        xVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r
        1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY
        6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
        AFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
        Xa7IU02ZX5UUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 04cc7e4bf7c4 ("Docs/admin-guide/mm/damon/start:
mention the dependency as sysfs instead of debugfs")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/admin-guide/mm/damon/start.rst             | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
index 67d1b49481dc..bf21ff84f396 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
@@ -34,16 +34,8 @@
 https://github.com/awslabs/damo找到。下面的例子假设DAMO在你的$PATH上。当然，但
 这并不是强制性的。
 
-因为DAMO使用的是DAMON的debugfs接口(详情请参考 :doc:`usage` 中的使用方法) 你应该
-确保debugfs被挂载。手动挂载它，如下所示::
-
-    # mount -t debugfs none /sys/kernel/debug/
-
-或者在你的 ``/etc/fstab`` 文件中添加以下一行，这样你的系统就可以在启动时自动挂载
-debugfs了::
-
-    debugfs /sys/kernel/debug debugfs defaults 0 0
-
+因为DAMO使用了DAMON的sysfs接口（详情请参考:doc:`usage`），你应该确保
+:doc:`sysfs </filesystems/sysfs>` 被挂载。
 
 记录数据访问模式
 ================
-- 
2.31.1

