Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A621C4167B
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 03:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiLJD0J (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 22:26:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiLJD0I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 22:26:08 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D256125EAF
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 19:26:07 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8Cx7+tO_JNjM5gEAA--.10750S3;
        Sat, 10 Dec 2022 11:26:06 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxr+BM_JNjw_IpAA--.37698S4;
        Sat, 10 Dec 2022 11:26:06 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 09/13] docs/zh_CN: Update the translation of start to 6.1-rc8
Date:   Sat, 10 Dec 2022 11:26:36 +0800
Message-Id: <166422a66dd1985f8da9fa9f2ef7bfd57439923f.1670642548.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1670642548.git.siyanteng@loongson.cn>
References: <cover.1670642548.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxr+BM_JNjw_IpAA--.37698S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Kw4xJr43AFWrGF1UCFW7urg_yoW8Xw45pa
        s29ryIga17AFy5AryUCF1rAF1xtFZ7Xa17Ja4xZ3WFkrnYyw1ktr4UKrWrGr9rWrWxAFWa
        9FsYyry8ZFy2y3DanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        b-8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
        M2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
        CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2
        z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC2
        0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
        0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv2
        0xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU
        0xZFpf9x07jxSdgUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Update to commit 04cc7e4bf7c4 ("Docs/admin-guide/mm/damon/start:
mention the dependency as sysfs instead of debugfs")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
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

