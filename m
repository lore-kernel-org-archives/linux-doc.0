Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E46405ADC
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774365530; cv=pass; b=An3CVPnkmQpNsA7jtTCBPH7PvH47OUBfVFTvqLSMKI+eUBaX7jRWrJIbPkKnrJ+X6KSznntfS43cobR6ZQ//z1rPLdB71NgssfdsfNg1dAQyZn/Ne2ZZvjYs1tYuJbj4AqGUPILoAsvTK+tUp7jUcD0C265+WCcsKMa3lN9YEzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774365530; c=relaxed/simple;
	bh=JA8da+GLbuxrhcqHvIPGSt+fxFU+IrSdnOs7CNI16OY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pqdAU1gYRELE0EprWluR0g7C9GYEC2LElpUWZaCScaXNfAO0P8GRrNhros58bNzCTQE75GxURqoXYJs/bJ07rdC8IqBpSmM7qFnEa143PezhMAD3BFZAWeTdcS3eeNsj1lPOGpU6qIFxRxQ7QYcYPHhwbpB99CZ3J01Q0K7uJ9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l52vTuC1; arc=pass smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l52vTuC1"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-126ea4b77adso5805264c88.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 08:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774365527; cv=none;
        d=google.com; s=arc-20240605;
        b=NTqPYMh6fn1X8LWWKj/yRO+xtwl/MbNALOPRCDkVqvQ8MA06yWKIx5sysn9l6p/EfW
         ipSc2YMLvAGnu2QoK7Pi4AmAbmmREZHiO0JxEimjsV9vuc+ZNLfQLY4vLOPqHXtOFk4O
         N9z9tKokgWjAFx0e0OxDIL9ug+h96gwTk3i4vqVa14FodK0OAtUgaSkMZom8/TL0LeLy
         c+MBeWXXFQ6MMic5mFRIRuX+42+KmMJ8Yafm5y07A8fpZKUCHDNO8ehM0BZM3KZUTQYJ
         inFh275oKr1d8RbBOT9ubmSDYmJTCcie5E3B2L7/2a0DThgd0W/h60Cux4c/z5rpnB3q
         92/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=W9FV5RYFQeg+HE5ofgNg9Ixu4fovVf0+iogwkKnKz5M=;
        fh=hhozAME/FO4bJjt4lHrj5w6SDOk+NdVPmr4Uvx0+UjE=;
        b=Lolw7z12NLvdOJu5mwmn5S1vHTw/ByXGl1x2bXAEF55/Xb1eVGpYWgFvgee3ez1RVk
         0jyAyylKxhEU0fb/W1MnXAuGupyl0VqJ5UASCQ50t0pj5sieAbTxyvvVpenclPXpU9a6
         80k1CkDfCdxmzWS4ScbGhDxgZXf7DmrwiQCRdM6dD04oJS8Q09oceHd/y95nYoBv2/ka
         Tknvrrua3eZw3FOJ6TY2XB3AkkqZsmR1yi5j6Gj5lLx3CFuBqEUF3n/3uC/HSX0RQbuQ
         vgKBxOkaoilrU9VORuHAUNmJeM42JX0nsBgqftOxdVBhNxfzpqzpTb6oPxnE8M1GvS7S
         KGlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774365527; x=1774970327; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W9FV5RYFQeg+HE5ofgNg9Ixu4fovVf0+iogwkKnKz5M=;
        b=l52vTuC1/a7ucqD+SEkE752yyM7DNjjchD8Ch3Bs2cBiousuJsPoIlczwTiaKl8KXZ
         QcCKV0vNFtRBQLe6aI27xfxevDIHE612vvKxS1YZH8x+I/I9PoXrQlajehrRs5XxCzzF
         FH7/zUg33alPLuijA+QEFdOtm+YAXUhtNRXrXpjRRS4r1sgCD7U+TfyGo6vbzJL+2GmY
         qK4Rs2PaPhWivFq+GyH1LCcGF6xX7BeXe0HC5kmRVEiDt5JQLHrwNKjATp2hGfe/kx+X
         ORGVe4R5tWtR44/Xz7Z7RFvcuYPwD+BB2RX9tcVOxbOropQBlzKtRRCTg/+NuEdFbB/G
         P5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774365527; x=1774970327;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W9FV5RYFQeg+HE5ofgNg9Ixu4fovVf0+iogwkKnKz5M=;
        b=S4kBh2UszVA3PFcaGxVHGs3vS1n8WYGQv3EWzCb8+4f025DzXD8CshmZiQpyylwz9W
         Eki6Cw0V+cN5tGE3+HNZJBoLShav6wEUglu8rPCudb/bbuS1S+qPw98/mrA2233emhL3
         KjjMr1ZI39q0CluoSUSv1Q1o/ac5UZ6yBjApdeoV/bwE2krhAyPDpKOJI4dWlnEZly6K
         Z5G9Zk2477wlo6CeYRSifCTf+f7Xro1rtb8L2n81ES/7davbdbTerTwfIQ+LwUoEtB6o
         snewFHniqnOM/PRCGvA7rn6cPD779GKMEIuPlSjv0WDsO6Y2737IhS6j+EtrdR20nW/h
         b76g==
