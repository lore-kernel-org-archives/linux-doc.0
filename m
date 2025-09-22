Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C69A18A6A5
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 08:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758529214; cv=none; b=EuKLU/N5+rFCtUu/qBEMeuYx9dkawmrr/zC+0dPrF3VuenKjYfUIgEr1axpWy9wM4NK5xosQmVRkU2Yxt1nx8CsHAOG35bvZQIG5U0XfLatpfRUIH8gsR+1dNx/9L2dT5dtupsRZJKcKwfKPS4zPTpNfQH//ptWG0SdtGPpKKHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758529214; c=relaxed/simple;
	bh=k7LHQaAqQB2O6eeT+FSaJv37gsGqHstNS+KGeKBNKnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rO1VVGiK+eOA5hZxOOmM4bOlmFvBAq6ia00fHSADHMNbqE27TW0Oukag0md1IYzmpcTmIlGLehDeIg5iTXGkl7Gzg/6lMBolKFjry1RDCMSNkmbjISwqGUammwtoVtoCyFgOcCN2BqwmBZ7DwEEiN2gehl/5qZs4Xs3DLalOaPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkZMndsS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkZMndsS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2680cf68265so30232745ad.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 01:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758529212; x=1759134012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQpw+mpVAsvBdtQIBEFkOZLcYioW8i+5zjuZhWL6i4g=;
        b=lkZMndsSGYOcwpwLi/mmNIY6je3qpux2J2MH/0aAf4zqTiF5EAE+xNEhOkmgd/oIJf
         qLZeeItiDGVlq3XxgzYtHDMKY0kiEOgOVzk9APPfw89aSXlDi915QFwONqt/1wYe5Rf7
         +nuftGDlEtFWUQzGU3F9IaGYzWN6sBBSlZkH0OSqxYT4RoFgyauTYTDH9+QQHLOzQByM
         UcGBUxg3Yoc5L43kQ/fb3xgFhmI7HdJDnaFr5nJo8/ufgVO0taIqpgoflG+ZnylIpLj+
         5KAK9PcNUT6Uh9qGZb77l/Jcxplc9sNLoYQCmS3wtyIRpOP1hxXstWuvl4oXKwbVu9ZW
         M/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758529212; x=1759134012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQpw+mpVAsvBdtQIBEFkOZLcYioW8i+5zjuZhWL6i4g=;
        b=r29O4JBlVtSIPY0um5cik7bYSCXqS/bpuKN3kxAdGXTN6j0LhW+8WW3f2WOwSX499W
         +MdbILDSn2ndfXtKf1mybmbAxZtl8ewUm1k722XTJ8OpOuI4Q1HnGUGykJaYvpfEk/0j
         NnsC2Lw2H9SCXWAe64LE7Gu5+CmbRIbvusV3waTrOTJjDr4zXeYDJr0DkfF3Id+53pso
         HCbSJbpkot0q3z+8L8MJ3n2xfuk/KxgLHe+ac/n41WJVQ5zTnIa22FqHkUz8clAtjIF8
         YATzg1IHrDmwmCeDJSSOLW0c5rmfo5GHNPK0ng0mG6hZjnGucldewSe3yZ7WZr56wXsz
         kb+A==
X-Forwarded-Encrypted: i=1; AJvYcCUgiMu0CkYZedYnCf1OvnQZ9h4wotxsVlC5B4Sp4EXLO5pANMc0Uo4MRdp9k89D8QTyFRAg5NXMarI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxotpNd5tzXLRugb4RaZ/JBV5tuF4A/FDYGHnSb9LbxNLiKRwJL
	rZTjRw7g/VIJvQmxiC0ty8+upSqH+KDRIDwMp7VFBO1JW3cu6m5wLvUV
X-Gm-Gg: ASbGnctCvpQBYxWr30taUjI9X0Dy8OfY0CTLvHUB/eGQaOFG0aZfk1Wll9yMjD6gVag
	FxzpCBHmzceGdJKC/Qts7goKVxb+GlXuxX/23e6Ulp+ZhFAiwQAC+a+yndOddkYNlOd+dDB6nif
	7FI9954aa8oPOACab7k6x+4AHcU9joDggkCKQyY2A6LEzwuL341ypEAbtoGmGuTa93HSHo2lcsN
	BLBDCqR/yuM9hN39VWqQisTJE79VwuHNNd8o5+zz/5bLEMMCDitK0pPnE61Rezre7iiEoZnxXjn
	VqdnO3Mil5aeVIh62VQIrHx4xe8VIJS/lE/MI2c8pzVK+PzbyVcI3YSS79r0wAJT1ZtEuIHkKTo
	xghUE1oyi54avXfFnUGngeQ==
X-Google-Smtp-Source: AGHT+IF2a3PSxs2bxKScnwskkO0GAHaWv2ekgx1ekGZgO5VTfxyWgSGB0bcGAJEx/TYLb/Yjr6JF4g==
X-Received: by 2002:a17:902:ecd1:b0:267:af07:6528 with SMTP id d9443c01a7336-269ba50848bmr151819735ad.35.1758529211786;
        Mon, 22 Sep 2025 01:20:11 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26b59d6538bsm89333815ad.82.2025.09.22.01.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:20:11 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 35184423FA7F; Mon, 22 Sep 2025 15:20:08 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux EFI <linux-efi@vger.kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Hugo Osvaldo Barrera <hugo@whynothugo.nl>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 RESEND] Documentation/x86: explain LINUX_EFI_INITRD_MEDIA_GUID
