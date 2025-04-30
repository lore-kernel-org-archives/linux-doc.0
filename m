Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF35A1922DE
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 00:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971966; cv=none; b=OcgHRUXFeTHblEzeZRVdeAROdXowc5mOQ6SwDOOJgR/T4JDi7HbSyIppg2UC7p5ezYQuRiB/fTfb5GLZo9RbEngACBvOuHhoF0zv13R+bDYqcj6DqQ8HYorqXSe4bG47Vxbh3gTdqHzix201tUcYVhkUFI+tvTbT43l3HkAqt4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971966; c=relaxed/simple;
	bh=BDXb7lgzBNxpVwjYFyJjd4t2j9sJSet0d7GASa7svQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nshHo6GW7gdOZMwSLHeNgMnHUFeSOFe5WfT2StpfcsB7PE1t8isSwBOgnrt5SvBUACtxuP9RbjdTnffWVzx8VfeSytJgLldPDHeXnvS8QBHIHmWcMsueEr0RJRqiBRkM+8jhHgAz52MVXIsd/Ww2m/3HIa4mBfB4LsQFOpjk0xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=D74bUmKd; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="D74bUmKd"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c59e7039eeso911113985a.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 17:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745971964; x=1746576764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rp9atE4oqYHZI7zGuWpnaPq/N7S8aRGjs0Vq4QAx9No=;
        b=D74bUmKdC8yw+6rYsyb5RBpIe7ez1AfZ614t7zjQOWnl7yC7wOIZGvzGjg7Woa28Tj
         C6yRWUSwOAybDK+KDlI6TM+1swzxA0HchazMtCLBgQMnCDoyih5y2MgahR9ubq6/ynvg
         WVoj3/aGWUIgNIhq6FGfdWhqcSwcq4yTLhbiSsO6bGWucrHkeV1JKx30Rir97cXAO7yb
         Qnmg3ISIXRRrhrbiNNkUTDLC43gzoXoaE2zZX7ZkGx4v1MCuF8s2vgfzPl+yVBq5s37y
         ExCNCpAwT9Eh7hSt9eOrVPDsuk/RbE01OsFwqWOXGtCkHFNmw2UYZDhVz1bRwNu5hXvX
         v+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971964; x=1746576764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rp9atE4oqYHZI7zGuWpnaPq/N7S8aRGjs0Vq4QAx9No=;
        b=qALRFuxd43+bcjGuhMZdlP3c6HfkpHFm03f7yXziWl6xRU5PuRQFc7prw9Om/wwRfY
         PTw3FPdsKxa5yCxLX9eatp7tMkEU3Aisks5p6iBaszYtkTegcY3RL02NhaFmpGr6aIc1
         U3QpKNFRSm2UfEz/+0Ts5pK7lSDP17+xQ8bgWeA+NzSXy4CQyhG8cYvz2mYU3e4bb7kJ
         2f9ikXpvE37uRZl+UU1uSONxscxY8DhQxjD6++0p7+E5byraZXoV8SmYCyeFdiow8QN2
         nYlFKp3tkmZosgaJJqoyzJe6wEI55zdy5zDi7F8z9Ffk9wB1isH7v1/bIfRNjxdBxctQ
         VOAQ==
X-Gm-Message-State: AOJu0YxgkAcloqoty+03J/KUNefAKI5IWGH6TLjXtLOAcdutij8b2URu
	QfvBjfRb9WOL+RmP4mZQIUFAMW31F9GHlOvXDBlgoamkdcBLCiO2boevq73a6Y0=
X-Gm-Gg: ASbGnct2aweonBzJgjg+YPh5jDCZHfjRYPFmQXGT2NK8WgK6ZnENIL5Raj/dSy6+a7J
	8yuM6r0/YMkFXNxdeOCsFhTpNOLAhPWnO914RMtnCTAKwFAASI4AcpbSVlBHlNKOoUX14+4lw8K
	SdBqCUqs1YLoaKY42Nf6WOyjx3taFdxdY8/N75KYnAWgG1Ypqq5fQl1ZoHxLWY14RckXnImCjOb
	jz0GPFr2jJdEADXwIYzg2l+UxnZZSP65JRG5Sy7y5GNJSkXGKYsv8spRjYCNw5bUwwDNaaYRpWE
	/qzJPcRRXBEqiI4rR1oP352lsqySEWtJMXVRMIA95jTONIByVhT4s30thD8kXsRAbnp9U8pae2y
	3jDOM1hsmPzOfhq7QtT6iKOAbCPSI
X-Google-Smtp-Source: AGHT+IFWuPCqJzafZiXkTM0FkbazmzhXWCCT/3TEiGPXkXbgX4OBk3+9TL3sm/DfypsQTK99+QJYgA==
X-Received: by 2002:a05:622a:1f8d:b0:477:4df:9a58 with SMTP id d75a77b69052e-489e4a8d38fmr11558301cf.18.1745971963895;
        Tue, 29 Apr 2025 17:12:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7a820esm87634411cf.41.2025.04.29.17.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:12:43 -0700 (PDT)
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
Subject: [RFC PATCH 06/17] cxl: docs/linux - overview
Date: Tue, 29 Apr 2025 20:12:13 -0400
Message-ID: <20250430001224.1028656-7-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430001224.1028656-1-gourry@gourry.net>
References: <20250430001224.1028656-1-gourry@gourry.net>
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
 .../driver-api/cxl/linux/overview.rst         | 104 ++++++++++++++++++
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/driver-api/cxl/linux/overview.rst

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index afc66759eed2..01c0284fc273 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -32,9 +32,10 @@ that have impacts on each other.  The docs here break up configurations steps.
    platform/example-configs
 
 .. toctree::
-   :maxdepth: 1
+   :maxdepth: 2
    :caption: Linux Kernel Configuration
 
+   linux/overview
    linux/access-coordinates
 
 
diff --git a/Documentation/driver-api/cxl/linux/overview.rst b/Documentation/driver-api/cxl/linux/overview.rst
new file mode 100644
index 000000000000..33017ccb84f1
--- /dev/null
+++ b/Documentation/driver-api/cxl/linux/overview.rst
@@ -0,0 +1,104 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Overview
+########
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
+      * IO Resources are created for CFMWS entry
+
+  c) NUMA Node Creation
+
+    * ACPI CEDT and SRAT table are used to create Nodes from Proximity domains (PXM)
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
+  a) Detect CXL device, marking it for probe by CXL driver
+
+  b) This portion will not be covered specifically.
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
+      * DAX kmem IO resource creation
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

