Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7440C37D1B8
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803404; cv=none; b=Vx5n/ik42iKqW4rW5chchfGqICaqnUj3Qer5xLsgSDkdL63Cb2+5fmzYCgp4DawciqFKnJRdvUTiJ66GsdnxSb9GE//PBM/Prv9ZizDLAV6I4ctMw00Rm6nvGhQZ+YdMdexJBqtoC359VgIGW+F8BhF3IKZdfPBpUjZN3pSbKrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803404; c=relaxed/simple;
	bh=8QHeTQ1XWPXrXIuaoG9PXPBKmQw6B9CxYPEzAKre7JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGcqPh7HjQ3YRFJfcAeHG+hLI79KphZGxOsnKPcpOt1GqagZrAAjh4pug1A9d6gT67n3k6ePHcx2d7RCLyX55Zdu/G88nYlTO7xvib7A+rjRnYKn0kI1X3IhDVrhOJGPMRjxy+rsF8WFPCuf+QVeEdUCIeZreY75Pv46v+E2JWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=fail smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b=Y4gUTC3M; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b="Y4gUTC3M"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so1782199f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 08:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803383; x=1768408183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGfMB1SwaAERf8A9+EJZzOGOMSv16YGZ4dbapv2DrTs=;
        b=Y4gUTC3MrooR8TXD8YTfru1jOcy5sBzZqUID9YizdinrPnvWdW2Y0efLIz9oqPq6Vp
         1Q4j52k8fKwxnx0gOoHiyGhtxI4R9FGFfiB/kr0T60iqlCWfWw6JqIRAp75VM0PDFtq6
         brCvvjqJuu7tTydsje8NLHxYlcU2A6P8JhYcT4KAAd9asEqTWtY7Bid9Bgrvw2Mbdzn9
         NNYCui/Zg/cogop/y66l1QmIIxNJZIiwjAtX+JR/Ph5TvaI0c87ZiEj5Lw6Cli1wGbGS
         3vXFefAMxI1k20ak/yt457w8DRBr1rlmtv5GnzoQYsbjAxISyl38OKmYDft4GOs54lsj
         Z3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803383; x=1768408183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TGfMB1SwaAERf8A9+EJZzOGOMSv16YGZ4dbapv2DrTs=;
        b=WIXQn56+VFUTKXaFmVH0m9aCMRWu20KflHRAbKYcnDXzy65h+fcb1UhmwX7fqe9lvK
         IAC606wNdtRdzSKeIh2H/K2PkRTHnASt9cPeDAbDb6jwd9QyLMgNcyVvUGQV1WMPatzD
         SsywZA2+NpTI+cRLgsj4WBq2qP4U9mc63b770szJUpRJRbsDefsudwLOklqNVviqyyd1
         hESmyqakVvPzXH2W5F7cYx6JtpK8aei7V2L4S3mOKh8K70Tr53Aoiv3VsdTCsx2DjN82
         vmtva81mkPqGQBWO/xbR1oUMXaJdfkdRMbmrIDpLBW9mUfe3+UgwPdS6pXsewfPf1fYp
         NvXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvZBbCWA4klWwSWlEA7Xjyp0Cpjt/m4TOTJlUgE+77OoYMenhwIkI+oooat9YrGIqeHIyFtbLX9Rs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxhcZcMPTCXH0KR2asFR31oRDArAqDqZJrHw+abayMoIX7QTTt
	K5VfL0eYSFb13T3rUw04M+rqhcBPAn/SyjQwZgHsJok2GmaKPRpfKBsuAmxcFe/PaDoo
