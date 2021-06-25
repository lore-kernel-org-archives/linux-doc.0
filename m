Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E527BC49EB7
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 09:12:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC83261427
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 09:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhFYJOz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Jun 2021 05:14:55 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33798 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230449AbhFYJOz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 25 Jun 2021 05:14:55 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP0L4ndVgVckXAA--.6297S4;
        Fri, 25 Jun 2021 17:12:27 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v5 2/2] docs/zh_CN: add core api protection keys translation
Date:   Fri, 25 Jun 2021 17:13:23 +0800
Message-Id: <8f40d153a5ef2d65ecb2324060d0c0caa2b8216f.1624612063.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1624612063.git.siyanteng@loongson.cn>
References: <cover.1624612063.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP0L4ndVgVckXAA--.6297S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtr15Jry7Kw1xAF1Dtw1DWrg_yoW7GFyDpF
        n3K3s7K3yIyFyjkrWF9r17CF15JayxC3W3Kw4xG3WUZFn8JasYyr47KryYgry7CrWvyFyU
        ZF4fCrW0v3s0ywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfUjoGQDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/protection-keys.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../zh_CN/core-api/protection-keys.rst        | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/protection-keys.rst

diff --git a/Documentation/translations/zh_CN/core-api/protection-keys.rst b/Documentation/translations/zh_CN/core-api/protection-keys.rst
new file mode 100644
index 000000000000..d07830050153
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/protection-keys.rst
@@ -0,0 +1,99 @@
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
+ 吴想成 Wu XiangCheng <bobwxc@email.cn>
+
+.. _cn_core-api_protection-keys:
+
+============
+内存保护密钥
+============
+
+用户空间的内存保护密钥（Memory Protection Keys for Userspace，PKU，亦
+即PKEYs）是英特尔Skylake（及以后）“可扩展处理器”服务器CPU上的一项功能。
+它将在未来的非服务器英特尔处理器和未来的AMD处理器中可用。
+
+对于任何希望测试或使用该功能的人来说，它在亚马逊的EC2 C5实例中是可用的，
+并且已知可以在那里使用Ubuntu 17.04镜像运行。
+
+内存保护密钥提供了一种机制来执行基于页面的保护，但在应用程序改变保护域
+时不需要修改页表。它的工作原理是在每个页表项中为“保护密钥”分配4个以
+前被忽略的位，从而提供16个可能的密钥。
+
+还有一个新的用户可访问寄存器（PKRU），为每个密钥提供两个单独的位（访
+问禁止和写入禁止）。作为一个CPU寄存器，PKRU在本质上是线程本地的，可能
+会给每个线程提供一套不同于其他线程的保护措施。
+
+有两条新指令（RDPKRU/WRPKRU）用于读取和写入新的寄存器。该功能仅在64位
+模式下可用，尽管物理地址扩展页表中理论上有空间。这些权限只在数据访问上
+强制执行，对指令获取没有影响。
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
+内核试图使保护密钥与普通的mprotect()的行为一致。例如，如果你这样做::
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

