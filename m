Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC02C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 07:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 174CC64F0C
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 07:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhCRHUT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 03:20:19 -0400
Received: from m32-153.88.com ([43.250.32.153]:6354 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229554AbhCRHTv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Mar 2021 03:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=SXzwOyy9W71w8vtH4RMyo2efs0cuKB+pZoC9s
        QZXpFU=; b=Jk9ZQliXL+PwYHRsAsJSlzE+yHDAhP57hdP+nx4bTX39hPfYDSniS
        eTxoE4sfv9+n1spdxci4Lu8F0u137DYkMF5+LfCA2HPwM/EqQDP5XwxJYLRorCiV
        sATPofla/yZ6bSNQ8LMjwYLRWRk/TvJZzo/SljBif68Z6J+kNITUyQ=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBX4iIL_1JgVOwzAA--.62308S2;
        Thu, 18 Mar 2021 15:19:40 +0800 (CST)
Date:   Thu, 18 Mar 2021 15:19:39 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     alex.shi@linux.alibaba.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
Subject: [PATCH v2 2/6] docs/zh_CN: Add zh_CN/admin-guide/bug-bisect.rst
Message-ID: <b9106f76fdc8e20ce4fcd43aec499f00df411610.1616050069.git.bobwxc@email.cn>
References: <cover.1616050069.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1616050069.git.bobwxc@email.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBX4iIL_1JgVOwzAA--.62308S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF1DWr4UZrWfAry3tr4DCFg_yoWrArykpF
        9rKryI9F1fJF98Cw43ur17K3WayrWxAw4fW3yxZw1kArn5JF4qvr4Utry3Xwn3urWrAFy5
        XFW5Jr98uryjy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgIb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4xMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
        0xZFpf9x07UOiSdUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add translation zh_CN/admin-guide/bug-bisect.rst, and link it to
zh_CN/admin-guide/index.rst while clean its todo entry.

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
---
 .../zh_CN/admin-guide/bug-bisect.rst          | 81 +++++++++++++++++++
 .../translations/zh_CN/admin-guide/index.rst  |  2 +-
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/bug-bisect.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/bug-bisect.rst b/Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
new file mode 100644
index 000000000000..662eb5b46e84
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
@@ -0,0 +1,81 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../admin-guide/bug-bisect`
+
+:译者:
+
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+二分（bisect）缺陷
++++++++++++++++++++
+
+（英文版）最后更新：2016年10月28日
+
+引言
+=====
+
+始终尝试由来自kernel.org的源代码构建的最新内核。如果您没有信心这样做，请将
+错误报告给您的发行版供应商，而不是内核开发人员。
+
+找到缺陷（bug）并不总是那么容易，不过仍然得去找。如果你找不到它，不要放弃。
+尽可能多的向相关维护人员报告您发现的信息。请参阅MAINTAINERS文件以了解您所
+关注的子系统的维护人员。
+
+在提交错误报告之前，请阅读“Documentation/admin-guide/reporting-issues.rst”。
+
+设备未出现（Devices not appearing）
+====================================
+
+这通常是由udev/systemd引起的。在将其归咎于内核之前先检查一下。
+
+查找导致缺陷的补丁
+===================
+
+使用 ``git`` 提供的工具可以很容易地找到缺陷，只要缺陷是可复现的。
+
+操作步骤：
+
+- 从git源代码构建内核
+- 以此开始二分 [#f1]_::
+
+	$ git bisect start
+
+- 标记损坏的变更集::
+
+	$ git bisect bad [commit]
+
+- 标记正常工作的变更集::
+
+	$ git bisect good [commit]
+
+- 重新构建内核并测试
+- 使用以下任一与git bisect进行交互::
+
+	$ git bisect good
+
+  或::
+
+	$ git bisect bad
+
+  这取决于您测试的变更集上是否有缺陷
+- 在一些交互之后，git bisect将给出可能导致缺陷的变更集。
+
+- 例如，如果您知道当前版本有问题，而4.8版本是正常的，则可以执行以下操作::
+
+	$ git bisect start
+	$ git bisect bad                 # Current version is bad
+	$ git bisect good v4.8
+
+
+.. [#f1] 您可以（可选地）在开始git bisect的时候提供good或bad参数
+         ``git bisect start [BAD] [GOOD]``
+
+如需进一步参考，请阅读：
+
+- ``git-bisect`` 的手册页
+- `Fighting regressions with git bisect（用git bisect解决回归）
+  <https://www.kernel.org/pub/software/scm/git/docs/git-bisect-lk2009.html>`_
+- `Fully automated bisecting with "git bisect run"（使用git bisect run
+  来全自动二分） <https://lwn.net/Articles/317154>`_
+- `Using Git bisect to figure out when brokenness was introduced
+  （使用Git二分来找出何时引入了错误） <http://webchick.net/node/99>`_
diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index fe2abc3fec86..7dc3540629f0 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -36,13 +36,13 @@ Todolist:
    :maxdepth: 1
 
    reporting-issues
+   bug-bisect
 
 Todolist:
 
    reporting-bugs
    security-bugs
    bug-hunting
-   bug-bisect
    tainted-kernels
    ramoops
    dynamic-debug-howto
-- 
2.20.1

