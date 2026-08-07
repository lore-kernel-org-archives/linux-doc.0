Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25CC381EAB
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 07:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088470; cv=none; b=Wi42QK99uHT+g3nyzbuT/n2DHwI6lHRzQAFmUH6O2x8P+jHev+yUymisOnMRmbnFMIC2RNyVXN47bMWam+0l5c742zyFpdEPWQ1VfX3BofXDzNIzgjO8xM3QitRCcS5EJ5THpez18SAgkJhInJ7eX8P42WLoabllcj/i7WMeR7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088470; c=relaxed/simple;
	bh=niIyvbJ1E7z3qzfkdpOp8zB62jyGHXdyNynklJyVodQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MfgGlJ9/UaltwjNIrPn7GPYA1nXXXhUW7EiPoidvUkVM27HFTsJI59r79bIf3nNKKebikO6csxahzbjsLXTZcNhGpfsSNAu4llIAhuAOL1cOxLv+ysi/9vKnMlYjvZ3LaHHY4BFcFrlcyipxfME/QzoUJHVmMsG2fQVw6Y4KU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=FBopS/uj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="FBopS/uj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4807df69172so43599f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 00:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088467; x=1786693267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8aHbeVjWIKrFsYTmN2+DAuK82NyrvO/pruFApuuKdA=;
        b=FBopS/ujRa/zLNfV3FQJulcfsm43gQ/tRaFRkSrc4GGuPyaG9tGJwMQGuZfEw2TUER
         DKECEuFGerlo0wHpv4J4tybGzTJohLKU7tktxFkU3JGg606H+4Udqk6wBlyrJJzlCdly
         x2cePh24o9ikLbgzZIM35oMyOGVUXC8DKr8+M12aryoug8eqH0f60QWhJdtGEK45ma+F
         BJUdRTYBdJg1p9eVgnGVRYVUXHqCCB9MB6uU7qUnkcTpYNsXvj+F/BsSnIUaHN7n6pfV
         3LhiLFqudPSIQhcrcohbLMh97e8q6Tu+W+LoRyFQ98XIf4rLSUvDlgBdJnBcls5ydbiG
         //8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088467; x=1786693267;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8aHbeVjWIKrFsYTmN2+DAuK82NyrvO/pruFApuuKdA=;
        b=VTC+vZPJENXUbLqO4/bpNycmJTS2weQZIWfN1VekXNLWVLcSnUQTgJYzzzi20gJdOf
         jj+yQaUhphfv6JcORMbEvJU01j7SL5bEwfj0vvL+S3gqRpFKRjk5RH1gUgHM1Uy+GBn3
         TlJuTqOrMKMn7btuW3xYjaVxXOVRch7VSVGoK79iNTHNxHsTO+tS37bguMljAEk2jGbt
         7a11KzKIHKiCtHzTGdP6qPjhE1y7wxaC3LftWQt9Z1+/OsCaZMo8JBvySjxpaEMC0tPT
         KPZTuHk2o6y6OScRcJroCUOaqNv9lGyfpTMLevFMpKA4LCICsnc9xw8RW0Piiy0607tP
         AXrA==
X-Forwarded-Encrypted: i=1; AHgh+RpuwKGsfeZbeG6L5mzuxgMLyjTVxyuD6x013982TS2rivWdowoXmwq8WVfroTFoKeI7VtGIDO/h0v8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwES0osVYPMlUB9vPcFoFwmoFE9TvBZrSRY47x1vkSrkdPteGpm
	qXRb3Aj4mD5LoeGj95sXSAeNV9HfR9CptGquMbCSP1Uu4fNGyPia4cuWTqHo5dJgfDxA
X-Gm-Gg: AR+sD13yDrWBXAFeKrf1RktHtRVqoOFH4r2ywMjTKyrmkfrc+KzqSljszleNMQFPRmS
	zWDyNdeHIg75m8XumWaDIdaqYkhqbqAP3XSSk4T7Vm2JKs2QFCMgmkoGJttT9RBNgrvs7hSajuw
	7Q9j/dR4f8HxTAyfV1/3y4pWxTAr1P+VIwkFSSfKL3lseLf1bSh2ukKCfpAEUjRbR9L1Cywr8OY
	XEGv4WAZg2frZ0xfPj9K+NlxqbOL0cuI3He67xP/SKbfSduGdlyU6nI+jJuRiYB6IgbBg/dHNzz
	onS8kKlUTvGDXmtwcm9xSfeyX4lIE0D3qXr24LfOu4lzPjbAzE0ax4iYGKQZqT6/YZy4b72z+2d
	SbtlqwhM9RrF/1yEH8WrcXZvS9zAO9lnHSfsr3FLyk71UU49sf+7URHuvzpwdlB+xJoMfmiN36/
	8AzfG/aCstYqhT/txDkOpd60GPGgiaVaO2GBAkmAT9AhXiHSnHtNIN70kHL3mzJuQ=
X-Received: by 2002:a05:6000:2913:b0:47f:ecbb:55fa with SMTP id ffacd0b85a97d-47ff4bc1a11mr16115409f8f.5.1786088467028;
        Fri, 07 Aug 2026 00:41:07 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:41:06 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 5/6] virt: bao: consolidate the IPC hypercall ID in include/linux/bao.h
