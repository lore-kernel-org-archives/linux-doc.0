Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37F2376FD
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 16:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368082; cv=none; b=iOkfU9lp/yoVM4I1tnUQNUdx0Eqtben3fWL2UrfN8W/c538q15wGoXTT+7QyyXd/9+yUzd2u7g0bCt37MxlVBoo+pH6ttyWiPIJdGOSNydPACCc/zLyYdhK+Hz4XKG/wu2kaXDRLEKNFG0xaDFbG53SzvZh9Q3hnVs9d1Y/Qb20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368082; c=relaxed/simple;
	bh=+MP5OZfZtfhlhRXIz/gQp3JJyWaLjXeKG3UkGoZNA2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MeSwwWIM2NFezhG06aNRsyreioEW2jkdJGIa8UI1uxE+1TqnYIobu1z+AYTEc1l+vEY2sJmym5GAxafAcueW7w621Uboh4IJv38yg18tJKVz2npiNCFzSBnYdG3fcuez1XT7gf8Gf/KsfSKlMO42vbrhPYJfs5R0W7BruoMw6LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckhIZcG6; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckhIZcG6"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso35975785e9.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 09:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774368080; x=1774972880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PfSGofvTqm76QjsXejgeUzCgTv8V+LAKQZ3dxfOOqYU=;
        b=ckhIZcG6Qg6SPvuVSmawJs2eqlRGEoplWarTJlBjc65UB3UoYQb1sy7GKP3KCIzApf
         rr7jbh6RLEZ1OiZUylOPUC4wEktr5IeYPprYtTsi+DOgte8fEZ2mLYuSIG74iojGdqoF
         BaT4d1VS1ayHWf9HFwztyxtAUylrnBkWJOkum2zyaNdSMkmucMqf2DLI4jOAlM7ITmBT
         kvif0hq6/syMciF8p9hHYixPHEiht/yFL9Z/1PrbQS8DnjjRxiqB+fqxD1LRu7e/0kcD
         /v/W7m0fqWSMtvy7J+MxFk26D1Aplb11pZjj4ZSJ/IH2kWjBgKLgZ9k56mdpWkHSjftw
         3w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368080; x=1774972880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfSGofvTqm76QjsXejgeUzCgTv8V+LAKQZ3dxfOOqYU=;
        b=jrjiC0p/nIQlO/17SPNQW/pDsL3FeLjPwFTf1785GAEH3zkN6lSLmauDQmi89ukw79
         kqL12HC3D6S7NLeJGpM2ZxyNRWwVTaXkgrXmWmqs1cCkCF8Q2M1xuHa06ZkpmKbAthEf
         A3lAhTLT5gXdWaExXLK2YN+/esFrTe3EwO2OvkVzzOsicD7zwAjz3xYcbGtgCLo5ivjp
         NVG7t4+XllHV9R0Lew0T7C4jWTjwRJdCli5y6pI77sWAzPShbLkpfE2JyjS+qIzylp3l
         SyV5yezWsDQs/hrXSmFCNHlmlkGXqZGsGxj7GmX5NXTlOn1ysVQVRxRSOQUjtBGZg9OG
         /wng==
X-Forwarded-Encrypted: i=1; AJvYcCUXmK99ixV3sq6iJql+b6fvLh8y4h+wBAfHNdq6ADdagypoyhjlFofGQMvFD6Qdplmu1InuYP6TSnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuTo5Qi/JoopmQ6PgUAc8gzlCpE0XwV0aDUO5IAntgadkUD42l
	i9JUKDfmK5qf+YRHFpeptP+MKtKlJ8j3gOP+Zg9MM3y871AmUJvTmQUJ
X-Gm-Gg: ATEYQzy0SM8RRhscVFTUsryBA3Otg7l7zxRXBHUKm5jzMDM32MLDDlX/DuEGZ0C2llz
	DRwbcz4WxXPtHSNVjNHr1NsIyheqB+BpK2MikTs3OUqCfu39gEbZ07WFohDSGqFVeulmZHzIifJ
	6w7iEfxM5h8u57SiilQ4TvlegjsOAxu5faq8xbKLeRTCmIMZTsgESn+ZBCZPEhsRDtntMMXgO2k
	gjPglE5Qb2FTQO1bnbs6hUZsJGOsOE0AzE4E0igDdYIllaF5PDq4E2NZnAvgrQpCTD1GIoiCfJe
	2o+S859udUds0via3+IDWswHhr3tOAdgZQ538CGpohVRCqF0/ncjjr1fzWi4e6wBmTHdiCNtGgh
	/gnSfzcss5i39zH+Vt8c5t4gXFLNZgLj0Jafq7DEl5UaAs151kEVuZr6UqKoWFNoTT8uz7EwkRT
	d4rMh36xgPIGRpXJK6pYviZqmNQZBAlgat/XxKZj7qt7IE
X-Received: by 2002:a05:600c:a30d:b0:477:54f9:6ac2 with SMTP id 5b1f17b1804b1-48715f003e8mr4867615e9.0.1774368079199;
        Tue, 24 Mar 2026 09:01:19 -0700 (PDT)
