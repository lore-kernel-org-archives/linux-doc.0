Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9665A3A0E81
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 16:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369226; cv=none; b=BrnW9IJbMdF7ZLItVdqiPkF6qAv/ANztKXckV/O1BprFU8EfisLlQtuEVVUsWRdd8S8ETIVzFR4ciFfGQedZ0422u2ueSlbQ6RHCTdkyawpvn2R4GEiZ9sT2XlCwlU7zR/7e3KkLFpuTHlC36zjvqdlMSgMTBwGggrE0bEWDpHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369226; c=relaxed/simple;
	bh=ShZzsedpZ4aW8QJPj4e2mYky907divykpkQ0QdK/r0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iGuiu2QPOSr6aK5MFmOrBVTYYp6yPsLzgd+WbLo+RZ4tmNld5k4NYFALecYh3+ldZozl5a9G4J5YMwJrldfE8VAb7lap9XyWXfpdh0EWDixQSG8fD72Pgc0/g0djGMfn8yiQWTG1VFE0zNYjzRMLV62eSZ+ksYOtj1WxyrPtc9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1glXB/V; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1glXB/V"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso14422275e9.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 09:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774369222; x=1774974022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jWMdlVdJKj8bPYO8LUTgqDdZKhQ7oXnPeiOOcGdoOA=;
        b=T1glXB/VzG+efx2uRD3ujbaA0TkcJbWNrOdmTGVHsySc59GD0lu5z/wggveBJFW0lB
         3JarF7ITph41orbsInhfSXoWcgDBH7ivdZsNt8KR9C10wYno7XsECP31/Jx0PUmEDEfP
         kOt7d0f8QUVXNJZGBNE83I72JGJZcc6k10kUljFo4XspjNjNR5ZovDzWzcqdNUKOJccA
         vwMStPTJsGZwsLSxDH0yACpWgcvWL9/VSu6t/rTrO2Rne85CiFcVBXyZsPoJvh2gPTn7
         BNNanbuKNNXmZLZueMSPcfwZbRQERjM/YJsXjXjwBu394tNqVL93nqrJKXGtDqsL3PYS
         nLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369222; x=1774974022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jWMdlVdJKj8bPYO8LUTgqDdZKhQ7oXnPeiOOcGdoOA=;
        b=TOnzRltYfBa55/yHDoRTYawkQ0KrJiwK5VagHfSgJZnnzzbQoA7k04dOlwggciEWho
         l0Ye0+x9uYvJ5BLcu/2dn1uDEwNxvCO4xqQUmB0M+1zKmtkRF07SlxoHeXsi7Q/KMr78
         8Kk6FGHvD6bFEOIglYp/qXsJ8KylvRcJXHg3vExMTGusVGcIM/3i74LcrrECWcoxgxN/
         QD8wxpscfFVvbBLR0G+sFeLp8hqViTbjWeH1yjO2py2yOUiolpUdX7VOkKpHy7Dt9ZhO
         9dBKh0DoUNn07j7TxSpkEvWKMK472Ab1ba3Uga45iDscnQ0U0fl+qxXXu1uUyLzezwks
         i34w==
X-Forwarded-Encrypted: i=1; AJvYcCVrv/pMFuBbAiVINU9s/uSFr5PhiO9KD0fmPJoPaSPDvVxYrr071GuwPrtkCpjtzhDAkcGRYHN0qQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfeWufr4Y7XOoyqELEeveMIFgyi71A6t10vYWPQX4qxK1syiqd
	P8x5zyjaQuTvZAKzqvPTMMy74Xl9IkZ7XMLslnULe/uTQ/8R3ryiQCt4GpxObGlNwsI=
X-Gm-Gg: ATEYQzwXmXfAEH54AcFm1pgJIX2S4mTiClvslfb6fL5a1nQbL/cjF9FcWIZetBA8IBh
	c2FE0cl0naC7L9VoXRdOIggDJ6enp1oMAnaqGW9ZVwsv0a5Ne1poOw9SXXqhjIfqySo3REkyLR4
	NHwJejX+qx/8IpUkRysh82dBZA4vZtkdFMzfVzjAmLglpK1E8VDwFiw66y7anXd6+LnI6deL4T+
	t7XQqCMqGSMg8rDROFib+rpmD0ShPaxSp5PaIx5BxNfaKkjvmzbLdVjVpSpbB4w+4OpDLoRhnxF
	QfOFOBgG0iyK/FTfKRFI+JolmXKpcqfB+BVu7iU1OLROosReVoYZPUEgaNYjtXNr89JYu6HVZvu
	ZRzLYRFCyTlhaBJ0ewyJmzuUsQjpmv55serHB5Bc9XEZFnItpEpMpZjgq0O3SN2DNCwdjZTVHVg
	BOPFb5um7BGPX28kLqOS3WB2ozY7/2V0NNSJRHqQBupY/l
X-Received: by 2002:a05:600c:4e46:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-4871605ce94mr4985295e9.20.1774369221461;
        Tue, 24 Mar 2026 09:20:21 -0700 (PDT)
Received: from localhost.localdomain ([2a0c:5a87:9504:9400:da3a:ddff:feee:f1b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee57esm56211175e9.14.2026.03.24.09.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:20:20 -0700 (PDT)
From: =?UTF-8?q?Tom=C3=A1s=20Pando?= <tovictakamine@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tovicito <tovictakamine@gmail.com>
Subject: [PATCH v2] docs: driver-api: fix 6 spelling typos in Documentation/driver-api
Date: Tue, 24 Mar 2026 17:19:13 +0100
Message-ID: <20260324161913.5480-1-tovictakamine@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: tovicito <tovictakamine@gmail.com>

Fix minor spelling mistakes in the driver-api documentation. These
changes improve readability in ACPI, CXL, DMA and PCI docs.

Signed-off-by: tovicito <tovictakamine@gmail.com>
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

