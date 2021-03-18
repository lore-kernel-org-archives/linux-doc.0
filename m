Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A66AC433DB
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 07:21:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5737F64F0C
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 07:21:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhCRHVY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 03:21:24 -0400
Received: from [43.250.32.171] ([43.250.32.171]:40467 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229512AbhCRHUy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Mar 2021 03:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=t9kxw0tL7CZNx+3PoOExi/za0fSTUr2jsll1J
        wWNVRg=; b=Mt14nifedO3ioQt9zSKlvSL/Mq9qMlEO17B3A7a7zRlCM9fKuYOFE
        0KDwvWNm9rS6iFimcFM1/V/MB1z1pmi9tpSjyKiQKqXqVFvq4Cttm4iEr2ItoGBs
        LOh0CmEq9CxyidC0mODT9+jntKCMYlYErb1YUIh7M5leOgQyE8Md2Q=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgD3atFQ_1JgBT4pAA--.31422S2;
        Thu, 18 Mar 2021 15:20:50 +0800 (CST)
Date:   Thu, 18 Mar 2021 15:20:48 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH v2 6/6] docs/zh_CN: Add zh_CN/admin-guide/init.rst
Message-ID: <cd2fd8d0ea2ad50afc6bd2abe15eba73b6c7940c.1616050069.git.bobwxc@email.cn>
References: <cover.1616050069.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1616050069.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgD3atFQ_1JgBT4pAA--.31422S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF1kKw4UZw1xZr17Ar43Jrb_yoWruF4Upa
        4DKrWfKF1fXFy5Cr4fGryDX3WxCF4xZa43Ka1xK3WrZrn8Jr4vyr47KryayF93WrWFyFW8
        ZFWftry5CrWUAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4xMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjxUjuWlDUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add translation zh_CN/admin-guide/init.rst, and link it to
zh_CN/admin-guide/index.rst while clean its todo entry.

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/admin-guide/index.rst  |  2 +-
 .../translations/zh_CN/admin-guide/init.rst   | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/init.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index a671d16710f3..be835ec8e632 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -40,13 +40,13 @@ Todolist:
    bug-hunting
    bug-bisect
    tainted-kernels
+   init
 
 Todolist:
 
    reporting-bugs
    ramoops
    dynamic-debug-howto
-   init
    kdump/index
    perf/index
 
diff --git a/Documentation/translations/zh_CN/admin-guide/init.rst b/Documentation/translations/zh_CN/admin-guide/init.rst
new file mode 100644
index 000000000000..fbaf6d97f86c
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/init.rst
@@ -0,0 +1,54 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../admin-guide/init`
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+解释“No working init found.”启动挂起消息
+=========================================
+
+:作者:
+
+ Andreas Mohr <andi at lisas period de>
+
+ Cristian Souza <cristianmsbr at gmail period com>
+
+本文档提供了加载初始化二进制（init binary）失败的一些高层级原因（大致按执行
+顺序列出）。
+
+1) **无法挂载根文件系统Unable to mount root FS** ：请设置“debug”内核参数（在
+   引导加载程序bootloader配置文件或CONFIG_CMDLINE）以获取更详细的内核消息。
+
+2) **初始化二进制不存在于根文件系统上init binary doesn't exist on rootfs** ：
+   确保您的根文件系统类型正确（并且 ``root=`` 内核参数指向正确的分区）；拥有
+   所需的驱动程序，例如SCSI或USB等存储硬件；文件系统（ext3、jffs2等）是内建的
+   （或者作为模块由initrd预加载）。
+
+3) **控制台设备损坏Broken console device** ： ``console= setup`` 中可能存在
+   冲突 --> 初始控制台不可用（initial console unavailable）。例如，由于串行
+   IRQ问题（如缺少基于中断的配置）导致的某些串行控制台不可靠。尝试使用不同的
+   ``console= device`` 或像 ``netconsole=`` 。
+
+4) **二进制存在但依赖项不可用Binary exists but dependencies not available** ：
+   例如初始化二进制的必需库依赖项，像 ``/lib/ld-linux.so.2`` 丢失或损坏。使用
+   ``readelf -d <INIT>|grep NEEDED`` 找出需要哪些库。
+
+5) **无法加载二进制Binary cannot be loaded** ：请确保二进制的体系结构与您的
+   硬件匹配。例如i386不匹配x86_64，或者尝试在ARM硬件上加载x86。如果您尝试在
+   此处加载非二进制文件（shell脚本？），您应该确保脚本在其工作头（shebang
+   header）行 ``#!/...`` 中指定能正常工作的解释器（包括其库依赖项）。在处理
+   脚本之前，最好先测试一个简单的非脚本二进制文件，比如 ``/bin/sh`` ，并确认
+   它能成功执行。要了解更多信息，请将代码添加到 ``init/main.c`` 以显示
+   kernel_execve()的返回值。
+
+当您发现新的失败原因时，请扩展本解释（毕竟加载初始化二进制是一个 **关键** 且
+艰难的过渡步骤，需要尽可能无痛地进行），然后向LKML提交一个补丁。
+
+待办事项：
+
+- 通过一个可以存储 ``kernel_execve()`` 结果值的结构体数组实现各种
+  ``run_init_process()`` 调用，并在失败时通过迭代 **所有** 结果来记录一切
+  （非常重要的可用性修复）。
+- 试着使实现本身在一般情况下更有帮助，例如在受影响的地方提供额外的错误消息。
-- 
2.20.1