Received: from localhost.localdomain ([2a0c:5a87:9504:9400:da3a:ddff:feee:f1b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c086dsm64121235e9.8.2026.03.24.09.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:01:18 -0700 (PDT)
From: tovicito <tovictakamine@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tovicito <tovictakamine@gmail.com>
Subject: [PATCH] docs: driver-api: fix 6 spelling typos in Documentation/driver-api
Date: Tue, 24 Mar 2026 17:00:48 +0100
Message-ID: <20260324160048.4899-1-tovictakamine@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: tovicito <tovictakamine@gmail.com>
---
 Documentation/driver-api/acpi/acpi-drivers.rst         | 2 +-
 Documentation/driver-api/cxl/platform/acpi/cedt.rst    | 2 +-
 Documentation/driver-api/cxl/platform/bios-and-efi.rst | 2 +-
 Documentation/driver-api/dmaengine/pxa_dma.rst         | 2 +-
 Documentation/driver-api/libata.rst                    | 2 +-
 Documentation/driver-api/pci/p2pdma.rst                | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/acpi/acpi-drivers.rst b/Documentation/driver-api/acpi/acpi-drivers.rst
index b1fbbddb8..376b6d8a6 100644
--- a/Documentation/driver-api/acpi/acpi-drivers.rst
+++ b/Documentation/driver-api/acpi/acpi-drivers.rst
@@ -47,7 +47,7 @@ generally be avoided and so struct acpi_driver objects should not be used.
 Moreover, a device ID is necessary to bind a driver directly to an ACPI device
 node, but device IDs are not generally associated with all of them.  Some of
 them contain alternative information allowing the corresponding pieces of
-hardware to be identified, for example represeted by an _ADR object return
+hardware to be identified, for example represented by an _ADR object return
 value, and device IDs are not used in those cases.  In consequence, confusingly
 enough, binding an ACPI driver to an ACPI device node may even be impossible.
 
diff --git a/Documentation/driver-api/cxl/platform/acpi/cedt.rst b/Documentation/driver-api/cxl/platform/acpi/cedt.rst
index 1d9c9d359..217a75fb4 100644
--- a/Documentation/driver-api/cxl/platform/acpi/cedt.rst
+++ b/Documentation/driver-api/cxl/platform/acpi/cedt.rst
@@ -55,7 +55,7 @@ voltile vs persistent, etc). One or more bits may be set. ::
   Bit[1]: CXL Type 3 Memory
   Bit[2]: Volatile Memory
   Bit[3]: Persistent Memory
-  Bit[4]: Fixed Config (HPA cannot be re-used)
+  Bit[4]: Fixed Config (HPA cannot be reused)
 
 INTRA-host-bridge interleave (multiple devices on one host bridge) is NOT
 reported in this structure, and is solely defined via CXL device decoder
diff --git a/Documentation/driver-api/cxl/platform/bios-and-efi.rst b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
index a4b44c018..5d918b06f 100644
--- a/Documentation/driver-api/cxl/platform/bios-and-efi.rst
+++ b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
@@ -277,7 +277,7 @@ The CFMWS field of the CEDT has special restriction bits which describe whether
 the described memory region allows volatile or persistent memory (or both). If
 the platform intends to support either:
 
-1) A device with multiple medias, or
+1) A device with multiple media, or
 2) Using a persistent memory device as normal memory
 
 A platform may wish to create multiple CEDT CFMWS entries to describe the same
diff --git a/Documentation/driver-api/dmaengine/pxa_dma.rst b/Documentation/driver-api/dmaengine/pxa_dma.rst
index 442ee691a..8f9da66b0 100644
--- a/Documentation/driver-api/dmaengine/pxa_dma.rst
+++ b/Documentation/driver-api/dmaengine/pxa_dma.rst
@@ -40,7 +40,7 @@ Design
 ======
 a) Virtual channels
 Same concept as in sa11x0 driver, ie. a driver was assigned a "virtual
-channel" linked to the requestor line, and the physical DMA channel is
+channel" linked to the requester line, and the physical DMA channel is
 assigned on the fly when the transfer is issued.
 
 b) Transfer anatomy for a scatter-gather transfer
diff --git a/Documentation/driver-api/libata.rst b/Documentation/driver-api/libata.rst
index 93d97fe78..28b8437f6 100644
--- a/Documentation/driver-api/libata.rst
+++ b/Documentation/driver-api/libata.rst
@@ -286,7 +286,7 @@ and other exceptional conditions. The primary responsibility of an
 implementation is to call :c:func:`ata_std_error_handler`.
 
 :c:func:`ata_std_error_handler` will perform a standard error handling sequence
-to resurect failed devices, detach lost devices and add new devices (if any).
+to resurrect failed devices, detach lost devices and add new devices (if any).
 This function will call the various reset operations for a port, as needed.
 These operations are as follows.
 
diff --git a/Documentation/driver-api/pci/p2pdma.rst b/Documentation/driver-api/pci/p2pdma.rst
index 280673b50..d3f406cca 100644
--- a/Documentation/driver-api/pci/p2pdma.rst
+++ b/Documentation/driver-api/pci/p2pdma.rst
@@ -38,7 +38,7 @@ for all usage refcounts to reach zero.
 At the lowest level the P2P subsystem offers a naked struct p2p_provider that
 delegates lifecycle management to the providing driver. It is expected that
 drivers using this option will wrap their MMIO memory in DMABUF and use DMABUF
-to provide an invalidation shutdown. These MMIO addresess have no struct page, and
+to provide an invalidation shutdown. These MMIO addresses have no struct page, and
 if used with mmap() must create special PTEs. As such there are very few
 kernel uAPIs that can accept pointers to them; in particular they cannot be used
 with read()/write(), including O_DIRECT.
-- 
2.53.0

