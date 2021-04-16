Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33EFC433ED
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 07:47:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A81961166
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 07:47:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235012AbhDPHr0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 03:47:26 -0400
Received: from m32-153.88.com ([43.250.32.153]:32835 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231898AbhDPHrZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Apr 2021 03:47:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=dETmhxAw0WMadU935WGR5JGBgG16DsEAcOk5R
        tWBoMQ=; b=Dx2p6VXSJfNMK0AgHQUC0dHfPNiQESazqOPZv/xEfgDuVrDWf6zKX
        KkdkmCDhuQPFN7DF8xhRoj5WiKxd7PLzV0t0ahdd3T+3CbRB+63sVllvoTPmoGTW
        mYOw9J0F6SjnY71s57I2QlSraEtecnoBI4lAOjTxvh9UuLjhx77tKY=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCnMiPuQHlgokZzAA--.8231S2;
        Fri, 16 Apr 2021 15:46:56 +0800 (CST)
Date:   Fri, 16 Apr 2021 15:46:54 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huang JiangHui <huangjianghui@uniontech.com>,
        Bailu Lin <bailu.lin@vivo.com>, linux-doc@vger.kernel.org
Subject: [PATCH] docs/zh_CN: Adjust order and content of zh_CN/index.rst
Message-ID: <20210416074652.GA6138@bobwxc.top>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCnMiPuQHlgokZzAA--.8231S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXryDGF18WFW3CrW8uryfWFg_yoW7JF13pF
        s3JrWfKF1UXF1jyr97GF17Wr1rGa10kr17J3y5ta40gr18AF1ktr1aqF1rJ345XrWrZa4D
        ZFn8Gr1UZw17ArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUg2b7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02Avz4vE14v_GF4l42xK82
        IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8
        JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1V
        AFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4
        A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI
        43ZEXa7IUntxhJUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adjust order and content of zh_CN/index.rst to make it clear,
Complete introductions and TODOLists.

Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
docs-next tree
base-commit: f9bbc12ccb35ac8b3fa01cec1a19cb523a7707c7

 Documentation/translations/zh_CN/index.rst | 168 +++++++++++++++++++++++++++--
 1 file changed, 159 insertions(+), 9 deletions(-)

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 2c154e18b37d..868efe11bb9d 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -1,34 +1,184 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. raw:: latex
 
 	\renewcommand\thesection*
 	\renewcommand\thesubsection*
 
+.. _linux_doc_zh:
+
 中文翻译
 ========
 
-这些手册包含有关如何开发内核的整体信息。内核社区非常庞大，一年下来有数千名开发
-人员做出贡献。 与任何大型社区一样，知道如何完成任务将使得更改合并的过程变得更
-加容易。
 
-翻译计划:
-内核中文文档欢迎任何翻译投稿，特别是关于内核用户和管理员指南部分。
+.. note::
+
+   **翻译计划:**
+   内核中文文档欢迎任何翻译投稿，特别是关于内核用户和管理员指南部分。
+
+许可证文档
+----------
+
+下面的文档介绍了Linux内核源代码的许可证（GPLv2）、如何在源代码树中正确标记
+单个文件的许可证、以及指向完整许可证文本的链接。
+
+* Documentation/translations/zh_CN/process/license-rules.rst
+
+用户文档
+--------
+
+下面的手册是为内核用户编写的——即那些试图让它在给定系统上以最佳方式工作的
+用户。
 
 .. toctree::
    :maxdepth: 2
 
    admin-guide/index
+
+TODOList:
+
+* kbuild/index
+
+固件相关文档
+------------
+
+下列文档描述了内核需要的平台固件相关信息。
+
+TODOList:
+
+* firmware-guide/index
+* devicetree/index
+
+应用程序开发人员文档
+--------------------
+
+用户空间API手册涵盖了描述应用程序开发人员可见内核接口方面的文档。
+
+TODOlist:
+
+* userspace-api/index
+
+内核开发简介
+------------
+
+这些手册包含有关如何开发内核的整体信息。内核社区非常庞大，一年下来有数千名
+开发人员做出贡献。与任何大型社区一样，知道如何完成任务将使得更改合并的过程
+变得更加容易。
+
+.. toctree::
+   :maxdepth: 2
+
    process/index
    dev-tools/index
    doc-guide/index
    kernel-hacking/index
-   filesystems/index
-   arm64/index
-   sound/index
+
+TODOList:
+
+* trace/index
+* maintainer/index
+* fault-injection/index
+* livepatch/index
+* rust/index
+
+内核API文档
+-----------
+
+以下手册从内核开发人员的角度详细介绍了特定的内核子系统是如何工作的。这里的
+大部分信息都是直接从内核源代码获取的，并根据需要添加补充材料（或者至少是在
+我们设法添加的时候——可能不是所有的都是有需要的）。
+
+.. toctree::
+   :maxdepth: 2
+
    cpu-freq/index
-   mips/index
    iio/index
+   sound/index
+   filesystems/index
+
+TODOList:
+
+* driver-api/index
+* core-api/index
+* locking/index
+* accounting/index
+* block/index
+* cdrom/index
+* ide/index
+* fb/index
+* fpga/index
+* hid/index
+* i2c/index
+* isdn/index
+* infiniband/index
+* leds/index
+* netlabel/index
+* networking/index
+* pcmcia/index
+* power/index
+* target/index
+* timers/index
+* spi/index
+* w1/index
+* watchdog/index
+* virt/index
+* input/index
+* hwmon/index
+* gpu/index
+* security/index
+* crypto/index
+* vm/index
+* bpf/index
+* usb/index
+* PCI/index
+* scsi/index
+* misc-devices/index
+* scheduler/index
+* mhi/index
+
+体系结构无关文档
+----------------
+
+TODOList:
+
+* asm-annotations
+
+特定体系结构文档
+----------------
+
+.. toctree::
+   :maxdepth: 2
+
+   mips/index
+   arm64/index
    riscv/index
 
+TODOList:
+
+* arm/index
+* ia64/index
+* m68k/index
+* nios2/index
+* openrisc/index
+* parisc/index
+* powerpc/index
+* s390/index
+* sh/index
+* sparc/index
+* x86/index
+* xtensa/index
+
+其他文档
+--------
+
+有几份未排序的文档似乎不适合放在文档的其他部分，或者可能需要进行一些调整和/或
+转换为reStructureText格式，也有可能太旧。
+
+TODOList:
+
+* staging/index
+* watch_queue
+
 目录和表格
 ----------
 

-- 
2.11.0

