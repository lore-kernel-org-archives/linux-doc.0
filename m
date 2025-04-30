Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7124E276027
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036672; cv=none; b=qETsDh2q0wgUhwGIM17TkWjcB0xthmhUDp3gKIFaeomdZxJk/f6Svd67+56ytqEFkbDs2h036C31gG6vF3DWKFp5ukehH0S0IwaIijwl5qLj4wXmfVz4S5DWdvOwuGpok9P7L3AHgV5AhkvPpCRtDP+7FsrjCXVl9UTYQVWJDUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036672; c=relaxed/simple;
	bh=ysuz2dbhIUwSeo5TDdeE8cXgy0TSC86HQ4jDAdk8nAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xo8ma8hb57U6nzYr9oyzlezgZwkm9lYPDrTuGAcE7+dshAbsYM6D3E8uzli89dCuwL2EGxtvPhUbuVS9215lM11H1DCMEWtAausWeG728vYj4elmbRtp9HFBZWyMf1CAtUSZhsAY/pIJiPpQN51HETr56AzKtVNmSx6CbKA6q0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=jBXdzvrm; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="jBXdzvrm"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4769f3e19a9so1713011cf.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036669; x=1746641469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wCLWtxPZo+z1qXRRB8VDvRxUJkg0/tm2oCyfTLu558=;
        b=jBXdzvrmhjYS681cdzRfZOZX8erz+5H7fGiauW0hgRhZ0066NIcnLFRpRIA0A4H+93
         jJgkH88krYXL00OjBjEgHRC8KpTzQFV0TNYFW7o1LV6jg7ndLFPtWMNd8kBOiHK/zI1Q
         oboQckc++P355FS5bvh9COUdmsPKV7LQB/3brr98vqpfWZjFqvKV5ds2plR4t3Qa5DwL
         SM6Jk7AGwkFJr3bANJuJ+DeWwRP5UnSmIM8C4sWwxKpl6+k6f7wPQUGKrIHB+MOV/TSe
         t0cM5soxi4AjRRpIRowrZPm+QXbaTzr4CQsPEzgM0LZPwmqsSMdefXoHgY24S23NfrxP
         rPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036669; x=1746641469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wCLWtxPZo+z1qXRRB8VDvRxUJkg0/tm2oCyfTLu558=;
        b=gWbKG7Va+Sg+9zC7hQpmBNtQXn3BBYwJlC+Qm22P73s7PyHyz8E/thD0HJoDImledO
         Obkzl/otMWF5VJ1p1O0LHG532Ew7MhKkrBiuMD9VaKIWY6cMQjHFvPWWgH7jprbNMDSt
         N3Y+eXZRcyTfMHZ4ThUaokVRivL7kjkoq0CO89HUYWtlDwkOyfrezTcVcX0Nbw3qQR95
         bPn3uP3WUhK7j8HDezp0xUEYOpEXYXSnZCrlSEFFj5w1V4oWI2Q7zuDEGAFKbXWrrTT9
         ADcyKn9zVZiopgTZauTqiwfwTlUYel1wTSYzOCnWJUG5q7fXKgbQrTd08FDBNjydRoUN
         Tqvw==
X-Gm-Message-State: AOJu0Yyn5bR5acWuFo64fLFwErn574cjC2hDsU7B+vCAAozuoNeNMtij
	vmSlbUII0AM11gdIp5z7PMwGYd4BcbL10nXuWkqJ9VL/vJn4Z3gykWTRB5q8MRo=
X-Gm-Gg: ASbGncu4maedwJY3E5s7p5KYvB5NmTdypLsbl11M8MNPAY07+csYkapGch0RQ5PndaO
	wvNlIzSycDm7kKiTszIvHd5ctKd3PUVm3ssVi1tdgdV0TalXruBgSXICJFDQ4JU6Z4i1FeQSmC/
	v43kCygKA77cmMt5A9O8XL9mQ+7gi8/OekjKEzVlGbdZp5lkQigmaMEcaKGHdKHS8Kr75oX6glD
	6IC57e+fc75irZ5Z8iqbMvofxRG/D8BjcgqaaM9EeDeCmXHyf+Uxc2MvKncKOK9rKi2BfErN341
	ND/9ml0SxhsMBCNsUqBJoIa44h7lFhO3fT1F1iN/sFa34rCHzBlqv72Kc05epF9WkVI2bI9p890
	9MTXTa7O2NdQXY+d/3286YaRS8Num
