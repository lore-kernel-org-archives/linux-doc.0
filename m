Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848571;
	b=S7NojWyJ1NMUe7U3TJctLh6d987GOGXqHGNtrzGhqUbKJ9vzoOS+8JJEamSXXnhF+K0D
	 2B9qg9WX9schD8clCaGUlHduuUHIPjVtfefLKG9jmvJNAWlXfDdGeiVtVeK28xQskvLPD
	 cvlgZjwZcAExqjEc3BgY+wIvopOYcObb2NtEgyTzM6+oMcqUaPztYeN369Lh0e459YrUN
	 FQfM7MeBCHKmKHnh9P7FtAc4GL4fK+z6gVnlWvRpB7aqJJFRwD9Z2YCvtcu0x2PkLpheW
	 1nCxZSBGrShyTXmGxFt8fuWf7LEBr0Dzi//ylv1mmytMoxSqssjuWPmxZVK0Ld+N0YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848571;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=TO9t5lXORWX9kcKmBUQq3bCAcaP51RZRP/nl28+fRlE=;
	b=mYIW2fFYhCFZDYhKbnPDPj8vHb711flwt7DwYKJ0Ra4lWZwIXfg+A/4mV14uUCIuwTLf
	 /w/qeMgkrdD001OtKtTLkeae8f+sNMhldf1LzB09+LLwYYKDbafn7wslh2VnGaTXniFJ+
	 jYZ46bHZo3Ip9dZX5ZLoHv9YxIuQRz1Xi/0que95f9zmIvbbKxL5SFc5NzDI1Qpc0ORNe
	 aHeXb19z3DWykMitkTm17B46VPphj2iDSOsDxtUUo3hk6SyhwovM8Ujk0aAAWAyEN9LXx
	 5cW4LXVy7+nMcdEVmEbZ1u7l6AD73yY47kl90J2wjQPZkDPOXTzY4d200ARiMJuhZlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF82606A330;
	Sat, 28 Nov 2026 06:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCF82606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMC2_c54eQprmW0hAA--.61686S2;
	Sat, 28 Nov 2026 14:49:28 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAnsjxseQprphd_AA--.15110S7;
	Sat, 28 Nov 2026 14:49:25 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Weijie Yuan <wy@wyuan.org>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/9] docs/zh_CN: update magic-number to match upstream
Date: Sat, 28 Nov 2026 14:49:12 +0800
Message-ID: <20261128064916.3481435-6-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261128064916.3481435-1-dzm91@hust.edu.cn>
References: <20261128064916.3481435-1-dzm91@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMC2_c54eQprmW0hAA--.61686S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxKrykXF1rXF1rArW8Zw4fKrg_yoWxGw4xpr
	92gr97G3WSyryY9ry7Gr17WF18AF4xGw47K3W8Aw1rtr1kJF4UJrnrKr90yrnagry8AayU
	ZF4rKr4Y9F42vwUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHjb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26F
	4j6r4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2
	xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUrSoGDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Update the Chinese magic-number guide to match its English source.
Move it from process to staging and update the staging index.

Synchronize the translation with upstream revision dd8d4bc28ad7.

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../translations/zh_CN/staging/index.rst      |  6 ++--
 .../{process => staging}/magic-number.rst     | 33 +++++++++----------
 2 files changed, 17 insertions(+), 22 deletions(-)
 rename Documentation/translations/zh_CN/{process => staging}/magic-number.rst (58%)

diff --git a/Documentation/translations/zh_CN/staging/index.rst b/Documentation/translations/zh_CN/staging/index.rst
index 6d68fabce175..896734ade5eb 100644
--- a/Documentation/translations/zh_CN/staging/index.rst
+++ b/Documentation/translations/zh_CN/staging/index.rst
@@ -1,8 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/staging/index.rst
-
 :翻译:
 
  李睿 Rui Li <me@lirui.org>
@@ -13,14 +11,14 @@
 .. toctree::
    :maxdepth: 2
 
+   magic-number
    speculation
    xz
 
-TODOList:
+Todolist:
 
 * crc32
 * lzo
 * remoteproc
 * rpmsg
 * static-keys
-* tee
diff --git a/Documentation/translations/zh_CN/process/magic-number.rst b/Documentation/translations/zh_CN/staging/magic-number.rst
similarity index 58%
rename from Documentation/translations/zh_CN/process/magic-number.rst
rename to Documentation/translations/zh_CN/staging/magic-number.rst
index 05ee75cf4346..e8fdf9a7fbdd 100644
--- a/Documentation/translations/zh_CN/process/magic-number.rst
+++ b/Documentation/translations/zh_CN/staging/magic-number.rst
@@ -1,7 +1,5 @@
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/staging/magic-number.rst
-
 :翻译:
 
  贾威威 Jia Wei Wei <harryxiyou@gmail.com>