Date: Mon, 22 Sep 2025 15:19:56 +0700
Message-ID: <20250922081956.29481-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4566; i=bagasdotme@gmail.com; h=from:subject; bh=XSbt357ND7lSdI4W7HqeiIfehFqa8m3jg5LexXIM9g4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkX2Xw7rHJ2FrQUHFvKUnW+6v45zwNFxzevU85leH6l6 kg7p3B/RykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACZSn8vwP56tO15i+tynK3Qq mpSKBC//OdER+FK6i9Nhkb3dLGcvb4Z/lub3pon+vWxY/eyO547JnuHHNS1ZhcV+PD7zXZ6DzzS EFwA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

From: Hugo Osvaldo Barrera <hugo@whynothugo.nl>

Since the Handover Protocol was deprecated, the recommended approach is
to provide an initrd using a UEFI boot service with the
LINUX_EFI_INITRD_MEDIA_GUID device path. Documentation for the new
approach has been no more than an admonition with a link to an existing
implementation.

Provide a short explanation of this functionality, to ease future
implementations without having to reverse engineer existing ones.

Signed-off-by: Hugo Osvaldo Barrera <hugo@whynothugo.nl>
Link: https://lore.kernel.org/r/20250428131206.8656-2-hugo@whynothugo.nl
[Bagas: Don't use :ref: link to EFI stub documentation and refer to
OVMF/edk2 implementation]
Co-developed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v1 [1]:

  * Apply wording suggestion (Ard)
  * Replace candyboot reference with OVMF (Ard)
  * Invert patch subject prefix

[1]: https://lore.kernel.org/linux-doc/20250910015738.14848-2-bagasdotme@gmail.com/

 Documentation/admin-guide/efi-stub.rst |  3 ++
 Documentation/arch/x86/boot.rst        | 38 ++++++++++++++++++++------
 2 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/efi-stub.rst b/Documentation/admin-guide/efi-stub.rst
index 090f3a185e1897..f8e7407698bd2a 100644
--- a/Documentation/admin-guide/efi-stub.rst
+++ b/Documentation/admin-guide/efi-stub.rst
@@ -79,6 +79,9 @@ because the image we're executing is interpreted by the EFI shell,
 which understands relative paths, whereas the rest of the command line
 is passed to bzImage.efi.
 
+.. hint::
+   It is also possible to provide an initrd using a Linux-specific UEFI
+   protocol at boot time. See :ref:`pe-coff-entry-point` for details.
 
 The "dtb=" option
 -----------------
diff --git a/Documentation/arch/x86/boot.rst b/Documentation/arch/x86/boot.rst
index 77e6163288db08..32eea3d2807e1c 100644
--- a/Documentation/arch/x86/boot.rst
+++ b/Documentation/arch/x86/boot.rst
@@ -1431,12 +1431,34 @@ The boot loader *must* fill out the following fields in bp::
 All other fields should be zero.
 
 .. note::
-     The EFI Handover Protocol is deprecated in favour of the ordinary PE/COFF
-     entry point, combined with the LINUX_EFI_INITRD_MEDIA_GUID based initrd
-     loading protocol (refer to [0] for an example of the bootloader side of
-     this), which removes the need for any knowledge on the part of the EFI
-     bootloader regarding the internal representation of boot_params or any
-     requirements/limitations regarding the placement of the command line
-     and ramdisk in memory, or the placement of the kernel image itself.
+   The EFI Handover Protocol is deprecated in favour of the ordinary PE/COFF
+   entry point described below.
 
-[0] https://github.com/u-boot/u-boot/commit/ec80b4735a593961fe701cc3a5d717d4739b0fd0
+.. _pe-coff-entry-point:
+
+PE/COFF entry point
+===================
+
+When compiled with ``CONFIG_EFI_STUB=y``, the kernel can be executed as a
+regular PE/COFF binary. See Documentation/admin-guide/efi-stub.rst for
+implementation details.
+
+The stub loader can request the initrd via a UEFI protocol. For this to work,
+the firmware or bootloader needs to register a handle which carries
+implementations of the ``EFI_LOAD_FILE2`` protocol and the device path
+protocol exposing the ``LINUX_EFI_INITRD_MEDIA_GUID`` vendor media device path.
+In this case, a kernel booting via the EFI stub will invoke
+``LoadFile2::LoadFile()`` method on the registered protocol to instruct the
+firmware to load the initrd into a memory location chosen by the kernel/EFI
+stub.
+
+This approach removes the need for any knowledge on the part of the EFI
+bootloader regarding the internal representation of boot_params or any
+requirements/limitations regarding the placement of the command line and
+ramdisk in memory, or the placement of the kernel image itself.
+
+For sample implementations, refer to `the original u-boot implementation`_ or
+`the OVMF implementation`_.
+
+.. _the original u-boot implementation: https://github.com/u-boot/u-boot/commit/ec80b4735a593961fe701cc3a5d717d4739b0fd0
+.. _the OVMF implementation: https://github.com/tianocore/edk2/blob/1780373897f12c25075f8883e073144506441168/OvmfPkg/LinuxInitrdDynamicShellCommand/LinuxInitrdDynamicShellCommand.c

base-commit: 348011753d99b146c190aae262ee361d03cb0c5e
prerequisite-patch-id: 1cff30305281c1f018f9e5dbd95f0c6a2d1db116
-- 
An old man doll... just what I always wanted! - Clara