X-Google-Smtp-Source: AGHT+IFZXlyw0vAGV8CcwH9mLxar0qE/OpSzEUJceMsLJiqWVmOB/kxElfqTZAE+Wa/7CGDcCw6Uwg==
X-Received: by 2002:a05:622a:a15:b0:477:6e6a:7cfe with SMTP id d75a77b69052e-489c0be6448mr59562341cf.0.1746036669411;
        Wed, 30 Apr 2025 11:11:09 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:11:09 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-cxl@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	dave@stgolabs.net,
	jonathan.cameron@huawei.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	vishal.l.verma@intel.com,
	ira.weiny@intel.com,
	dan.j.williams@intel.com,
	corbet@lwn.net
Subject: [RFC PATCH v2 06/18] cxl: docs/linux - overview
Date: Wed, 30 Apr 2025 14:10:36 -0400
Message-ID: <20250430181048.1197475-7-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430181048.1197475-1-gourry@gourry.net>
References: <20250430181048.1197475-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add type-3 device configuration overview that explains the probe
process for a type-3 device from early-boot through memory-hotplug.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/index.rst        |   3 +-
 .../driver-api/cxl/linux/overview.rst         | 103 ++++++++++++++++++
 2 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/driver-api/cxl/linux/overview.rst

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index 5fa66e668b49..284ac71bf292 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -31,9 +31,10 @@ that have impacts on each other.  The docs here break up configurations steps.
    platform/example-configs
 
 .. toctree::
-   :maxdepth: 1
+   :maxdepth: 2
    :caption: Linux Kernel Configuration
 
+   linux/overview
    linux/access-coordinates
 
 
diff --git a/Documentation/driver-api/cxl/linux/overview.rst b/Documentation/driver-api/cxl/linux/overview.rst
new file mode 100644
index 000000000000..f440d79d77d1
--- /dev/null
+++ b/Documentation/driver-api/cxl/linux/overview.rst
@@ -0,0 +1,103 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========
+Overview
+========
+
+This section presents the configuration process of a CXL Type-3 memory device,
+and how it is ultimately exposed to users as either a :code:`DAX` device or
+normal memory pages via the kernel's page allocator.
+
+Portions marked with a bullet are points at which certain kernel objects
+are generated.
+
+1) Early Boot
+
+  a) BIOS, Build, and Boot Parameters
+
+    i) EFI_MEMORY_SP
+    ii) CONFIG_EFI_SOFT_RESERVE
+    iii) CONFIG_MHP_DEFAULT_ONLINE_TYPE
+    iv) nosoftreserve
+
+  b) Memory Map Creation
+
+    i) EFI Memory Map / E820 Consulted for Soft-Reserved
+
+      * CXL Memory is set aside to be handled by the CXL driver
+
+      * Soft-Reserved IO Resource created for CFMWS entry
+
+  c) NUMA Node Creation
+
+    * Nodes created from ACPI CEDT CFMWS and SRAT Proximity domains (PXM)
+
+  d) Memory Tier Creation
+
+    * A default memory_tier is created with all nodes.
+
+  e) Contiguous Memory Allocation
+
+    * Any requested CMA is allocated from Online nodes
+
+  f) Init Finishes, Drivers start probing
+
+2) ACPI and PCI Drivers
+
+  a) Detects PCI devices is CXL, marking it for probe by CXL driver
+
+3) CXL Driver Operation
+
+  a) Base device creation
+
+    * root, port, and memdev devices created
+    * CEDT CFMWS IO Resource creation
+
+  b) Decoder creation
+
+    * root, switch, and endpoint decoders created
+
+  c) Logical device creation
+
+    * memory_region and endpoint devices created
+
+  d) Devices are associated with each other
+
+    * If auto-decoder (BIOS-programmed decoders), driver validates
+      configurations, builds associations, and locks configs at probe time.
+
+    * If user-configured, validation and associations are built at
+      decoder-commit time.
+
+  e) Regions surfaced as DAX region
+
+    * dax_region created
+
+    * DAX device created via DAX driver
+
+4) DAX Driver Operation
+
+  a) DAX driver surfaces DAX region as one of two dax device modes
+
+    * kmem - dax device is converted to hotplug memory blocks
+
+      * DAX kmem IO Resource creation
+
+    * hmem - dax device is left as daxdev to be accessed as a file.
+
+      * If hmem, journey ends here.
+
+  b) DAX kmem surfaces memory region to Memory Hotplug to add to page
+     allocator as "driver managed memory"
+
+5) Memory Hotplug
+
+  a) mhp component surfaces a dax device memory region as multiple memory
+     blocks to the page allocator
+
+    * blocks appear in :code:`/sys/bus/memory/devices` and linked to a NUMA node
+
+  b) blocks are onlined into the requested zone (NORMAL or MOVABLE)
+
+    * Memory is marked "Driver Managed" to avoid kexec from using it as region
+      for kernel updates
-- 
2.49.0

