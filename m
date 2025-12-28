Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6719E296BA4
	for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766913755; cv=none; b=llwxOaF3M3i5dv0EqetRtFqHym3ka85AuWdM1VM/7RKGlP4+8Lv+vIFSe5rOxjuNITcq5K9hDqa/565u8FwbtaE6Fu/hzLsoQ1zldpQCLPnLSQaPKDHaAWZbhKdqbfkfEovurXLvjOKYf+IE11Xyrhf7Kd9Gej565HcJcU5vt+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766913755; c=relaxed/simple;
	bh=fwoFwoOwZ79brO3bjK4dcnd+sMd5nFLEFPSURVCAeM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZXi1VPDNuPAgR4KEI++giPSXkxBNpDsqtfCijTftmpy+Wedd1Yud2mC50Xf1tYAebREymDdABKlQwSO4PdZV2KPR7ceeffaCpk0BOqnR2fN4ZUc4ezapVAcrBg2Tp760HDNhih87u2V+AOwR22Ddp8Gy7vcCMt73E2cD1UIikIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shenghaoyang.info; spf=pass smtp.mailfrom=shenghaoyang.info; dkim=pass (2048-bit key) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b=E/37fXED; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shenghaoyang.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shenghaoyang.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="E/37fXED"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29f2d829667so13820815ad.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 01:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shenghaoyang.info; s=google; t=1766913753; x=1767518553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=btGrbjMukhkE9Huw3B46VPetYheSVmss50T7F8K/NzU=;
        b=E/37fXEDYXY3oAx8hmtxgG/edTwSRlCExMUE8Azrb7NK1wExgT2Njsl979bs8QFWe4
         +w8qvE5MypD/7xCS72bxhGiXD+QpMTbL46OHV7JIi/P4MFIpWJxZJH1Yg5IM6ks6Lpw1
         hBe4pAZLJuMxlfL9CR3L5efHebx7zldSUangh7A9j1ri2pfeXLTdYXdf0PmDCYvj4COI
         TZ1scNWf6wgb4mOzjUx9Lte2O5Ld+FftuewHaI7JSxJ5kb8KQtM/B3vgzb/5NtdeN5qD
         mPvJ0zH6ySzFBoNjfh1vqqS7VvLoKG/0JvaGd0X6iDLO3de1gz/P822iV+W113gBb6ft
         WAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766913753; x=1767518553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btGrbjMukhkE9Huw3B46VPetYheSVmss50T7F8K/NzU=;
        b=LHYDBFqpJW0QHN/rbtYxBJY+AS30QRIhHMotcy2RZwdjnxCBZpLN+2GnHCuOTGvGea
         fE8m50K1fs5/DVzyytkJXLxfdQVNKVHYR5LvAOwgnvr01Zlo5i9Et8ddAfbNJ2UpTVy3
         iFkkUSkbawmvoN43fL4WttCqb97Da0Rj6afIATLYfbr/hOZMC7uHx/ANPiSHZ+5mRnKV
         y6bozcHwdYQyzGgIG60U5noKXPbZZQ/XzKfTxVHT98Q6CUlq7eom+A8tGLyJDDLn9s2M
         MCwgvORrfxl+nQeetPBgoKCcrAw7v6cFLv0XxXNj0w4V81x2XI7SToqU/5cIy+/KoDfY
         YmsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+66W/RRZWdKPc4nEKxfqcHaLwJ0+gSzUtCRMtVLRXG93YX714XhZzn7KpeH4c0j2tmfuB78WC73k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZpAQ37joCFq4zSgafq+De87QUbr/57mRsLA6XWlpfKaTOyD5t
	+FfAVwgeDFb5fl7x4Kn0wGj4d5MwfNDAS6M8VgX0MakkqPPIrgLEWUanL6rFJ/utM4I=