X-Forwarded-Encrypted: i=1; AJvYcCVHhEfVZiVPOmYYUnSs5FFhQH1/RDefj5IK1lEuLpK+vs8RLn/obXyzE4+m6yAtRNk1LiCY/r0Mqm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcdSG2iooWV7zK3NczQs/2sPN6IVNwA87r669D1MSbenr2n2hc
	mxSn9V98K9qoSPEH8h6LnWxNUUQaCzA3uto61DphOrRY4PYmAql0oiP5cHQ7zwToFymFspAQ6BX
	XsQapvCRZVvj/e7sCx0t/7Orh/dOFop4=
X-Gm-Gg: ATEYQzxyNmBGsGFu86wbWVOCk+yQ3Lped+vm8fCVNTKz01YjZGZOAaQagLJLGEiKNFU
	DwVPH6SOe1Cc3jPiGPmzSTOKlkoUBp2b+xTGP3Syy46HIio/1gyaWGLTMIUyg6IFzoZkA2D1dr6
	YYBMWCs+d0DhRpokqyaOU1ATS+QTfRPgg6kgtaaBkop7POYo2etEbJAoSaBNa20SuCipg9OAesZ
	81UN5Wv+ucuklX1mMn8luc22xR6TUgnft5YmQrx8LEw3ISjzMykyPcemLTu6QWdaQ/qQUaMFCBN
	2S0TcoWkkqOk18mbDi3o21Ljb+M6ImhYV5AHzuThIw==
X-Received: by 2002:a05:7022:f20a:b0:11b:9b98:aa4b with SMTP id
 a92af1059eb24-12a7265dfe8mr7065060c88.6.1774365526826; Tue, 24 Mar 2026
 08:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?Q?V=C3=ADctor_Pando?= <tovictakamine@gmail.com>
Date: Tue, 24 Mar 2026 16:18:34 +0100
X-Gm-Features: AaiRm50hx4tcPSZmAKZkteZrJx0fhgas7Z5w167IRf5IERgrZ5fHJ-OIjgh9kVE
Message-ID: <CAH1pyqGhOOwx5Co+oT=N91votB0OVeTGL6NKXErNA5mxCU8NWA@mail.gmail.com>
Subject: 
To: "corbet@lwn.net" <corbet@lwn.net>
Cc: "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 1661cbef48706b600e613908e4e08ef3ec7214fa Mon Sep 17 00:00:00 2001
From: tovicito <tovictakamine@gmail.com>
Date: Tue, 24 Mar 2026 16:01:56 +0100
Subject: [PATCH] docs: driver-api: fix 6 spelling typos in
 Documentation/driver-api

