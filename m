Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ECF27CCD7
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036679; cv=none; b=oLMC2ba4X9y3JtvcFU9mlMWmZSGsKRaiofBt5wsx7XeFAxxrWySS8UU4E1/P99ItRWBpLcgl9IM+8Oj7Dl5zXIxzXMHUAMc5B87gJgtp0OC2e/pvWpMViei0FtLQSm/auwu4BHStUHmA/iXFQnC3t82B4eGi31nl7gn98jQHG3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036679; c=relaxed/simple;
	bh=E0fGnn1yC6sz6lUQTwhlc9kcw7MwshD1qLPBTYZmzrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdikC+7pOQSC3RT2q7Lq4riqjwZ1K7kLBbr4p3vtJuinbhmRRr+FV5D9rUc2OZPZHtLgMRlcWTuM/N4EsJ5ZEduunR+m1hHa7OvXSOH4UfNwoGy3mFfiMa8OvPtlMgjAH/+BekYprTqoxRjdnki0s8bNZCaJIkUXsi0IUyn6hpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=BWUxOYyD; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="BWUxOYyD"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4775ce8a4b0so3081321cf.1
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036676; x=1746641476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TsZ6+zYHaMJgBEdBWYg9601BLk8goGA5gz8eLP6+mE=;
        b=BWUxOYyD6w3CACtFk9F9qtIrOuAWx5szhGtYjLSnaAtRnVZKYk192cXIaedb0E4oho
         lLh9cDGHsv/2utdV0speaE2ccauzKt/WhKcViuZCkICuufKZ+H8S3mVOXM/EOll7ziTA
         z1V+GfjTg0c11XWDPuIyWfOXmHcZisWLggqDkHxjkfzz87H05d3s2YPe6lw3i24KRyiN
         s6Cr9h7HP1yyqJgK0MxzQbbQ6XOJNTEdj57gh7XxVOGUGxSBxfPRUaBUHAIl3zllBQqV
         YqPvFH6o55DvJLfg9v44gpA6Btncv7jvvW4T4/AKHCey5F4DBMEuAnh92VQL+8kJl9k7
         xD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036676; x=1746641476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TsZ6+zYHaMJgBEdBWYg9601BLk8goGA5gz8eLP6+mE=;
        b=BONnwS91Dl1/s18O0hBdnZ3mHU5/Fai25lDWVFjA3I+MsVfgSsYk+QMm4szvnREOkQ
         CVeSu+Jmw4ux0dEfZjdqnoG+L4swQW71lUNrwAJ00PSXnklNWjqzEpBo8lMPp/811P3L
         fT714rsZK4b1LTNE6/QelGtnpo1AtuM8ttXQ6SbIFObdy0bkcaO2xlKxDCKNmld9xJiE
         nAqA2MxrsfkZoZJ5g2KsFE/dSN1umjIHgoHzdeHgQ7HguYxI7gZ4WNtUpjRPxnj/It7L
         PBiMr9fPW26R0JuvKxxTm6yDKEyVfft6vuz5syb5/A2VA6vzEx+wBqPl+ZU9M6EJ//aM
         TmIw==
X-Gm-Message-State: AOJu0YxsFGoK1UA6hFBAfBkJ+geegpXzvQC/5EJlpy2Ppg8vIqXQkcgQ
	w1dhf1MWh9BANppWCy6CTwSZ5OWyxKBQYIMpEuTZDzGPyznHGr7hFAMDkCOpvo4=
X-Gm-Gg: ASbGncuL9QH01MpgNw+lSz5CHdmZLb4tyLceiqpptYfIqQWdknbIKCZ0exX4nwgWT9V
	OJQ2vfS5qvP/5vPgQe4jq90M75unC5If3yntlqZPJMN8983ef/WjSxEMs4P/G2Zg07m3q4WAiiq
	mXTnqHRw7/fCWYhu/MkmoO9fQEEB6RKZ++ENG6oXL+ZuAQItrct9mWfRVMsMgtNa81ABZyY4aqQ
	iVVUzOGT9dX5pkOmfzh4s5cZgM46Kmb9iHCJMh6epP7RQoFwdXotI++HtlKdLU9k6Vt8BXtOTcO
	03HDD8eTKh2dA7GwcUBvacu574t96hvSEmsAj8E0XStaNOQN5PfUMB81JcsL70ejibsZ9jT4Zgv
	HB0FjcAZa6OD6Ir0p3qo2s0LO6xzr
X-Google-Smtp-Source: AGHT+IG3ItQI6gLiqIMLhoXsiguUrPuCVfwfwwyMO6/R6vP9My6N+B4ggvm/AG1Yhm/Q1yTCvwIDQg==
X-Received: by 2002:a05:622a:418c:b0:476:b461:249b with SMTP id d75a77b69052e-48ae7a1feaemr3415971cf.12.1746036676009;
        Wed, 30 Apr 2025 11:11:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:11:15 -0700 (PDT)
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
Subject: [RFC PATCH v2 10/18] cxl: docs/linux/dax-driver documentation
Date: Wed, 30 Apr 2025 14:10:40 -0400
Message-ID: <20250430181048.1197475-11-gourry@gourry.net>
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

