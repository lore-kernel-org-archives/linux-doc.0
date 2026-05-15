Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A693FF1CF
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 21:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879706; cv=none; b=dY5pn6nQL5nwFy3NEbC3ZFjWW787FrYS33oq4ZEhORqA/GBvKZ2f9ONb50oA7gIp2IOMNgsXOPbOTNtUIt8GV5/Bnoyd2mLTZy5i+yli9bBS7/hbNbJk0YXAZpCPALE0pUWh6qu0VoySctv/n21t3cbvrxT+GnixV2FvcdZu/A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879706; c=relaxed/simple;
	bh=qtwiEWwByfHHxjTrlTyTKX/7jH6vLFs54iG3FoiDWyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KG6O350MNDk2K1M/4Gw2qs92PIUvaUb9HLuMIqOn+IxXMoe0A3otvbVa4DYa6mtkrJ3fGOHyJR1Nf4zlZWX/eJRVWAMOuDx8gk7g7eAiqp19fCzHnz7AmFsUxlHGg0U3VSQtny5hfq7f33BWRZKnyzlddGjeU/oSQ1gMgnrv0mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9V33mfU; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9V33mfU"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1329fc4bf77so361557c88.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778879704; x=1779484504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azOcaoqgBG4GOjXSMRG7UYVXI2K8VE7Oo8FvV1FqK6Y=;
        b=s9V33mfUWQSz9b71/QS4bizbbARZHMDNvH7LsGEPdS45xkCfL7xQwNunkkk5UbevFy
         w0xSUPPpNM6DkKIOd8ilLXHV6pV05emWyPPWFgqfn9kayoO8I56TjLnTQkA83RLVQort
         j3HRyLu0UnCxhI9MZTxUqlGCDn49YnoTpH+Vqlwk9N40NWTRpfCfLfKeRrdYlaes3gpg
         yuziZP3k99tvGWE9sgFtiQ24002qiDICOLKL1JqwUpsBbLdAm5ybiYLaAYzWLrd9GBNt
         fY1FVQCWMDnCoY4L+hfoMxL2Tdsqm96Us8LZih0uGUthsPQYzPfDuEnCoG59+ipp3xMP
         vflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778879704; x=1779484504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=azOcaoqgBG4GOjXSMRG7UYVXI2K8VE7Oo8FvV1FqK6Y=;
        b=jcE8wdLEIq7EFqO83wTodoZyHpLKS1NelrYnaWPLfA7eJMhHGJns8cWn/VJxG4FAy2
         CRcagwNp4MdhTxiUrcxcsAqXJW8ClbNmgUbrSBPI8bH7qBylvyBDns1XFUK4lSfQsgUS
         b0aLHmLtfovogkfz8zc77UdTWU/8jX6/qMLMlr4DOj60P2haIJGQPVexGPhdW5eaJUQ7
         m3jTu24r43RnFEfl6CJh+sA2yYkj+pNKl9VEyYq/IlwyMUeRyt2XGc1PM9qbx8Ow1Izc
         j8Ml/A4Osw9NEkFt74ga9plpEpFVKZYHnOPtEzG8A4QlAuS9EDR+Dr01Ag2jvQZLYnK+
         zbHg==
X-Forwarded-Encrypted: i=1; AFNElJ+dYlOth+Gc4CO+ac5LkjZno+qgWhmMTbH03YeWHmdvgqBFUSjb6JOAH8gQmfMhRGhyWRzxtIKlWo8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV84vzWRMX8pAtiY9i420mp7QWOTKi5cxdzkxDWdYgeustLwNP
	uT575et5SAaTqlEYSbpZ1NwvhKHzQQkCIs3x64Fjeo9uKPFJVhtw5oN9cLjm2lGe
