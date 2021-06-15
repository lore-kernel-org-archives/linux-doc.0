Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFAE6C48BE8
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 07:52:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D359261419
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 07:52:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhFOHyT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 03:54:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46212 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230392AbhFOHyR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 Jun 2021 03:54:17 -0400
Received: from localhost.localdomain (unknown [223.106.58.132])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb0MlXMhgEIYRAA--.22883S4;
        Tue, 15 Jun 2021 15:52:09 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 2/2] docs/zh_CN: add core api protection keys translation
Date:   Tue, 15 Jun 2021 15:52:40 +0800
Message-Id: <6cf9d7c35867d303ba4e66169f3ed1c9d5399e8e.1623743265.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1623743265.git.siyanteng@loongson.cn>
References: <cover.1623743265.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb0MlXMhgEIYRAA--.22883S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyxuF4kAryxWw45Kry3urg_yoWrKw4rpF
        n3K3s3K3yIyFyjkryF9r17uF15JayxC3W3Kw4xGa43Z3Z5JasYyr42gryY9ry3CryqyFyk
        ZF4fGrW0vr90ywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
        6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
        Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
        Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
        IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPUUUUU
        =
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/protection-keys.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/core-api/protection-keys.rst        | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/protection-keys.rst

diff --git a/Documentation/translations/zh_CN/core-api/protection-keys.rst b/Documentation/translations/zh_CN/core-api/protection-keys.rst
new file mode 100644
index 000000000000..91a282b9a576
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/protection-keys.rst
@@ -0,0 +1,98 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/protection-keys.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+.. _cn_core-api_protection-keys:
+
+============
+内存保护密钥
+============
+
+用户空间的内存保护密钥（PKU，又称PKEYs）是英特尔Skylake（及以后）"可扩
+展处理器 "服务器CPU上的一项功能。它将在未来的非服务器英特尔处理器和未来
+的AMD处理器中使用。
+
+对于任何希望测试或使用该功能的人来说，它在亚马逊的EC2 C5实例中是可用的，
+并且已知可以在那里使用Ubuntu 17.04镜像运行。
+
+内存保护密钥提供了一种机制来执行基于页面的保护，但在应用程序改变保护域
+时不需要修改页表。它的工作原理是在每个页表项中为 "保护密钥 "分配4个以
+前被忽略的位，从而提供16个可能的密钥。
+
+还有一个新的用户可访问的寄存器（PKRU），为每个密钥提供两个单独的位（访
+问禁止和写入禁止）。作为一个CPU寄存器，PKRU在本质上是线程本地的，可能
+会给每个线程提供一套不同于其他线程的保护措施。
+
+有两条新指令（RDPKRU/WRPKRU）用于读取和写入新的寄存器。该功能仅在64位
+模式下可用，尽管PAE PTEs中理论上有空间。这些权限只在数据访问上强制执行，
+对指令获取没有影响。
+
+
+系统调用
+========
+
+有3个系统调用可以直接与pkeys进行交互::
+
+	int pkey_alloc(unsigned long flags, unsigned long init_access_rights)
+	int pkey_free(int pkey);
+	int pkey_mprotect(unsigned long start, size_t len,
+			  unsigned long prot, int pkey);
+
+在使用一个pkey之前，必须先用pkey_alloc()分配它。一个应用程序直接调用
+WRPKRU指令，以改变一个密钥覆盖的内存的访问权限。在这个例子中，WRPKRU
+被一个叫做pkey_set()的C函数所封装::
+
+	int real_prot = PROT_READ|PROT_WRITE;
+	pkey = pkey_alloc(0, PKEY_DISABLE_WRITE);
+	ptr = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+	ret = pkey_mprotect(ptr, PAGE_SIZE, real_prot, pkey);
+	... application runs here
+
+现在，如果应用程序需要更新'ptr'处的数据，它可以获得访问权，进行更新，
+然后取消其写访问权::
+
+	pkey_set(pkey, 0); // clear PKEY_DISABLE_WRITE
+	*ptr = foo; // assign something
+	pkey_set(pkey, PKEY_DISABLE_WRITE); // set PKEY_DISABLE_WRITE again
+
+现在，当它释放内存时，它也将释放pkey，因为它不再被使用了::
+
+	munmap(ptr, PAGE_SIZE);
+	pkey_free(pkey);
+
+.. note:: pkey_set()是RDPKRU和WRPKRU指令的一个封装器。在tools/testing/selftests/x86/protection_keys.c中可以找到一个实现实例。
+          tools/testing/selftests/x86/protection_keys.c.
+
+行为
+====
+
+内核试图使保护密钥与普通的protect()的行为一致。例如，如果你这样做::
+
+	mprotect(ptr, size, PROT_NONE);
+	something(ptr);
+
+这样做的时候，你可以期待保护密钥的相同效果::
+
+	pkey = pkey_alloc(0, PKEY_DISABLE_WRITE | PKEY_DISABLE_READ);
+	pkey_mprotect(ptr, size, PROT_READ|PROT_WRITE, pkey);
+	something(ptr);
+
+无论something()是否是对'ptr'的直接访问，这都应该为真。
+如::
+
+	*ptr = foo;
+
+或者当内核代表应用程序进行访问时，比如read()::
+
+	read(fd, ptr, 1);
+
+在这两种情况下，内核都会发送一个SIGSEGV，但当违反保护密钥时，si_code
+将被设置为SEGV_PKERR，而当违反普通的mprotect()权限时，则是SEGV_ACCERR。
-- 
2.27.0