Add documentation on how the CXL driver interacts with the DAX driver.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/index.rst        |   1 +
 .../driver-api/cxl/linux/cxl-driver.rst       | 115 ++++++++++++++++--
 .../driver-api/cxl/linux/dax-driver.rst       |  43 +++++++
 3 files changed, 149 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/driver-api/cxl/linux/dax-driver.rst

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index aa01b14862e1..965f133a1c92 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -37,6 +37,7 @@ that have impacts on each other.  The docs here break up configurations steps.
    linux/overview
    linux/early-boot
    linux/cxl-driver
+   linux/dax-driver
    linux/access-coordinates
 
 
diff --git a/Documentation/driver-api/cxl/linux/cxl-driver.rst b/Documentation/driver-api/cxl/linux/cxl-driver.rst
index 486baf8551aa..1a354ea1cda4 100644
--- a/Documentation/driver-api/cxl/linux/cxl-driver.rst
+++ b/Documentation/driver-api/cxl/linux/cxl-driver.rst
@@ -34,6 +34,32 @@ into a single memory region. The memory region has been converted to dax. ::
     decoder1.0   decoder5.0  endpoint5   port1  region0
     decoder2.0   decoder5.1  endpoint6   port2  root0
 
+
+.. kernel-render:: DOT
+   :alt: Digraph of CXL fabric describing host-bridge interleaving
+   :caption: Diagraph of CXL fabric with a host-bridge interleave memory region
+
+   digraph foo {
+     "root0" -> "port1";
+     "root0" -> "port3";
+     "root0" -> "decoder0.0";
+     "port1" -> "endpoint5";
+     "port3" -> "endpoint6";
+     "port1" -> "decoder1.0";
+     "port3" -> "decoder3.0";
+     "endpoint5" -> "decoder5.0";
+     "endpoint6" -> "decoder6.0";
+     "decoder0.0" -> "region0";
+     "decoder0.0" -> "decoder1.0";
+     "decoder0.0" -> "decoder3.0";
+     "decoder1.0" -> "decoder5.0";
+     "decoder3.0" -> "decoder6.0";
+     "decoder5.0" -> "region0";
+     "decoder6.0" -> "region0";
+     "region0" -> "dax_region0";
+     "dax_region0" -> "dax0.0";
+   }
+
 For this section we'll explore the devices present in this configuration, but
 we'll explore more configurations in-depth in example configurations below.
 
@@ -41,7 +67,7 @@ Base Devices
 ------------
 Most devices in a CXL fabric are a `port` of some kind (because each
 device mostly routes request from one device to the next, rather than
-provide a manageable service).
+provide a direct service).
 
 Root
 ~~~~
@@ -53,6 +79,8 @@ The Root contains links to:
 
 * `Host Bridge Ports` defined by ACPI CEDT CHBS.
 
+* `Downstream Ports` typically connected to `Host Bridge Ports`
+
 * `Root Decoders` defined by ACPI CEDT CFMWS.
 
 ::
@@ -150,6 +178,27 @@ device configuration data. ::
     driver    label_storage_size  pmem         serial
     firmware  numa_node           ram          subsystem
 
+A Memory Device is a discrete base object that is not a port.  While it the
+physical device it belongs to may host an `endpoint`, this relationship is
+not captured in sysfs.
+
+Port Relationships
+~~~~~~~~~~~~~~~~~~
+In our example described above, there are four host bridges attached to the
+root, and two of the host bridges have one endpoint attached.
+
+.. kernel-render:: DOT
+   :alt: Digraph of CXL fabric describing host-bridge interleaving
+   :caption: Diagraph of CXL fabric with a host-bridge interleave memory region
+
+   digraph foo {
+     "root0"    -> "port1";
+     "root0"    -> "port2";
+     "root0"    -> "port3";
+     "root0"    -> "port4";
+     "port1" -> "endpoint5";
+     "port3" -> "endpoint6";
+   }
 
 Decoders
 --------
@@ -322,6 +371,29 @@ settings (granularity and ways must be the same).
 Endpoint decoders are created during :code:`cxl_endpoint_port_probe` in the
 :code:`cxl_port` driver, and is created based on a PCI device's DVSEC registers.
 
+Decoder Relationships
+~~~~~~~~~~~~~~~~~~~~~
+In our example described above, there is one root decoder which routes memory
+accesses over two host bridges.  Each host bridge has a decoder which routes
+access to their singular endpoint targets.  Each endpoint has an decoder which
+translates HPA to DPA and services the memory request.
+
+The driver validates relationships between ports by decoder programming, so
+we can think of decoders being related in a similarly hierarchical fashion to
+ports.
+
+.. kernel-render:: DOT
+   :alt: Digraph of hierarchical relationship between root, switch, and endpoint decoders.
+   :caption: Diagraph of CXL root, switch, and endpoint decoders.
+
+   digraph foo {
+     "root0"    -> "decoder0.0";
+     "decoder0.0" -> "decoder1.0";
+     "decoder0.0" -> "decoder3.0";
+     "decoder1.0" -> "decoder5.0";
+     "decoder3.0" -> "decoder6.0";
+   }
+
 Regions
 -------
 
