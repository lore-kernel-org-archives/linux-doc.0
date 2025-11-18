Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AADE35A94E;
	Tue, 18 Nov 2025 16:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483172; cv=none; b=iJl7FAOMOnIVJQaoQnGfSDKj/eD7Cp1KEjSysPwZOkqTpoExOwPFcKZ90TFaoyWlYP/3MWLlwrZZ5gdLdDLRLIJuKu27jS9Rjv2afSTUULaxySoHGIcNsDaaoHhVRjTJutdA6RYYEHhbVMhwufl8aKYAmKmVTW2uTwiG/FKrRGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483172; c=relaxed/simple;
	bh=QEA58ISPvgLYWLEqr1jJGitDS6An6AkVJmZcob3iw2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+0A3zlatfBq8rN8hGdYTq3ZytuAUxtlai2/KtAgeCx3HYKRIjVg6E0D3KBXUKsNLNahQDqeK0CvDEcIYEwiI98Er9zq1ss++w87pPIrJUU0ssldIoFTTJl3x4RrDAej/DnsRFRuBUnmSIoG7ExSFIM9HYfMJKpgevrlZu/AvBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from Mobilestation.localdomain (unknown [183.6.59.216])
	by APP-03 (Coremail) with SMTP id rQCowAAXpdffnRxpmMQ0AQ--.31198S3;
	Wed, 19 Nov 2025 00:25:38 +0800 (CST)
From: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	shuah@kernel.org,
	samuel.holland@sifive.com,
	evan@rivosinc.com,
	cleger@rivosinc.com,
	zihong.plct@isrc.iscas.ac.cn,
	zihongyao@outlook.com,
	zhangyin2018@iscas.ac.cn,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Cyan Yang <cyan.yang@sifive.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nam Cao <namcao@linutronix.de>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	=?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH v5 1/2] riscv: hwprobe: Expose Zicbop extension and its block size
Date: Wed, 19 Nov 2025 00:23:24 +0800
Message-ID: <20251118162436.15485-2-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251118162436.15485-1-zihong.plct@isrc.iscas.ac.cn>
References: <20251118162436.15485-1-zihong.plct@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAXpdffnRxpmMQ0AQ--.31198S3
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1Utw1DGw17urW5Ar1DWrg_yoWrAw1kpF
	4DZrsxWFs8Cw4xCFWxt3WkZrn5J3Z7Kw43KF1Uu3yUJFW7trWrXr9xtFsIyr1DtFyFva92
	gF4agrZYya9rArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUH2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY
	1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFI
	xGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc7CjxVAKzI0EY4vE52x0
	82I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU07fHUUUUU
	U==
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/

- Add `RISCV_HWPROBE_EXT_ZICBOP` to report the presence of the
  Zicbop extension.
- Add `RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE` to expose the block
  size (in bytes) when Zicbop is supported.
- Update hwprobe.rst to document the new extension bit and block
  size key, following the existing Zicbom/Zicboz style.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
---
 Documentation/arch/riscv/hwprobe.rst  | 8 +++++++-
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2f449c9b15bd..52f12af43b9d 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -275,6 +275,9 @@ The following keys are defined:
        ratified in commit 49f49c842ff9 ("Update to Rafified state") of
        riscv-zabha.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOP`: The Zicbop extension is supported, as
+       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
@@ -369,4 +372,7 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
\ No newline at end of file
+	Instruction Extensions Specification.
+
+* :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
+  represents the size of the Zicbop block in bytes.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 58f8dda73259..8c572a464719 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 14
+#define RISCV_HWPROBE_MAX_KEY 15
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 5d30a4fae37a..9cc508be54c5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZICBOP	(1ULL << 59)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
@@ -107,6 +108,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	12
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0	14
+#define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 199d13f86f31..6b33fd88bf3e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -122,6 +122,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOM);
+		EXT_KEY(ZICBOP);
 		EXT_KEY(ZICBOZ);
 		EXT_KEY(ZICNTR);
 		EXT_KEY(ZICOND);
@@ -302,6 +303,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
 			pair->value = riscv_cbom_block_size;
 		break;
+	case RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE:
+		pair->value = 0;
+		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOP))
+			pair->value = riscv_cbop_block_size;
+		break;
 	case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
 		pair->value = user_max_virt_addr();
 		break;
-- 
2.47.2