X-Gm-Gg: AY/fxX528cdabZVH4vL15eOyms42ov/HyQBzoFuZina3peYp/Hq//EEM2isQlEF14dT
	sXS3T2ITUtlVRAWyEPIZ+cl+ZXHYxiwvd/ZRImArffhVIZMmxEW1jCKKEXtaPspCoYnAJAB0lrF
	KSf3dZbpjn6T/aS9V8oh1qDYefDEXcdrlyVid9JgAhDn8txeIr2vkpyuPSk47SAAv4f+B7TXc3B
	xoj6g0q9RPQk0qkgpIG4dom42CtUDsWU3+f8n7Qs1EPBtt027M/D3/Ye0Y10FGLPA883cinvVIi
	KItflHCjKVBZXz/2PNdTRjABKYlod+3Qubziplas64XiZnQ4n571Nr87lhBnJUBCBTA6QHByMIh
	IrtNUek7uQhVBg4ZyQtESHx+kQkgTKUGnhdkcJYjRdMjoukiLvpELj4Y3RnMbtKEUwCshG0Ngnu
	J991w4QM/f
X-Google-Smtp-Source: AGHT+IGdyJfOW5uro74UetUR3eEqSXEEp/H+D4mywZrRrWNe9MzaUu+kyvmohAZoutwkEfrKSGQ6WA==
X-Received: by 2002:a05:6a21:398:b0:35d:1244:177 with SMTP id adf61e73a8af0-376a77f5b4bmr18068554637.1.1766913752615;
        Sun, 28 Dec 2025 01:22:32 -0800 (PST)
Received: from localhost ([132.147.84.99])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-c1e7961c130sm22665096a12.3.2025.12.28.01.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 01:22:32 -0800 (PST)
From: Shenghao Yang <me@shenghaoyang.info>
To: x86@kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Shenghao Yang <me@shenghaoyang.info>
Subject: [PATCH] x86/acpi: Add acpi=spcr to use SPCR-provided default console
Date: Sun, 28 Dec 2025 17:22:22 +0800
Message-ID: <20251228092222.130954-1-me@shenghaoyang.info>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 0231d00082f6 ("ACPI: SPCR: Make SPCR available to x86")
made SPCR available as an earlycon option on x86 but did not add
it as a preferred console to avoid breaking existing setups -
users have to round trip the dumped console options
("SPCR: console: uart,io,0x3f8,115200") back via their
bootloader.

Let users opt in so serial console configuration can be made
automatic.

Signed-off-by: Shenghao Yang <me@shenghaoyang.info>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 ++
 arch/x86/kernel/acpi/boot.c                     | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a8d0afde7f85..f9c5b6e4eda9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -125,6 +125,8 @@ Kernel parameters
 			may result in duplicate corrected error reports.
 			nospcr -- disable console in ACPI SPCR table as
 				default _serial_ console on ARM64
+			spcr -- enable console in ACPI SPCR table as
+				default _serial_ console on X86
 			For ARM64, ONLY "acpi=off", "acpi=on", "acpi=force" or
 			"acpi=nospcr" are available
 			For RISCV64, ONLY "acpi=off", "acpi=on" or "acpi=force"
diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
index 9fa321a95eb3..83bbfa1d6f1f 100644
--- a/arch/x86/kernel/acpi/boot.c
+++ b/arch/x86/kernel/acpi/boot.c
@@ -47,6 +47,7 @@ EXPORT_SYMBOL(acpi_disabled);
 
 int acpi_noirq;				/* skip ACPI IRQ initialization */
 static int acpi_nobgrt;			/* skip ACPI BGRT */
+static int acpi_spcr_add __initdata;		/* add SPCR-provided console */
 int acpi_pci_disabled;		/* skip ACPI PCI scan and IRQ initialization */
 EXPORT_SYMBOL(acpi_pci_disabled);
 
@@ -1666,7 +1667,7 @@ int __init acpi_boot_init(void)
 		x86_init.pci.init = pci_acpi_init;
 
 	/* Do not enable ACPI SPCR console by default */
-	acpi_parse_spcr(earlycon_acpi_spcr_enable, false);
+	acpi_parse_spcr(earlycon_acpi_spcr_enable, acpi_spcr_add);
 	return 0;
 }
 
@@ -1703,6 +1704,10 @@ static int __init parse_acpi(char *arg)
 	/* "acpi=nocmcff" disables FF mode for corrected errors */
 	else if (strcmp(arg, "nocmcff") == 0) {
 		acpi_disable_cmcff = 1;
+	}
+	/* "acpi=spcr" adds the SPCR-provided console as a preferred one */
+	else if (strcmp(arg, "spcr") == 0) {
+		acpi_spcr_add = 1;
 	} else {
 		/* Core will printk when we return error. */
 		return -EINVAL;
-- 
2.52.0