@@ -13,13 +11,13 @@
 Linux 魔术数
 ============
 
-这个文件是有关当前使用的魔术值注册表。当你给一个结构体添加了一个魔术值，你也
-应该把这个魔术值添加到这个文件，因为我们最好把用于各种结构体的魔术值统一起来。
+本文档登记当前使用的魔术数。给结构体添加魔术数时，也应将其登记在这里，
+因为不同结构体使用的魔术数最好互不相同。
 
-使用魔术值来保护内核数据结构是一个 **非常好的主意** 。这就允许你在运行时检
-查一个结构体(a)是否已经被攻击，或者(b)你已经给一个例程传递了一个错误的结构
-体。最后一种情况特别地有用---特别是当你通过一个空指针指向结构体的时候。例如，
-tty源码经常通过特定驱动使用这种方法用来反复地排列特定方面的结构体。
+用魔术数保护内核数据结构是一个 **非常好的主意**。这样可以在运行时检查：
+（a）结构体是否被意外覆盖，或（b）是否向函数传入了错误的结构体。后一种情况
+尤其常见于通过 ``void *`` 指针传递结构体指针时。例如，tty 代码经常这样
+在驱动专用结构体和线路规程专用结构体之间传递指针。
 
 使用魔术值的方法是在结构体的开头声明它们，如下::
 
@@ -28,30 +26,29 @@ tty源码经常通过特定驱动使用这种方法用来反复地排列特定
         	...
         };
 
-当你以后给内核添加增强功能的时候，请遵守这条规则！这样就会节省数不清的调试
-时间，特别是一些古怪的情况，例如，数组超出范围并且覆盖写了超出部分。利用这
-个规则，这些情况可以被快速地，安全地检测到这些案例。
+今后扩展内核时，请遵循这一做法！它能节省大量调试时间，尤其是在数组越界并
+覆盖后续结构体等难以排查的情况下。使用魔术数可以快速、安全地发现这些问题。
 
 变更日志::
 
 					Theodore Ts'o
 					31 Mar 94
 
-  给当前的Linux 2.1.55添加魔术表。
+  此魔术数表已更新至 Linux 2.1.55。
 
 					Michael Chastain
 					<mailto:mec@shout.net>
 					22 Sep 1997
 
-  现在应该最新的Linux 2.1.112.因为在特性冻结期间，不能在2.2.x前改变任
-  何东西。这些条目被数域所排序。
+  此表现在应已更新至 Linux 2.1.112。由于目前处于功能冻结期，在 2.2.x
+  发布前不太可能再发生变化。条目按数值字段排序。
 
 					Krzysztof G.Baranowski
 					<mailto: kgb@knm.org.pl>
 					29 Jul 1998
 
-  更新魔术表到Linux 2.5.45。刚好越过特性冻结，但是有可能还会有一些新的魔
-  术值在2.6.x之前融入到内核中。
+  将魔术数表更新至 Linux 2.5.45。虽然刚进入功能冻结期，2.6.x 发布前
+  仍可能有新的魔术数进入内核。
 
 					Petr Baudis
 					<pasky@ucw.cz>
@@ -66,10 +63,10 @@ tty源码经常通过特定驱动使用这种方法用来反复地排列特定
 ===================== ================ ======================== ==========================================
 魔术数名              数字             结构                     文件
 ===================== ================ ======================== ==========================================
-PG_MAGIC              'P'              pg_{read,write}_hdr      ``include/linux/pg.h``
+PG_MAGIC              'P'              pg_{read,write}_hdr      ``include/uapi/linux/pg.h``
 APM_BIOS_MAGIC        0x4101           apm_user                 ``arch/x86/kernel/apm_32.c``
 FASYNC_MAGIC          0x4601           fasync_struct            ``include/linux/fs.h``
-SLIP_MAGIC            0x5302           slip                     ``drivers/net/slip.h``
+SLIP_MAGIC            0x5302           slip                     ``drivers/net/slip/slip.h``
 KV_MAGIC              0x5f4b565f       kernel_vars_s            ``arch/mips/include/asm/sn/klkernvars.h``
 CODA_MAGIC            0xC0DAC0DA       coda_file_info           ``fs/coda/coda_fs_i.h``
 CCB_MAGIC             0xf2691ad2       ccb                      ``drivers/scsi/ncr53c8xx.c``
-- 
2.51.0