Signed-off-by: tovicito <tovictakamine@gmail.com>
---
 Documentation/driver-api/acpi/acpi-drivers.rst         | 2 +-
 Documentation/driver-api/cxl/platform/acpi/cedt.rst    | 2 +-
 Documentation/driver-api/cxl/platform/bios-and-efi.rst | 2 +-
 Documentation/driver-api/dmaengine/pxa_dma.rst         | 2 +-
 Documentation/driver-api/libata.rst                    | 2 +-
 Documentation/driver-api/pci/p2pdma.rst                | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/acpi/acpi-drivers.rst
b/Documentation/driver-api/acpi/acpi-drivers.rst
index b1fbbddb8..376b6d8a6 100644
--- a/Documentation/driver-api/acpi/acpi-drivers.rst
+++ b/Documentation/driver-api/acpi/acpi-drivers.rst
@@ -47,7 +47,7 @@ generally be avoided and so struct acpi_driver
objects should not be used.
 Moreover, a device ID is necessary to bind a driver directly to an ACPI device
 node, but device IDs are not generally associated with all of them.  Some of
 them contain alternative information allowing the corresponding pieces of
-hardware to be identified, for example represeted by an _ADR object return
+hardware to be identified, for example represented by an _ADR object return
 value, and device IDs are not used in those cases.  In consequence, confusingly
 enough, binding an ACPI driver to an ACPI device node may even be impossible.

diff --git a/Documentation/driver-api/cxl/platform/acpi/cedt.rst
b/Documentation/driver-api/cxl/platform/acpi/cedt.rst
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
diff --git a/Documentation/driver-api/cxl/platform/bios-and-efi.rst
b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
index a4b44c018..5d918b06f 100644
--- a/Documentation/driver-api/cxl/platform/bios-and-efi.rst
+++ b/Documentation/driver-api/cxl/platform/bios-and-efi.rst
@@ -277,7 +277,7 @@ The CFMWS field of the CEDT has special
restriction bits which describe whether
 the described memory region allows volatile or persistent memory (or both). If
 the platform intends to support either:

-1) A device with multiple medias, or
+1) A device with multiple media, or
 2) Using a persistent memory device as normal memory

 A platform may wish to create multiple CEDT CFMWS entries to describe the same
diff --git a/Documentation/driver-api/dmaengine/pxa_dma.rst
b/Documentation/driver-api/dmaengine/pxa_dma.rst
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
diff --git a/Documentation/driver-api/libata.rst
b/Documentation/driver-api/libata.rst
index 93d97fe78..28b8437f6 100644
--- a/Documentation/driver-api/libata.rst
+++ b/Documentation/driver-api/libata.rst
@@ -286,7 +286,7 @@ and other exceptional conditions. The primary
responsibility of an
 implementation is to call :c:func:`ata_std_error_handler`.

 :c:func:`ata_std_error_handler` will perform a standard error handling sequence
-to resurect failed devices, detach lost devices and add new devices (if any).
+to resurrect failed devices, detach lost devices and add new devices (if any).
 This function will call the various reset operations for a port, as needed.
 These operations are as follows.

diff --git a/Documentation/driver-api/pci/p2pdma.rst
b/Documentation/driver-api/pci/p2pdma.rst
index 280673b50..d3f406cca 100644
--- a/Documentation/driver-api/pci/p2pdma.rst
+++ b/Documentation/driver-api/pci/p2pdma.rst
@@ -38,7 +38,7 @@ for all usage refcounts to reach zero.
 At the lowest level the P2P subsystem offers a naked struct p2p_provider that
 delegates lifecycle management to the providing driver. It is expected that
 drivers using this option will wrap their MMIO memory in DMABUF and use DMABUF
-to provide an invalidation shutdown. These MMIO addresess have no
struct page, and
+to provide an invalidation shutdown. These MMIO addresses have no
struct page, and
 if used with mmap() must create special PTEs. As such there are very few
 kernel uAPIs that can accept pointers to them; in particular they
cannot be used
 with read()/write(), including O_DIRECT.
-- 
2.53.0