Date: Fri,  7 Aug 2026 08:39:32 +0100
Message-ID: <db869ed90e16691ea1f0aee051e54daf89f42de8.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The IPC shared-memory hypercall ID was passed as a parameter through each
architecture's bao_ipcshmem_hypercall() and defined locally in ipcshmem.c.
Define it once in include/linux/bao.h, next to the Remote I/O hypercall
ID, and reference it directly from the arch helpers. As there is only one
IPC hypercall, this also lets bao_ipcshmem_hypercall() drop its
hypercall_id parameter.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Rewrite the commit message to explain why the ID is consolidated and to
  describe the bao_ipcshmem_hypercall() parameter removal it performs
  (Greg KH).
- The helper now takes a single argument and fits on one line; unwrap the
  remaining few-char line wraps (Andrew Jones).

 arch/arm/include/asm/bao.h           | 5 ++---
 arch/arm64/include/asm/bao.h         | 5 ++---
 arch/riscv/include/asm/bao.h         | 6 ++----
 drivers/virt/bao/ipcshmem/ipcshmem.c | 5 +----
 include/linux/bao.h                  | 3 +++
 5 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/arm/include/asm/bao.h b/arch/arm/include/asm/bao.h
index eca258cc94e3..a7d608493723 100644
--- a/arch/arm/include/asm/bao.h
+++ b/arch/arm/include/asm/bao.h
@@ -16,14 +16,13 @@
 #include <linux/arm-smccc.h>
 #include <linux/bao.h>
 
-static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
-						   unsigned long ipcshmem_id)
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
 {
 	struct arm_smccc_res res;
 
 	arm_smccc_hvc(ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,
 					 ARM_SMCCC_OWNER_VENDOR_HYP,
-					 hypercall_id),
+					 BAO_IPCSHMEM_HYPERCALL_ID),
 		      ipcshmem_id, 0, 0, 0, 0, 0, 0, &res);
 
 	return res.a0;
diff --git a/arch/arm64/include/asm/bao.h b/arch/arm64/include/asm/bao.h
index 1dc09a2c261b..5bd2a8c9905d 100644
--- a/arch/arm64/include/asm/bao.h
+++ b/arch/arm64/include/asm/bao.h
@@ -16,14 +16,13 @@
 #include <linux/arm-smccc.h>
 #include <linux/bao.h>
 
-static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
-						   unsigned long ipcshmem_id)
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
 {
 	struct arm_smccc_res res;
 
 	arm_smccc_hvc(ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
 					 ARM_SMCCC_OWNER_VENDOR_HYP,
-					 hypercall_id),
+					 BAO_IPCSHMEM_HYPERCALL_ID),
 		      ipcshmem_id, 0, 0, 0, 0, 0, 0, &res);
 
 	return res.a0;
diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
index 6dc0cb13c94c..a587a6abd54e 100644
--- a/arch/riscv/include/asm/bao.h
+++ b/arch/riscv/include/asm/bao.h
@@ -26,13 +26,11 @@
  */
 #define BAO_SBI_EXT_ID 0x08000ba0
 
-static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
-						   unsigned long ipcshmem_id)
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
 {
 	struct sbiret ret;
 
-	ret = sbi_ecall(BAO_SBI_EXT_ID, hypercall_id, ipcshmem_id, 0, 0, 0, 0,
-			0);
+	ret = sbi_ecall(BAO_SBI_EXT_ID, BAO_IPCSHMEM_HYPERCALL_ID, ipcshmem_id, 0, 0, 0, 0, 0);
 
 	return ret.error;
 }
diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcshmem/ipcshmem.c
index 0d46d89ee788..5bf37c1c7933 100644
--- a/drivers/virt/bao/ipcshmem/ipcshmem.c
+++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
@@ -14,9 +14,6 @@
 
 #define BAO_IPCSHMEM_NAME_LEN 16
 
-/* IPC through shared-memory hypercall ID */
-#define BAO_IPCSHMEM_HYPERCALL_ID 0x1
-
 struct bao_ipcshmem {
 	struct miscdevice miscdev;
 	u32 id;
@@ -104,7 +101,7 @@ static ssize_t bao_ipcshmem_write(struct file *filp, const char __user *buf,
 	*ppos += count;
 
 	/* Notify Bao hypervisor */
-	bao_ipcshmem_hypercall(BAO_IPCSHMEM_HYPERCALL_ID, bao->id);
+	bao_ipcshmem_hypercall(bao->id);
 
 	return count;
 }
diff --git a/include/linux/bao.h b/include/linux/bao.h
index 076f071086b6..17d6ea472521 100644
--- a/include/linux/bao.h
+++ b/include/linux/bao.h
@@ -15,6 +15,9 @@
 
 #include <linux/types.h>
 
+/* IPC through shared-memory hypercall ID */
+#define BAO_IPCSHMEM_HYPERCALL_ID 0x1
+
 /* Remote I/O Hypercall ID */
 #define BAO_REMIO_HYPERCALL_ID 0x2
 
-- 
2.43.0

