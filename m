Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBC03EDE5D
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 21:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879701; cv=none; b=eFt5khuuTK4ez0Y5zd/M80QqxubmeB/wEuAdq6i0I0VhHzJIbI2oxd9mfyeirB4z92QGk0V0FwgD2Wu3M9Nd+bhaL8QuoztC7cbNrQPzpqBPUjrSkzjbSlylEAeEDQdXFZwC8QQZH17gw9CnWom/BoiCQXXwm2FdCg2Xz7bbzxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879701; c=relaxed/simple;
	bh=/w4xIQd+FodWBf21xbEabPQcoqxxR+rnVAOAKm/PKP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndl16D8FAAaYLgj3Fr0JrPorchM+XjkVCDXAvzXtVeJ8DxHS7/n6e8RjewVB1orwxnrhDpN1X9mfb1aOBBIiP6omflVLFFyNKGl/8dDLsrJ9KLbzTlqSNZyrugkmfJzY2pmNyPoE7zrkyKd42JqOpEe0UPyLwuNYahxGYTjWngg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAUkQYe1; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAUkQYe1"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30246cfd41aso1511259eec.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778879698; x=1779484498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFOHDGCsOHbtZzrbMRrMDpLy4uq6fKhTRLiSKMVovBw=;
        b=NAUkQYe17YCwOkozqdU8CpMHWdUFgHS6zfI0Ca2ILTLzMf2tiipFVvSkcGZcm/Vgv9
         f8KEgse7WVm8d40kJddfU5qHJ7TbmtZZ9ZkaGR+rzkMct56vQpK5+h3Fsjqf42Di81AP
         zXblzjiLSj9yR7kZYhaSZlfFC+m78FgXqQNMD2x7IUyePyMWN5Ejv6UozaIP747+A4Af
         olt8sJ2zM8qz67HNBxVo8J3K33CGhOndM/yfhuS40Pm3WRAfEiYHCe+zPCzvX2U0wWSz
         ZRjNUNmR1iPXSD1f82xgt6JlXOYaYMNiuh0+zcrN7zOI6ZQzCGbFqcQipX9Qf8piThzb
         ybFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778879698; x=1779484498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFOHDGCsOHbtZzrbMRrMDpLy4uq6fKhTRLiSKMVovBw=;
        b=EfWCdwITYB4GeqyV2+4dXZAFRnOY7JBrFQG2sWcFpPoGtaAvc64Z2RSaB3igw35Nc5
         sNZ7uJRIDYvZddmwZ3/AKexELQdWXLnR4/N+lY7YLOamA20rJRQeajRDAV29EjOfDrMS
         BtyGGYeVitXhjegFhz2zpmjngyquC7c2judOJMnKN/osRSJRkf7BxnAa4Ws581numc16
         wwavT4g3wdBC4IIliQhtS0TEjHqy0bO9/O4ZXVoYDk9tVFN9R48H14eXULsvuUiMcXuj
         YVMDxOw4qeS51D0pj36sd+epwzG2cYY+YQoHPdqRJWaWc1wZF73JGTcb1qSqBm9bGX0M
         3VOg==
X-Forwarded-Encrypted: i=1; AFNElJ+yfa7yM54AGpLk3DONKJAFfYtlFPSEgXGszWqRd7S64mPbBZNjDEEeVeBNzyq6AYBQsHwlG+JK58w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh4vYP3Qz3AmBZMIHaU2Ng0i2ycCWpRnejlNoV4o4aEuqa+POC
	SrTBxrAQSetQrWz/mX0ZWkf21IdLwOPhlK+1qt0BFSUVNKYzRedEQOwe
X-Gm-Gg: Acq92OFsmjBmAzxLhE2I+TKjTM4495cV8RkdcFQujPIw2rB7g7zkHnJsGBr3UoqR+OA
	9kufKbFtuDctRuUzi6C6nT8cENooQPwm1wcRDL4DnwdjKpJia91Beb8QOEKzyi5yBnsxVDuMxZG
	dbSKQmQPMfPp6FcSUDiYVzhn6Xr6etUMPD83u6DXGRdmd99raKcG3QYoS7O2sD6lymHXtQdzOAC
	xj2ZrVdY+6b3obiF1dQQPHgdVGz5CWoYeu8iPp9P/DMLSmVdtVFalmbUMB9hEQ2N+b4B4zkl9xK
	WTUt2DJGuu7hXPSvxwlKzsGhCMyfm2QjdPqcacE3nVZ+nJ5PbxShJmCUjXYz+oPHFTMLcgy/teF
	Jbqlyv8ScWOozRCqdrIxwFZggB9k2iTz7ENhp9Zt7IUOfckaqYbo8cWZ/LQOH0uV2DzfZrJ+lM8
	RA46G0SLNq7WEPl4DuNLcTPa4+ob1dvblw+GEXHB5wOA==
X-Received: by 2002:a05:693c:8386:20b0:2df:919f:ce59 with SMTP id 5a478bee46e88-30398678a48mr2108609eec.19.1778879698427;
        Fri, 15 May 2026 14:14:58 -0700 (PDT)
Received: from mimas.lan ([2603:8000:df01:38f7:a6bb:6dff:fecf:e71a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bbd50sm7961724eec.20.2026.05.15.14.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 14:14:58 -0700 (PDT)
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
Subject: [PATCH v16 16/38] x86: Secure Launch Kconfig
Date: Fri, 15 May 2026 14:13:48 -0700
Message-ID: <20260515211410.31440-17-ross.philipson@gmail.com>
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

Add an x86 Kconfig option for compiling in/out the Secure Launch feature.
Secure Launch is controlled by a single on/off boolean.

Signed-off-by: Ross Philipson <ross.philipson@gmail.com>
---
 arch/x86/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index e2df1b147184..fd9edb0651d9 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1989,6 +1989,21 @@ config EFI_RUNTIME_MAP
 
 	  See also Documentation/ABI/testing/sysfs-firmware-efi-runtime-map.
 
+config SECURE_LAUNCH
+	bool "Secure Launch DRTM support"
+	depends on X86_64 && X86_X2APIC && TCG_TIS && TCG_CRB
+	select CRYPTO_LIB_SHA1
+	select CRYPTO_LIB_SHA256
+	select CRYPTO_LIB_SHA512
+	help
+	  The Secure Launch feature allows a kernel to be launched directly
+	  through a vendor neutral DRTM (Dynamic Root of Trust for Measurement)
+	  solution, with Intel TXT being one example. The DRTM establishes an
+	  environment where the CPU measures the kernel image, employing the TPM,
+	  before starting it. Secure Launch then continues the measurement chain
+	  over kernel configuration information and other launch artifacts (e.g.
+	  any initramfs image).
+
 source "kernel/Kconfig.hz"
 
 config ARCH_SUPPORTS_KEXEC
-- 
2.47.3

