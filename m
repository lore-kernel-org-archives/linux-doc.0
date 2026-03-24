Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB8037C107
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 15:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367364; cv=none; b=Nejhq5drHXMDfs7ON//T/m8cHQlo85jco9Q1Kqn4tcJ6HNI4UJkPmvBcngr2FEZTGotMK+N/nqmY4kTEvtw0IgrbQztJEFewyswNA4xCBtC4HqliU8D1SZoNEdkOmeWC+tf7+zS6eluD+Eiocgu0lFuVkDMX5LA83DC5lJwh0kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367364; c=relaxed/simple;
	bh=+MP5OZfZtfhlhRXIz/gQp3JJyWaLjXeKG3UkGoZNA2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2IXexmcnrfdy1F/C+d/it/lQTcu+s19feVXD3t3W8Vw4yjIte1ZYX3qkkkhGi7HYd3KYY6fR5sC0gnhkjUgpVulDn1dZUhdQbE8Rmy0ziXCf+61VoC5hN1E0WjkyinjN7Nvuscbd6xRRUIWsb1GVH3bL3CiNUqIXG8jZM/tRYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvGhK2rs; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvGhK2rs"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso47175115e9.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 08:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774367361; x=1774972161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PfSGofvTqm76QjsXejgeUzCgTv8V+LAKQZ3dxfOOqYU=;
        b=VvGhK2rsl2KR0ZM6xBq+2tAjPffNMCZKer1Xi3WNS6Q1NANgSlwMtbGxZiepGNZWOO
         YRJ8nPkDq1FosIo1ToJXyTyqIz3t6VXu6Lbhx3kwRaknG2DmmdjTkhRH3MFOlfPV2dSn
         V2CNVpQ5vLUaZcn9FmIGeoz1KNuc83domvjgy9nXasctKd6Oek0ggUUH8cUSSFR2Q1A3
         KnX3VnxWqAOyHjtb3m/McKHOlnZyMm+I1txL74e6kQj0Ak3GsGEFUbFtIezJJp3jjKEG
         gmIuqcrDgwWf5xhAqMm21MK7YVuLlEEUFK4F2AB/GX2ap9iypmHXdxzl4RTJqe3GgWBy
         zf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367361; x=1774972161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfSGofvTqm76QjsXejgeUzCgTv8V+LAKQZ3dxfOOqYU=;
        b=Xx0yxX80GQ4Tky8u6ej05tDrsKsef14PfUQf0fcxi3U7w6ImyIZEM2ZJsokZMC9dwC
         C6qDwE1oKmLp1EO3RoeIjMlxuez5ycPzPJVhsp9X+yurrlYWr72ooa0ngXBQLwbUuX1p
         8NBY4ZUUQLX786q4bNIAOCLqzYeq+0+irMCgCmoFq05KLPJIJob4G5/L7qnHFNVg3XHq
         +5K9fQQmFjEzMAgUHgHXZFXsN+DAT8tJEeah1308ViRc6JNwqwNGZvZy0vB0WYh3/PMN
         NfyYHoxzEZTEg/ZMk8MFAaQzkIngbOgR60pq7edPVhoeQXqkhCNL+GbzS5Ewg8DyydRE
         6XMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN63UEGRHOh9tJIBLyZQwsJ1L3FTtvhnq75gWfpY12WYev0exLS2+n5vUFtTSrELuGrGtjCtArJr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR0duRznRddWn7C8jtau+ouoAue4lQMoCjIKxv5xOjF8XycX5I
	DNzb+EjFfNlc0E6cvBg9pmnzg5FWl5xuY6eZ+rEacNVSiuR2rDFoFt8Z
X-Gm-Gg: ATEYQzzddaTOivif6nQrche+NK8w5BPCfAHz+xpq4zcekRY0US5aWTEWWfR+6h94jkP
	QDQzBe/DHz8VOrCWSVnJAhQOdmYxLhDjmnFCHaHAEjsJezbu9EbwGyjimu3apB7Rypsa/2VjtWD
	qnhDpCld8k4lqe85/YlIDhzS1JDAFRHgG0bAqnhBOyAj8YKJZgxaz3BP2TjYxq92K7B2aQuUUef
	hl0PCXllYk0KPsjysZlz378wsPiawfuAbl/f5HrvK8gocOMa/K8VGbITmdmxvvoosH1Vbkr1Y+a
	MmxARRmcU0JvzG54SxJf0eiMoFZR2pWHPRbzFk/6q/GVhHjUQfpiIlcAHrqjVL4QtDeL4J3bJYv
	pYqDT4XGzIaE8Tc4SAjEfTFG7QWEwSu6PDSwAI8op1sJQ+SDBtY9kBLPDM61neNWWcj3prkbRII
	Tt1mYaHDt/OYpz/orX3LYIlzF75mQUAe9cNrF2qGzrScaa
X-Received: by 2002:a05:600d:1c:b0:483:badb:618e with SMTP id 5b1f17b1804b1-48715fd4787mr4010085e9.8.1774367360266;
        Tue, 24 Mar 2026 08:49:20 -0700 (PDT)
Received: from localhost.localdomain ([2a0c:5a87:9504:9400:da3a:ddff:feee:f1b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116f17f3sm54929865e9.1.2026.03.24.08.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 08:49:19 -0700 (PDT)
From: tovicito <tovictakamine@gmail.com>
To: corrbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tovicito <tovictakamine@gmail.com>
Subject: [PATCH] docs: driver-api: fix 6 spelling typos in Documentation/driver-api
Date: Tue, 24 Mar 2026 16:49:00 +0100
Message-ID: <20260324154900.4117-1-tovictakamine@gmail.com>
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

