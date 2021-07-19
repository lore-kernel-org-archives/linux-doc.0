Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B15C636C9
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 632D26108B
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235691AbhGSJCN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 05:02:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39540 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235309AbhGSJCN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Jul 2021 05:02:13 -0400
Received: from localhost.localdomain (unknown [112.20.113.90])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz0LvSPVghpEhAA--.19840S9;
        Mon, 19 Jul 2021 17:42:45 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 7/8] docs/zh_CN: add virt acrn io-request translation
Date:   Mon, 19 Jul 2021 17:42:54 +0800
Message-Id: <867f233a4120f54019d9340b9ba9fae037cb476c.1626687013.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1626687013.git.siyanteng@loongson.cn>
References: <cover.1626687013.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz0LvSPVghpEhAA--.19840S9
X-Coremail-Antispam: 1UD129KBjvJXoWxtw1rtrW5trykZw4rAF45trb_yoW7CrWrpr
        13JFsxKF1xtF1jyr1UGr1UA3W7JF1fGrW5JFZrJr1xXr1DAr4DKr10qFyFqryUJry0kFyU
        JFy8GF48Ar1UWrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7VUjXAw3UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/virt/acrn/io-request.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/virt/acrn/index.rst    |  3 +-
 .../zh_CN/virt/acrn/io-request.rst            | 99 +++++++++++++++++++
 2 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/virt/acrn/io-request.rst

diff --git a/Documentation/translations/zh_CN/virt/acrn/index.rst b/Documentation/translations/zh_CN/virt/acrn/index.rst
index 1daa0a187a7d..9c8bf5a9417c 100644
--- a/Documentation/translations/zh_CN/virt/acrn/index.rst
+++ b/Documentation/translations/zh_CN/virt/acrn/index.rst
@@ -21,9 +21,10 @@ ACRN管理平台
    :maxdepth: 1
 
    introduction
+   io-request
 
 TODOLIST:
 
 
-   io-request
+
    cpuid
diff --git a/Documentation/translations/zh_CN/virt/acrn/io-request.rst b/Documentation/translations/zh_CN/virt/acrn/io-request.rst
new file mode 100644
index 000000000000..54019be855d5
--- /dev/null
+++ b/Documentation/translations/zh_CN/virt/acrn/io-request.rst
@@ -0,0 +1,99 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: Documentation/virt/acrn/io-request.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_virt_acrn_io-request:
+
+I/O请求处理
+===========
+
+客户虚拟机的I/O请求由管理平台构建，由ACRN管理平台服务模块分发到与I/O请求的地址范
+围相对应的I/O客户端。I/O请求处理的细节将在以下章节描述。
+
+1. I/O请求
+----------
+
+对于每个客户虚拟机，有一个共享的4KB字节的内存区域，用于管理平台和服务虚拟机之间的
+I/O请求通信。一个I/O请求是一个256字节的结构体缓冲区，它是 "acrn_io_request" 结构
+体，当客户虚拟机中发生被困的I/O访问时，由管理平台的I/O处理器填充。服务虚拟机中的
+ACRN用户空间首先分配一个4KB字节的页面，并将缓冲区的GPA（客户物理地址）传递给管理平
+台。缓冲区被用作16个I/O请求槽的数组，每个I/O请求槽为256字节。这个数组是按vCPU ID
+索引的。
+
+2. I/O客户端
+------------
+
+一个I/O客户端负责处理客户虚拟机的I/O请求，其访问的GPA在一定范围内。每个客户虚拟机
+可以关联多个I/O客户端。每个客户虚拟机都有一个特殊的客户端，称为默认客户端，负责处理
+所有不在其他客户端范围内的I/O请求。ACRN用户空间充当每个客户虚拟机的默认客户端。
+
+下面的图示显示了I/O请求共享缓冲区、I/O请求和I/O客户端之间的关系。
+
+::
+
+     +------------------------------------------------------+
+     |                                       服务VM         |
+     |+--------------------------------------------------+  |
+     ||      +----------------------------------------+  |  |
+     ||      | 共享页                 ACRN用户空间    |  |  |
+     ||      |    +-----------------+  +------------+ |  |  |
+     ||   +----+->| acrn_io_request |<-+  默认      | |  |  |
+     ||   |  | |  +-----------------+  | I/O客户端  | |  |  |
+     ||   |  | |  |       ...       |  +------------+ |  |  |
+     ||   |  | |  +-----------------+                 |  |  |
+     ||   |  +-|--------------------------------------+  |  |
+     ||---|----|-----------------------------------------|  |
+     ||   |    |                             内核        |  |
+     ||   |    |            +----------------------+     |  |
+     ||   |    |            | +-------------+  HSM |     |  |
+     ||   |    +--------------+             |      |     |  |
+     ||   |                 | | I/O客户端   |      |     |  |
+     ||   |                 | |             |      |     |  |
+     ||   |                 | +-------------+      |     |  |
+     ||   |                 +----------------------+     |  |
+     |+---|----------------------------------------------+  |
+     +----|-------------------------------------------------+
+          |
+     +----|-------------------------------------------------+
+     |  +-+-----------+                                     |
+     |  | I/O处理     |              ACRN管理平台           |
+     |  +-------------+                                     |
+     +------------------------------------------------------+
+
+3. I/O请求状态转换
+------------------
+
+一个ACRN I/O请求的状态转换如下。
+
+::
+
+   FREE -> PENDING -> PROCESSING -> COMPLETE -> FREE -> ...
+
+- FREE: 这个I/O请求槽是空的
+- PENDING: 在这个槽位上有一个有效的I/O请求正在等待
+- PROCESSING: 正在处理I/O请求
+- COMPLETE: 该I/O请求已被处理
+
+处于COMPLETE或FREE状态的I/O请求是由管理平台拥有的。HSM和ACRN用户空间负责处理其
+他的。
+
+4. I/O请求的处理流程
+--------------------
+
+a. 当客户虚拟机中发生被陷入的I/O访问时，管理平台的I/O处理程序将把I/O请求填充为
+   PENDING状态。
+b. 管理平台向服务虚拟机发出一个向上调用，这是一个通知中断。
+c. upcall处理程序会安排一个工作者来调度I/O请求。
+d. 工作者寻找PENDING I/O请求，根据I/O访问的地址将其分配给不同的注册客户，将其
+   状态更新为PROCESSING，并通知相应的客户进行处理。
+e. 被通知的客户端处理指定的I/O请求。
+f. HSM将I/O请求状态更新为COMPLETE，并通过hypercalls通知管理平台完成。
-- 
2.27.0

