Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6903EF0CD
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 21:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879729; cv=none; b=hMD6MNPYgtBhpaaqw51w8rUZamjBYLj3aOb3wofVVmp9N+K8fgudyOlVM4qxcclcwYRg831C76BfbFLtVUPo5UWEoFes3nYd4HwdsVsOPZRhSJj8O/3X3GwTn98J9EDqqB551a71G0qrro177yGfo7KFTwqRWnj1zObBFhd9FZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879729; c=relaxed/simple;
	bh=ws7RALHIgZvmMfHxpeYb691c/xou17qPzYNIPgpKvkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9+5agDZvknNelYkh7OFTyDb0AUgoQ4n8+T72loT3epODrOGXQS1C9sj+PlRbJsQ9kOLQv1bW6pgLhiMya4OmNhzHN8n/3OWtAzj34jycdi2xShc/w/5gDOi+jYGjeSbLhKYaJNUNtOl7aPSBfhegqnd6gOvTEMWZPHJcDyMwNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLG862k+; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLG862k+"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso333733eec.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778879726; x=1779484526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqo7CRqxUyGu2ximwHeynWdE4uCktJ1VQ9YKgYjfZfU=;
        b=mLG862k+XvHfYupXY2cGN3KGmsVEarkfn+irlqIgLRV7YTl1YOL7rWy18hQOrUcqlJ
         ksnEVDMtlJuORz9AHqXFw1cYhAdj/9o+vXaXOOzWe28wk3dys/zIToepw6+c9dHabvKa
         FiUYL7xyp4xQS5EoFtUZXt8tX4vME/asD+16w3nvjGBBr595Q0+FUwYlvG03IibGTq1F
         wdi40Wrv0EGMGgRZiRjvkTDMXd04nosit30VEIyD5KQIlIlUfalXz61hGUlhExwWOiAd
         4UHGDn8sFl7bGSQ1rfhi58kXBo1l+ZYheebN8ogAtmUiyBkcGc5As9oKrf9bzH5BADsC
         10Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778879726; x=1779484526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zqo7CRqxUyGu2ximwHeynWdE4uCktJ1VQ9YKgYjfZfU=;
        b=jtNVc68A2qkQUHMRgxMOr7TfPSwaRRW7OSJjN6/N385FmxTjboAB7DSQ758FdxrdPW
         pMNbXJzPOXd5xxZSjoJFTkZ80HYC3tjMm2RoamkGfOg+KVLp63mD7raFy7kZFJ2ft52y
         Po9CGeE6ncf0+7yucnkUlkRgVb2CIfI40lfbbY2A/7l+BRLpL5bP8aHspyTuCt5bexSN
         xXJZGe0JwcRYLg2YsL/58huJN9R64QQSFgGqz1feZ9I1n1RvndWlRo43z/F9fTr0+oEg
         3C8TzNyG1sZ5HUs4MYHcaOsqI3moRI/1okiIiIN1qZ1rk2CHJxGo1ZdLYLrbuG580DY1
         hTkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5z3IghrYOdZ+d8KF/wygz1wkMoBSW8HRk7qGZFNHDb1w3EV2QbknAtu3rCkfIYGiWikV5nwKyX7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtEKuOCXb8PKbAIviyHzP4SC533Hs2foH3vmi9j9tMGG50aEdl
	iQTeSZMRPCuhblTx2O0w10COvVeqcn0rDHPyw8bORvsbm+mZQysakjD5
X-Gm-Gg: Acq92OEbzseGgdz+3LyOVOzJpke/qi4ZoieCXgnZfYSnOh0Ye6tIwSgDEsPXDhJmro0
	O+kutvj3lIk9LF1f8tbcom72i5Vz2/J43/j74c/T5tR6YIHu9Ghbxmcrrv13xPR9KId/TT7pcIC
	QywJYyE61xyJnqQzJNzJk/AAjkq/bIPe2cVU6cpp7dqna4+WYJomrTUUpE6L6TCOikc6junHQqA
	19xqhsIyVDcrgXzutIbBQautMuk+tI8ZP2pSzij9lU1adFbjbdzunq9jC1Rdbj1xdrhRmioJh39
	s1tE+UAjWZGABY5Q0ZKDQh4EBrAvnFduUpttDVbGpYnP2f8gN3IcdotpNQsTgetlKEfyRtPK3P5
	QvVu1TpoKW8/PgMqzRHrLxAUbyGAsp6gLLya+nEJSUdBLS7HuWcFpXTzUtP/WGjkv+KYf35nj/o
	H6hTqK/ku9mat5ad3Hi2pbxX3yEBtpFR8=
