Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 601E7CF
	for <linux-doc@vger.kernel.org>; Mon, 20 Nov 2023 02:02:40 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.120])
	by gateway (Coremail) with SMTP id _____8BxIvC+LltlOS87AA--.50621S3;
	Mon, 20 Nov 2023 18:02:38 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.120])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxP92yLltlJG5HAA--.27432S5;
	Mon, 20 Nov 2023 18:02:36 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: corbet@lwn.net,
	seakeel@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>,
	alexs@kernel.org,
	bobwxc@email.cn,
	wu.xiangcheng@linux.dev,
	yizhou.tang@shopee.com,
	linux-doc@vger.kernel.org,
	chenhuacai@kernel.org
Subject: [PATCH v1 3/3] docs/zh_CN: Update process index to 6.7-rc2
Date: Mon, 20 Nov 2023 18:02:25 +0800
Message-Id: <7f79015d251b3ad88d6ea596508e39832623db9d.1700474235.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1700474235.git.siyanteng@loongson.cn>
References: <cover.1700474235.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxP92yLltlJG5HAA--.27432S5
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cry8XryxGw1xJFykJF48KrX_yoW8Kry7pF
	1DCrySga18Ca4ak3yxKr18WFy5JaykCa9rGF4xKw15XF1Dtr10qr9xtF909ayrGr1Fvay5
	Xr4fKr45CrWxZFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q
	6rW5McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU82jg7UUUUU==

Update to commit f1477dbfa562 ("docs: add backporting and conflict
resolution document")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/process/index.rst      | 52 ++++++++++++++++---
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
index 5af0c2735902..3ca02d281be0 100644
--- a/Documentation/translations/zh_CN/process/index.rst
+++ b/Documentation/translations/zh_CN/process/index.rst
@@ -5,10 +5,11 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: :ref:`Documentation/process/index.rst <process_index>`
-:Translator: Alex Shi <alex.shi@linux.alibaba.com>
+:Original: Documentation/process/index.rst
 
-.. _cn_process_index:
+:翻译:
+
+ Alex Shi <alex.shi@linux.alibaba.com>
 
 ========================
 与Linux 内核社区一起工作
@@ -23,30 +24,55 @@
 .. toctree::
    :maxdepth: 1
 
+   license-rules
    howto
    code-of-conduct
    code-of-conduct-interpretation
+   development-process
    submitting-patches
    programming-language
    coding-style
    maintainer-pgp-guide
-   development-process
    email-clients
-   license-rules
    kernel-enforcement-statement
    kernel-driver-statement
 
+TODOLIST:
+
+* handling-regressions
+* maintainer-handbooks
+
+安全方面, 请阅读:
+
+.. toctree::
+   :maxdepth: 1
+
+   embargoed-hardware-issues
+
+TODOLIST:
+
+* security-bugs
+
 其它大多数开发人员感兴趣的社区指南：
 
 
 .. toctree::
    :maxdepth: 1
 
-   submit-checklist
    stable-api-nonsense
-   stable-kernel-rules
    management-style
-   embargoed-hardware-issues
+   stable-kernel-rules
+   submit-checklist
+
+TODOLIST:
+
+* changes
+* kernel-docs
+* deprecated
+* maintainers
+* researcher-guidelines
+* contribution-maturity-model
+
 
 这些是一些总体性技术指南，由于不大好分类而放在这里：
 
@@ -55,6 +81,16 @@
 
    magic-number
    volatile-considered-harmful
+   ../arch/riscv/patch-acceptance
+   ../core-api/unaligned-memory-access
+
+TODOLIST:
+
+* applying-patches
+* backporting
+* adding-syscalls
+* botching-up-ioctls
+* clang-format
 
 .. only::  subproject and html
 
-- 
2.31.4