@@ -348,6 +420,17 @@ The interleave settings in a `Memory Region` describe the configuration of the
 `Interleave Set` - and are what can be expected to be seen in the endpoint
 interleave settings.
 
+.. kernel-render:: DOT
+   :alt: Digraph of CXL memory region relationships between root and endpoint decoders.
+   :caption: Regions are created based on root decoder configurations. Endpoint decoders
+             must be programmed with the same interleave settings as the region.
+
+   digraph foo {
+     "root0"    -> "decoder0.0";
+     "decoder0.0" -> "region0";
+     "region0" -> "decoder5.0";
+     "region0" -> "decoder6.0";
+   }
 
 DAX Region
 ~~~~~~~~~~
@@ -360,7 +443,6 @@ for more details. ::
     dax0.0      devtype  modalias   uevent
     dax_region  driver   subsystem
 
-
 Mailbox Interfaces
 ------------------
 A mailbox command interface for each device is exposed in ::
@@ -418,17 +500,30 @@ the relationships between a decoder and it's parent.
 
 For example, in a `Cross-Link First` interleave setup with 16 endpoints
 attached to 4 host bridges, linux expects the following ways/granularity
-across the root, host bridge, and endpoints respectively. ::
+across the root, host bridge, and endpoints respectively.
+
+.. flat-table:: 4x4 cross-link first interleave settings
+
+  * - decoder
+    - ways
+    - granularity
 
-                   ways   granularity
-  root              4        256
-  host bridge       4       1024
-  endpoint         16        256
+  * - root
+    - 4
+    - 256
+
+  * - host bridge
+    - 4
+    - 1024
+
+  * - endpoint
+    - 16
+    - 256
 
 At the root, every a given access will be routed to the
 :code:`((HPA / 256) % 4)th` target host bridge. Within a host bridge, every
-:code:`((HPA / 1024) % 4)th` target endpoint.  Each endpoint will translate
-the access based on the entire 16 device interleave set.
+:code:`((HPA / 1024) % 4)th` target endpoint.  Each endpoint translates based
+on the entire 16 device interleave set.
 
 Unbalanced interleave sets are not supported - decoders at a similar point
 in the hierarchy (e.g. all host bridge decoders) must have the same ways and
@@ -467,7 +562,7 @@ In this example, the CFMWS defines two discrete non-interleaved 4GB regions
 for each host bridge, and one interleaved 8GB region that targets both. This
 would result in 3 root decoders presenting in the root. ::
 
-  # ls /sys/bus/cxl/devices/root0
+  # ls /sys/bus/cxl/devices/root0/decoder*
     decoder0.0  decoder0.1  decoder0.2
 
   # cat /sys/bus/cxl/devices/decoder0.0/target_list start size
diff --git a/Documentation/driver-api/cxl/linux/dax-driver.rst b/Documentation/driver-api/cxl/linux/dax-driver.rst
new file mode 100644
index 000000000000..5063d2b675b4
--- /dev/null
+++ b/Documentation/driver-api/cxl/linux/dax-driver.rst
@@ -0,0 +1,43 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================
+DAX Driver Operation
+====================
+The `Direct Access Device` driver was originally designed to provide a
+memory-like access mechanism to memory-like block-devices.  It was
+extended to support CXL Memory Devices, which provide user-configured
+memory devices.
+
+The CXL subsystem depends on the DAX subsystem to generate either:
+
+- A file-like interface to userland via :code:`/dev/daxN.Y`, or
+- Engaging the memory-hotplug interface to add CXL memory to page allocator.
+
+The DAX subsystem exposes this ability through the `cxl_dax_region` driver.
+A `dax_region` provides the translation between a CXL `memory_region` and
+a `DAX Device`.
+
+DAX Device
+==========
+A `DAX Device` is a file-like interface exposed in :code:`/dev/daxN.Y`. A
+memory region exposed via dax device can be accessed via userland software
+via the :code:`mmap()` system-call.  The result is direct mappings to the
+CXL capacity in the task's page tables.
+
+Users wishing to manually handle allocation of CXL memory should use this
+interface.
+
+kmem conversion
+===============
+The :code:`dax_kmem` driver converts a `DAX Device` into a series of `hotplug
+memory blocks` managed by :code:`kernel/memory-hotplug.c`.  This capacity
+will be exposed to the kernel page allocator in the user-selected memory
+zone.
+
+The :code:`memmap_on_memory` setting (both global and DAX device local) dictate
+where the kernell will allocate the :code:`struct folio` descriptors for this
+memory will come from.  If :code:`memmap_on_memory` is set, memory hotplug
+will set aside a portion of the memory block capacity to allocate folios.  If
+unset, the memory is allocated via a normal :code:`GFP_KERNEL` allocation -
+and as a result will most likely land on the local NUM node of the cpu executing
+the hotplug operation.
-- 
2.49.0