X-Received: by 2002:a05:7300:fb83:b0:2de:cc07:e8b with SMTP id 5a478bee46e88-3039818afa7mr2863582eec.1.1778879726369;
        Fri, 15 May 2026 14:15:26 -0700 (PDT)
Received: from mimas.lan ([2603:8000:df01:38f7:a6bb:6dff:fecf:e71a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302977a9474sm8155633eec.25.2026.05.15.14.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 14:15:25 -0700 (PDT)
From: Ross Philipson <ross.philipson@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-integrity@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-efi@vger.kernel.org,
	iommu@lists.linux.dev
Cc: ross.philipson@gmail.com,
	dpsmith@apertussolutions.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	ardb@kernel.org,
	mjg59@srcf.ucam.org,
	James.Bottomley@hansenpartnership.com,
	peterhuewe@gmx.de,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	luto@amacapital.net,
	nivedita@alum.mit.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	corbet@lwn.net,
	ebiederm@xmission.com,
	dwmw2@infradead.org,
	baolu.lu@linux.intel.com,
	kanth.ghatraju@oracle.com,
	daniel.kiper@oracle.com,
	andrew.cooper3@citrix.com,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v16 26/38] x86: Add early SHA-1 support for Secure Launch early measurements
Date: Fri, 15 May 2026 14:13:58 -0700
Message-ID: <20260515211410.31440-27-ross.philipson@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260515211410.31440-1-ross.philipson@gmail.com>
References: <20260515211410.31440-1-ross.philipson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Secure Launch is written to be compliant with the Intel TXT Measured
Launch Developer's Guide. The MLE Guide dictates that the system can be
configured to use both the SHA-1 and SHA-2 hashing algorithms.

Regardless of the preference towards SHA-2, if the firmware elected to
start with the SHA-1 and SHA-2 banks active and the dynamic launch was
configured to include SHA-1, Secure Launch is obligated to record
measurements for all algorithms requested in the launch configuration.

The user environment or the integrity management does not desire to use
SHA-1, it is free to just ignore the SHA-1 bank in any integrity operation
with the TPM. If there is a larger concern about the SHA-1 bank being
active, it is free to deliberately cap the SHA-1 PCRs, recording the
event in the DRTM log.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Ross Philipson <ross.philipson@gmail.com>
---
 arch/x86/boot/startup/Makefile   | 4 ++++
 arch/x86/boot/startup/lib-sha1.c | 6 ++++++
 2 files changed, 10 insertions(+)
 create mode 100644 arch/x86/boot/startup/lib-sha1.c

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index 5e499cfb29b5..e283ee4c1f45 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -20,6 +20,10 @@ KCOV_INSTRUMENT	:= n
 
 obj-$(CONFIG_X86_64)		+= gdt_idt.o map_kernel.o
 obj-$(CONFIG_AMD_MEM_ENCRYPT)	+= sme.o sev-startup.o
+
+slaunch-objs			+= lib-sha1.o
+obj-$(CONFIG_SECURE_LAUNCH)	+= $(slaunch-objs)
+
 pi-objs				:= $(patsubst %.o,$(obj)/%.o,$(obj-y))
 
 lib-$(CONFIG_X86_64)		+= la57toggle.o
diff --git a/arch/x86/boot/startup/lib-sha1.c b/arch/x86/boot/startup/lib-sha1.c
new file mode 100644
index 000000000000..8d679d12f6bf
--- /dev/null
+++ b/arch/x86/boot/startup/lib-sha1.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 Apertus Solutions, LLC
+ */
+
+#include "../../../../lib/crypto/sha1.c"
-- 
2.47.3

