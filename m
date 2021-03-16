Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B438CC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 16 Mar 2021 15:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76C22650F4
	for <linux-doc@archiver.kernel.org>; Tue, 16 Mar 2021 15:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234116AbhCPPlS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Mar 2021 11:41:18 -0400
Received: from m32-153.88.com ([43.250.32.153]:32984 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232563AbhCPPk4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Mar 2021 11:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=d9wL5rItbrjDC/aWcjm2LnfUDqnhV0PrIbKMv
        jCkPk4=; b=Bz2eu4kHeuFP0Qqbdo9jinLU7ff7PSNkWkt8BI1JinlyKxn3CznRB
        mJHlco+4W8Ds0XtOjMkXMtAXCDFOiO6uR/xKcDKWxjIwW46M8SIckCZ6DGQK8fmN
        00TtQG+LHJAJltFSsF68wGdM8MgriRllu4Kwi0ONLaLejod5rNBbCE=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCnMiN80VBgJ2swAA--.54950S2;
        Tue, 16 Mar 2021 23:40:45 +0800 (CST)
Date:   Tue, 16 Mar 2021 23:40:44 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 1/2] docs/zh_CN: Add zh_CN/admin-guide/bug-bisect.rst
Message-ID: <b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCnMiN80VBgJ2swAA--.54950S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF1DJFWfCry7Gw45CF1ftFb_yoWrWw15pF
        yDKryIkF1fJF98Cw43ur1xK3WayrWxAw4fWw4xZw1kArn5JF4qvr4Utry3X393urWrAFy5
        XFW5tr98uryjy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW5WwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
        UjIFyTuYvjxU04SrUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add translation zh_CN/admin-guide/bug-bisect.rst, and link it to
zh_CN/admin-guide/index.rst while clean its todo entry.

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
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

