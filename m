Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE76F386C09
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 16:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369582; cv=none; b=D4ltj66xMNf2sn0HhfIn+l31VsoNiE1M+EUPBWliB5VstSyqFB0cA5LW4W4bzUdvqSDjNR61MNsdYNbymuolwJWPrdMFF/5IRLF7JScHkvto6UB64EjWrze08HnyvfUvovFw7HW2F3EJS//sfbqO1Q3J4aQ8R2I+bE621G/dQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369582; c=relaxed/simple;
	bh=3v151Qen0b4E/inanxDWkRJV54jpo5u5VHN+UvotGzY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rDynLHJvRKTzE01fsHGLjz6g4/E7iTTE/tPa2nxVyv8YYpVJ1M1uMjRB6S4QD3LKykAifMvFp8dauyePhZjSSerSk4em/Ys5AwiFo+TlhystaJyPyvF5tnPnNkje6mXjxIF2erX/gL5VwED+hbLPdhZe7E6JS5nRFLL+q+7F4UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sy3pW7as; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sy3pW7as"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-439b7c2788dso2675752f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 09:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774369579; x=1774974379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I1Rmsmqrunx48sAF0HdJPm7VSOjVaUy00AsOQ1hkViQ=;
        b=sy3pW7aslmvEqJJMJO6JWD1tpF3hXJFs1ey50Ia2TO67REkjN3S4uKXwqv0n7t6Fhg
         T2yjw5i7HTmAy1sliXjjoeGJmPDjxLQOUl471A1fzzQL2dl9tNlSKESK8HAAzly7C3eG
         WonGrUdkFTzqtvP1uc7P1cf35l6WMG4KLzBGyGIPxeDiopuA3pv24pTFGBw9GIEwVFeh
         XVwli8dz1M/2b8gO1CG9QRifD4obuyhlD9hUP8Gckv6o5YLGf2lYyp3Zw1q/iTYxxxjt
         1fR3SkmFkQwy1GKBgA8dSRTBxTbufiCB6ckFB5hr6/t1itDewrBhLI/Jx/9AWv2zXkzh
         WBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369579; x=1774974379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1Rmsmqrunx48sAF0HdJPm7VSOjVaUy00AsOQ1hkViQ=;
        b=lhclsqtvKf+cGIg2eQyuNWaoEAmtHIsFxA2RzZ2CzZIJjbgGUbqXK3P0es1ckSBGyv
         /fDgWutmGQqz+L7uyt9yRbxe8iKn7yl0nC+5aVIbydMk+ZlnCeXvGVHeohg/sJkxjx+6
         W1J5dNVhxHDxHFAk66XlGVRjE5ezJG+aiL7GMH1HKRi+dNM/hudRPBucZVq3f7OPRRXZ
         f+8ivlePqbwJVq3hYc6/IA/m5Mh7Zy6pjam4YHbPJo7p1rUCjzyqFki6giwt2f9THnXG
         F+N2rPObQxML2yAkm/K88rpuGWyuGIdZ/iCyYPALlkWvwzp7HKMbmdl2s0YuKD7CRnGa
         uUYg==
X-Forwarded-Encrypted: i=1; AJvYcCWkp0gxA0RJYEQfgrjkiuIEI/bJ1p0+X+zjOV2m6RG2G+m/gQnvTHgyYDYTdXZwORaPvJLa7WcpZZI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2BBuxGsLj+ZZMajbLObI84RWhT69lK0gNzJX05CelsAbqwWUq
	1PlLiz4i5oLTDXCk7rqFb3N9Ghe5SlMpCK6HKy7JKhxb5LPQCRWJLB1xS5vW8aCRH7I=
X-Gm-Gg: ATEYQzxMAKMnl+t3i9XtUwy3rZwrleGUo1PqIKXm1+PXFDPBPLJsa8CTzR6ZKwvet3S
	XBhFHy1IqoA0J+s3JN6556DF10lwH+t2xy8Gm8BNEH6Bk6TFzcfM8OnnB8YBt3hwYhJigd7Qw3q
	4YKqO1SNTLsmjEvN0rBvTcKqJBQuEa5KVXqVhPKS7tFE9zyBpW6HBAfVDuXz7dD5rCjszZ7AGQx
	qdOEV8YnRfsOjNAgLccp0TBpPlzzckBMrdgA7frnN8ixF8tqyRTrxhXoZ8EsaxXcOBe+82RDI9L
	KAV7Nt03NznvBEPL2SWFTAA903OfF55hJwgNpN/Gg/WGT9MjeI9yWpTTCgVo4U98dgzNGlAdKlR
	KOPl5TLmZzWW6Em7moehEM7Z/ZW1j2ydJ4oV0XZ9wagdkhDx3Kjs9L8JKew3a/rtG9aTAVO/7iq
	eUuQlT+i4rjw0RPCcyO9cMIDTq5/4bO7AzsMoz5M6njof+
X-Received: by 2002:a05:6000:2007:b0:43a:378:b48b with SMTP id ffacd0b85a97d-43b88a1aad8mr166074f8f.37.1774369578643;
        Tue, 24 Mar 2026 09:26:18 -0700 (PDT)
Received: from localhost.localdomain ([2a0c:5a87:9504:9400:da3a:ddff:feee:f1b0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bdaf8sm44754836f8f.13.2026.03.24.09.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:26:18 -0700 (PDT)
From: =?UTF-8?q?Tom=C3=A1s=20Pando?= <tovictakamine@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Tom=C3=A1s=20Pando?= <tovictakamine@gmail.com>
Subject: [PATCH v2] docs: driver-api: fix 6 spelling typos in Documentation/driver-api
Date: Tue, 24 Mar 2026 17:24:48 +0100
Message-ID: <20260324162448.5586-1-tovictakamine@gmail.com>
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