X-Gm-Gg: Acq92OFKpIdJZQNXZsctVkMR574b8WwT06Vql0YD8r56ABoH/p7R5ATwCXa+H6X4db8
	Siq8x7c/pFrJwpyGH64E6n2QAjVc6RoBZXM0EHBWkbGSY9p0DO8fX2lmXqM/pl1bNT8Etc4M0kn
	gKy5unsW5F3WTnZc3g07eQhLx9QLy5R4HuMgaTR7btdBCs7G+SzgYOAE4/IL9fGk6lxYutz4cYO
	giUHHSR/obNJq8WA4KxBREwCjbkjp6D2QpY69ZuGH0ohuvqNjLbq8XAJUFru4LiIXG8yEPOB+XN
	okQp4+In0wqRpF4ewjqhCmKXhOvTJfwmxtGXGzz1Zts243cUUE59/OV9JxCgbmDlB3j/E8SkIHz
	226nsHxahNZQdTaetyhgouyVCgGkR4Ob8zfpSiL0pvwpp8SBRYV1OGwfl/HZVu0fWjcEehrV73G
	58xUb3VJPAdRlh5WHo9b7Ql80pilpfvgU=
X-Received: by 2002:a05:7022:239d:b0:133:598c:2b45 with SMTP id a92af1059eb24-1350494e3f6mr2888720c88.31.1778879703912;
        Fri, 15 May 2026 14:15:03 -0700 (PDT)
Received: from mimas.lan ([2603:8000:df01:38f7:a6bb:6dff:fecf:e71a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc3490bcsm9740638c88.15.2026.05.15.14.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 14:15:03 -0700 (PDT)
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
Subject: [PATCH v16 18/38] x86/efi: Secure Launch Resource Table EFI definitions header file
Date: Fri, 15 May 2026 14:13:50 -0700
Message-ID: <20260515211410.31440-19-ross.philipson@gmail.com>
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

The Secure Launch EFI definitions are contained in the Secure Launch
Specification. The definitions are split out into a separate header
file for compilation purposes for EFI vs non-EFI environments in the
kernel.

The specification can be found here:
https://github.com/TrenchBoot/documentation/blob/master/specifications/secure-launch-specification.rst

Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Ross Philipson <ross.philipson@gmail.com>
---
 include/linux/slr_efi.h | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 include/linux/slr_efi.h

diff --git a/include/linux/slr_efi.h b/include/linux/slr_efi.h
new file mode 100644
index 000000000000..5de87a9b38aa
--- /dev/null
+++ b/include/linux/slr_efi.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * EFI Definitions for Secure Launch Resource Table
+ *
+ * See TrenchBoot Secure Launch kernel documentation for details.
+ *
+ * Copyright (c) 2026 Apertus Solutions, LLC
+ * Copyright (c) 2026, Oracle and/or its affiliates.
+ */
+
+#ifndef _LINUX_SLR_EFI_H
+#define _LINUX_SLR_EFI_H
+
+#include <linux/slr_table.h>
+
+#ifndef __ASSEMBLER__
+
+/* EFI Support */
+
+/* SLR table GUID for registering as an EFI Configuration Table (put this in efi.h if it becomes a standard) */
+#define SLR_TABLE_GUID			EFI_GUID(0x877a9b2a, 0x0385, 0x45d1, 0xa0, 0x34, 0x9d, 0xac, 0x9c, 0x9e, 0x56, 0x5f)
+
+/* Secure Launch EFI runtime protocol */
+#define EFI_SLAUNCH_PROTOCOL_GUID	EFI_GUID(0x534189e0, 0x6fde, 0x413d,  0xbe, 0x91, 0xcd, 0x4e, 0x8d, 0x67, 0x2f, 0xea)
+
+struct efi_slaunch_protocol {
+	efi_status_t
+	(__efiapi *setup_dlme)(struct efi_slaunch_protocol *this,
+			       u64 dlme_base,
+			       u64 dlme_header_offset,
+			       u64 dlme_table);
+
+	efi_status_t
+	(__efiapi *launch)(struct efi_slaunch_protocol *this);
+};
+typedef struct efi_slaunch_protocol efi_slaunch_protocol_t;
+
+#endif /* !__ASSEMBLER__ */
+
+#endif /* _LINUX_SLR_EFI_H */
-- 
2.47.3

