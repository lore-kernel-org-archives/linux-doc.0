Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.187.6.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795848567;
	b=q68n4I9bU5+9BXBMMz6kNyn8dZm9wBHj6L/O+4Jbj5GJOWUgvaXli6hHgWtz1algSD33
	 kFHO0WaMYAv1+1YeKIheQoqvzCH05/eTWEqvnTUPlNw3DD8KermTQyUmHeFD57hF42jiS
	 2kKkOEM3I6p7IWVw9wqxoYdANrFiUlVdy1eLM/tUsSpK4p/+XljK1PrulKgI4GNPatIcH
	 T8sUj0vH2uNvLYiwLoay3WvyHDVHd9sfU+aIfuryvOhHLLe7pbn9lTnaGXxB9CgqpHOfN
	 OG1vkiG2aTC2P1UuEDfMmJ6yldAbcydDBmcZ++YRZsUhv/t7C10Y8BSk8zfD5ZIhfWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795848567;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=BBIUg8s+jos4Zg+KWfF44I2kgvf4RGtlx1FXW9qHemg=;
	b=tbCzpQiZIgMxiy2eFa8TPbvPbU3+cJo/JIgtKIVnj7pDndjpzQQreonLB8f9KZYL5U+u
	 2QfV0AeDmAG142UTqiuRTQvAroUNUcgg1ndDt2HeBuklzc6gcaIUwPL+gwMlJ+5B2fGnt
	 ABXV7T7Qb+gLzbdO+0OoHdcWIGhOlMHhVTsnR0InnsVdI0foRUN7Lkvx0KP/wJZ4yBPRC
	 0U9dO704XC+dwQ2iIhySIJl3RfoG97LVXTfdFHZnmuyAd4HeUspgsM5fFVm0r7Kv064aF
	 FTZ59iYrlIMU4KzIJhfK9fPNRXdaPnQeBrkRnR7Q1Kqg4bI+INZkuTeLXiIV/D0yrgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=52.187.6.220
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.187.6.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF80D606A31F;
	Sat, 28 Nov 2026 06:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF80D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with UTF8SMTP id IAEQrMBGjc5veQprZG0hAA--.27344S2;
	Sat, 28 Nov 2026 14:49:19 +0800 (CST)
Received: from mudongliang-PC.tailb307d0.ts.net (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wAnsjxseQprphd_AA--.15110S3;
	Sat, 28 Nov 2026 14:49:19 +0800 (CST)
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
Subject: [PATCH v4 1/9] docs/zh_CN: update admin-guide/index.rst translation
Date: Sat, 28 Nov 2026 14:49:08 +0800
Message-ID: <20261128064916.3481435-2-dzm91@hust.edu.cn>
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
X-CM-TRANSID:IAEQrMBGjc5veQprZG0hAA--.27344S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr18Ww43Gr43uw4DCF1rWFg_yoW8ZFyUp3
	WqgryxK3W5JFy2kry8Gr1jgFy8G3W8Ww4UG3Wrtw10vrn8tr1vvr45tFWDKa4kurZY9ayr
	Ja1rK3yUur42y3DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQEb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26F
	4j6r4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2
	xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2Iq
	xVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UGApnUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

update Documentation/admin-guide/index.rst Chinese translation

Move the already translated tainted-kernels, media, and unicode entries
from the Todolist into their respective sections.

Update the translation through commit f0efd29aa60c
("doc: Add CPU Isolation documentation")

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../translations/zh_CN/admin-guide/index.rst         | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index bd01cf6474c8..23443eb66124 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -1,7 +1,6 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/admin-guide/index.rst
 
 :翻译:
 
@@ -10,6 +9,7 @@
  朱岩 Yan Zhu <zhuyan2015@qq.com>
 
 
+==========================
 Linux 内核用户和管理员指南
 ==========================
 
@@ -86,6 +86,7 @@ Todolist:
    reporting-regressions
    bug-hunting
    bug-bisect
+   tainted-kernels
    init
    clearing-warn-once
    lockup-watchdogs
@@ -95,7 +96,6 @@ Todolist:
 
 *   quickly-build-trimmed-linux
 *   verify-bugs-and-bisect-regressions
-*   tainted-kernels
 *   ramoops
 *   dynamic-debug-howto
 *   kdump/index
@@ -122,6 +122,7 @@ Todolist:
 
 *   cgroup-v2
 *   cgroup-v1/index
+*   cpu-isolation
 *   namespaces/index
 *   pm/index
 *   syscall-user-dispatch
@@ -170,6 +171,8 @@ Todolist:
 .. toctree::
    :maxdepth: 1
 
+   media/index
+
 Todolist:
 
 *   acpi/index
@@ -183,7 +186,6 @@ Todolist:
 *   hw_random
 *   laptops/index
 *   lcd-panel-cgram
-*   media/index
 *   nvme-multipath
 *   parport
 *   pnp
@@ -220,11 +222,11 @@ Todolist:
 .. toctree::
    :maxdepth: 1
 
+   unicode
+
 Todolist:
 
-*   highuid
 *   ldm
-*   unicode
 
 .. only::  subproject and html
 
-- 
2.51.0

