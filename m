Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A762C11DB
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 16:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774370217; cv=none; b=n1AOTVv1ZhVlGIlwGXAQ67AYYasOWgJWxyKuEf1ayT55K35DwxPZv+BOlpjEmRXicmlu24JiYCVrxboY8bDsGrjiY1wcjR4L4MqfrvXftWOPUdgNTCrGaIid9rhm2b3GOMHEbzXjIckR3XhoKgXJHcRcUQ0H6Rykzp9gJycFxpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774370217; c=relaxed/simple;
	bh=zcasx6RKMorJEbgCu577zYKozk4q9ACD9slKH2QzoFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kFzC226pGkUNsxGezZIMAlgHNe11YGt4KIe393iqWCK/H7thI+hrxVzJLk+Fck9wqG8X1x/1YFkQKRnv3I6B6JoUhS/ydDK35owzXXQ4jhbNkojuAO0Dfa6pW/UvMpcvCqb5wiYDj6F0saOD6TA3hQBGzDZIIbO9OIgYfZD3zR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r+Tdt10l; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r+Tdt10l"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso37533055e9.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774370213; x=1774975013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hkrbSA1FggpkBv+ARhTI9dySDqgYXyBAQx+9oOWHunQ=;
        b=r+Tdt10l4dGJqmuVIQdBb/ohscUAvemtE6I5t3PQvK2DCnRYOpN18oowV+9VcSxsxz
         ilVkR/6FDKKoRabWjqaNGtbEtt18+5EUVC8s9YjmhC5mRt9PpKBUVoE4iqCjmM5YDYJq
         G29xo6aY5z1R7v+CPtNC2w21HuQ+xvwAoeb0cQ4oI7dnT2qkRCnUT8WjTJgny2/GI+Gc
         dt2jDZRIDt+8CLIMtHIuiXz+Q14ItRI0eIiOS4fuBFHTlMruV7+vXyaaXY9rvw7yytRI
         rnA6h52m+sNtmyuSBhbK/eUIiXcx/KUpkg0UOLU0audli91A2NY25snYVwZlXBoJL15d
         NXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370213; x=1774975013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkrbSA1FggpkBv+ARhTI9dySDqgYXyBAQx+9oOWHunQ=;
        b=YBcrX0qwrjT3ip5AX3CWoKTm/KESXB4C31br9MR6PTnDdASW+zdvog8HXmvFMcsmDe
         5VUktXr41VWJi+/8mlvQaFUth7sG2/JpMxI02F5jihpT49ssQizD4MLg8BzpDmrepbUW
         MmuW0aLgVMZKp7pvwWWIS1AbjbsYI7DP9Q99eq4D8iIs6EUH0WVRjbc+UVES+lmaSOlB
         NtjXaIwSGjQyheKpM6UYZQYpUHGN7Jo68DBZYNdJflYUTdjIYj+y88Rkf9apXnBN930W
         oaBIx/DJOfYEvt+D4RQCRWZtjIEOoNn6aDH6rlX+ajhRdFFjhxsGxBbuZwSpkdPdUw+8
         yrpA==
X-Forwarded-Encrypted: i=1; AJvYcCVRerWIQ/fuweG2DxYivXeWrVwE//SndKpS8jO1TSmVxk1PBxIwFgkrj12PvHBq6y4sb80xCmswtM8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2v9muwft/LvAm+F18g10KfASFBxzAJ69J63OJ5qpNrUrXKnKf
	Y3bENp0LrXHpwXFMS4WO2eRu1eStBOHhzOKCap+7nfioMeTId4pz7RKjTlrYtpIvLFk=
X-Gm-Gg: ATEYQzxG7Is0MA+YDtSPysSC67P5KVQJdpJulofgQ+fcW1BWgx7RtlRK9kBU7eTHRQD
	CWbvo7wLonoNxdrKsfoY7EOOfTnnaW5PbGBNdoOujbm8Ur8GJvI9Hsj1V+d1E70fEFbq8vWtmON
	QiickRxczkcsrOAA/lYlm7Qo6xo48zWmDzbEyIIB77ny3FMoPOdF42cEK8Jx2qDXU7RD51nFjpO
	TSroiLeilFX0LJqBDXYb7TsGzAF5ljHCS2NJoCN0MWOtxaVMQeNqliAZj1rpVg9LHuXl3zOcZHl
	9uohxKz83HP5khu8CDRNt6/FmSmXqXXVREbpCFH3awGaPVrDCHWH3aJqY+BlFG3E86XQx0oKjkL
	C/5j8hQbQmXLqBO8+jRQx2LpwSni30RQbUnw2Rk1MQ0L+lOJu2FOqS4sHJ5bbx5zriUHt/uqaXW
	/WnKc0wAe8YiibJFJ04w4TrxIGVsC85ndvB18eGRhBc5ln
X-Received: by 2002:a05:600c:8711:b0:486:ffa3:584 with SMTP id 5b1f17b1804b1-48715febb55mr7166825e9.15.1774370213082;
        Tue, 24 Mar 2026 09:36:53 -0700 (PDT)
Received: from localhost.localdomain ([2a0c:5a87:9504:9400:da3a:ddff:feee:f1b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116abe8esm64525395e9.4.2026.03.24.09.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:36:52 -0700 (PDT)
From: =?UTF-8?q?Tom=C3=A1s=20Pando?= <tovictakamine@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Tom=C3=A1s=20Pando?= <tovictakamine@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3] docs: driver-api: fix 6 spelling typos in Documentation/driver-api
Date: Tue, 24 Mar 2026 17:36:04 +0100
Message-ID: <20260324163604.5710-1-tovictakamine@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix minor spelling mistakes in the driver-api documentation. These
changes improve readability in ACPI, CXL, DMA and PCI docs.
v3: Added reviewed-by from Randy Dunlap.
v2: Added full name as requested by Jon Corbet.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Tomás Pando <tovictakamine@gmail.com>
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