X-Gm-Gg: AY/fxX48NlDOyV22na/CbFp/cDayrPo2tCN06FFRzgC3J4sSlMG22TfZRWp1qdQHSzT
	m1kbwDkI7+whwtjk/yAtNpF0dED0ETOBdFOn4iCIhCMb5nXpBfCo50PcrEt8V+uBq+pmX5KVAYm
	eiJVEbJWuxAfcH92ratSyqytOLoQMgbBXarNhLTxvGaz3yMddTaVV0YQZ+PAhdP6tu9c/RLrktd
	T0/1ibI02hQvWFAyzCBj8OZtvxjrFNxqgc6rFIta1wNuRREPSh46qE3wxTCcEVWbQa8Is3ypNTe
	/6liMbSFNe97uwW9Fzh7Q19PlJMK9ou5Dqcf/2IduP5MLPboN+4o0UQckPomfIAy0GLeq/dV+N5
	4Puit803GgN3BtzSLZei/8VoDS+1bOatgtLOKSr1K2qT6npcqhWN7MWYl+kGDxBTyKcKyq7doPs
	fPBpoeAWCSBeHruM5rrw==
X-Google-Smtp-Source: AGHT+IHYX8ERrMEjplERjC6ixgzkBNgkXhYStxw+rahyUBYDlRtMCSfk+AGXhNnNExJ8kz9EYuCSDQ==
X-Received: by 2002:adf:f4c9:0:b0:431:907:f324 with SMTP id ffacd0b85a97d-432c38d2312mr3237384f8f.61.1767803383134;
        Wed, 07 Jan 2026 08:29:43 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:42 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 5/6] virt: bao: Move BAO_IPCSHMEM_HYPERCALL_ID to common header
Date: Wed,  7 Jan 2026 16:28:28 +0000
Message-ID: <20260107162829.416885-6-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Peixoto <joaopeixoto@osyx.tech>

Move the IPC shared-memory hypercall ID from architecture-specific
headers into include/linux/bao.h.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 arch/arm/include/asm/bao.h           | 5 ++---
 arch/arm64/include/asm/bao.h         | 5 ++---
 arch/riscv/include/asm/bao.h         | 7 +++----
 drivers/virt/bao/ipcshmem/ipcshmem.c | 5 +----
 include/linux/bao.h                  | 3 +++
 5 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/arch/arm/include/asm/bao.h b/arch/arm/include/asm/bao.h
index 5ece9ecb1455..7d13591fe669 100644
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
index c7b7ec60c042..409f4058d56e 100644
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
index f04e6cd33fa9..d168aba7d8ec 100644
--- a/arch/riscv/include/asm/bao.h
+++ b/arch/riscv/include/asm/bao.h
@@ -18,13 +18,12 @@
 
 #define BAO_SBI_EXT_ID 0x08000ba0
 
-static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
-						   unsigned long ipcshmem_id)
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
 {
 	struct sbiret ret;
 
-	ret = sbi_ecall(BAO_SBI_EXT_ID, hypercall_id, ipcshmem_id, 0, 0, 0, 0,
-			0);
+	ret = sbi_ecall(BAO_SBI_EXT_ID, BAO_IPCSHMEM_HYPERCALL_ID, ipcshmem_id,
+			0, 0, 0, 0, 0);
 
 	return ret.error;
 }
diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcshmem/ipcshmem.c
index f3892d41248c..593e89cb76bd 100644
--- a/drivers/virt/bao/ipcshmem/ipcshmem.c
+++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
@@ -14,9 +14,6 @@
 
 #define BAO_IPCSHMEM_NAME_LEN 16
 
-/* IPC through shared-memory hypercall ID */
-#define BAO_IPCSHMEM_HYPERCALL_ID 0x1
-
 struct bao_ipcshmem {
 	struct miscdevice miscdev;
 	int id;
@@ -90,7 +87,7 @@ static ssize_t bao_ipcshmem_write(struct file *filp, const char __user *buf,
 	*ppos += count;
 
 	/* Notify Bao hypervisor */
-	bao_ipcshmem_hypercall(BAO_IPCSHMEM_HYPERCALL_ID, bao->id);
+	bao_ipcshmem_hypercall(bao->id);
 
 	return count;
 }
diff --git a/include/linux/bao.h b/include/linux/bao.h
index 5b06d2a17d21..b29830374788 100644
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

