Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981D62638A1
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036666; cv=none; b=p0CWeP0iCDbRhCgVE/gqx2I4v0KIphZtZqcMjwJgcwRXMVeXd3Yjq6RnJkt5Jp0BMp+baSmanfWr8E2TpltZjEXn7fimX22GdyQ2JmOxkK2PCMy660VRzsebice621C4MSz+PM5b44IecuJ+7PjIaDiEg6gxLj7lWd9ObYRiBIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036666; c=relaxed/simple;
	bh=rRr+qcLZrtnYg2c9lYmkQcR+1K4cfa1JZgb5Te9T7QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U67Od+snmPZ8s/ORmgADrT39cLIUIblnDmL63lr71SmYRaiqDXyFxq4eRr9s4zMxcYtnxyYvqDN68b8WhauQD5mCNbF4hze/OfJZWjP7wCW3Bkd8oQ4flxhFrLYHY83KJ8Rf8axoiNi4Q7kPsO70sUVHsjOZLedApS5KeSZhCYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=eJa5kCIo; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="eJa5kCIo"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47698757053so2875851cf.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036663; x=1746641463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/j5BwxlV3klVmfErwodvPQTvZR5n5+OrQaN53q1h6A=;
        b=eJa5kCIoTFCFvnE7nTJXIJhVlgYPYgIOy0xebPYCoSgy95Reh3685AoHWfrc+Uv1vk
         /Gx+4VXVZMCh1NvrMWFOKnBLIbhHv7YtfHk1xZlMR8kle/SwND3TvXuAjugG0Hqrk2mY
         Ajn8Amu03n5mo0FDuCyxXkUmrt/hD3fZYK1S9rJQv7Wisv1JTmqAVe0+wfPwcAIPL2fg
         HSsflqZcVPmQ60c6LF2tUvaPIrPZ2kWYeRz3ecKSkRQ9b/g5Xla6E5kHvjEi06sK7F6J
         0gTQH8QCSIerzr2+TwKkutFuIHUiwzqLr1//UFq4N06Rq4K6TX4G/sDh3vzOIHErutn/
         6q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036663; x=1746641463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/j5BwxlV3klVmfErwodvPQTvZR5n5+OrQaN53q1h6A=;
        b=KiSpJgqQ+UXODxQF8eNTSKR0kkYysv0LNj5poNURH3ePFzF/ehmzBUKyhSlKGyIO/1
         oRwkUR1Naypp/3ikGG4lRN6o8iIQlKr0b63qrBwelektGVn00crvqMts6yrW0fZERecb
         RreLOzNifleuKee4BEsnlC+CA3rDld5Y7t1Rd7nBfSkykz9JKKXi9iTK+YfFawePZHx+
         EHLtZNxMaTjKGfemx7sM1r9JCAH90RbwUZE636jMUQGKKWPmwmJ4zNPcaYOQAaObZ8Y5
         hVGmEmATu0Ji2yKulmE13yoHkJAT2kLA9gHIiE0A6wl/KA2Tn3VpJ4T2VCPa1BwD2nsI
         22kw==
X-Gm-Message-State: AOJu0YxJoOrk6m58xM8HHAHRLopzy7W3RVQfeJ8D1fYRlQBQQhXrG/4J
	5oZJTAUsl7VpqIHssIsWFBwMwYhqS0eYgVGJHGW2794+oIllSyomCVBA/slG5eY=
X-Gm-Gg: ASbGncvLd672Np3eA+VMZrM6Rl6R/gXTbmsmGbqDOv6TrextLCg2NapMkXwwVbwoL2p
	Xf/TPerOp+mljPjJqfKz/8Xlkq/BAi42J2r3SZUjqHTKewZE9lCR+/IXc0MIZpc0YdouRJGTkTY
	Djv1GZl5hkOEcYj5YQfCPo96YGNAipNis+SLG7bQqSlrC7DUEDPfCnrzZ8yaCRdCM8C2qNtAP9e
	Lv7K1SJehM6MVvfUaOwQIKlnkICGzz8o0R0DaOhLLkun5r+SbgKjruLb2qPgi6jHnulVZDeeoxE
	363IpwJQUIQK6QdkfBU+V+kgGQpGImdjCNStyngDdbrRCZT7+P+Y2qAUDUZNICOZJjbHYvNkmdc
	UM3oU11TPg3pRxcy1WSbA+HI/HOx7
X-Google-Smtp-Source: AGHT+IHDZtessbJycNGB3aPl1k1W+xYcbtzzI+zp3HWXp/EAxUK+kz6cS6edtsKGPIExvfbqIBqSiw==
X-Received: by 2002:a05:622a:5c1b:b0:47a:e63b:ec60 with SMTP id d75a77b69052e-489c4450e72mr67614731cf.27.1746036663333;
        Wed, 30 Apr 2025 11:11:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:11:02 -0700 (PDT)
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
Subject: [RFC PATCH v2 02/18] cxl: docs/devices - device reference and uefi placeholder
Date: Wed, 30 Apr 2025 14:10:32 -0400
Message-ID: <20250430181048.1197475-3-gourry@gourry.net>
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

Add a simple device primer sufficient to understand the theory
of operation documentation.

Add carve-out for CDAT with a TODO.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../driver-api/cxl/devices/device-types.rst   | 170 ++++++++++++++++++
 Documentation/driver-api/cxl/devices/uefi.rst |  10 ++
 Documentation/driver-api/cxl/index.rst        |   7 +
 3 files changed, 187 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/devices/device-types.rst
 create mode 100644 Documentation/driver-api/cxl/devices/uefi.rst

diff --git a/Documentation/driver-api/cxl/devices/device-types.rst b/Documentation/driver-api/cxl/devices/device-types.rst
new file mode 100644
index 000000000000..dfe8d4711987
--- /dev/null
+++ b/Documentation/driver-api/cxl/devices/device-types.rst
@@ -0,0 +1,170 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=====================
+Devices and Protocols
+=====================
+
+The type of CXL device (Memory, Accelerator, etc) dictates many configuration steps. This section
+covers some basic background on device types and on-device resources used by the platform and OS
+which impact configuration.
+
+Protocols
+=========
+
+There are three core protocols to CXL.  For the purpose of this documentation,
+we will only discuss very high level definitions as the specific hardware
+details are largely abstracted away from Linux.  See the CXL specification
+for more details.
+
+CXL.io
+------
+The basic interaction protocol, similar to PCIe configuration mechanisms.
+Typically used for initialization, configuration, and I/O access for anything
+other than memory (CXL.mem) or cache (CXL.cache) operations.
+
+The Linux CXL driver exposes access to .io functionalty via the various sysfs
+interfaces and /dev/cxl/ devices (which exposes direct access to device
+mailboxes).
+
+CXL.cache
+---------
+The mechanism by which a device may coherently access and cache host memory.
+
+Largely transparent to Linux once configured.
+
+CXL.mem
+---------
+The mechanism by which the CPU may coherently access and cache device memory.
+
+Largely transparent to Linux once configured.
+
+
+Device Types
+============
+
+Type-1
+------
+
+A Type-1 CXL device:
+
+* Supports cxl.io and cxl.cache protocols
+* Implements a fully coherent cache
+* Allow Device-to-Host coherence and Host-to-Device snoops.
+* Does NOT have host-managed device memory (HDM)
+
+Typical examples of type-1 devices is a Smart NIC - which may want to
+directly operate on host-memory (DMA) to store incoming packets. These
+devices largely rely on CPU-attached memory.
+
+Type-2
+------
+
+A Type-2 CXL Device:
+
+* Supports cxl.io, cxl.cache, and cxl.mem protocols
+* Optionally implements coherent cache and Host-Managed Device Memory
+* Is typically an accelerator device w/ high bandwidth memory.
+
+The primary difference between a type-1 and type-2 device is the presence
+of host-managed device memory, which allows the device to operate on a
+local memory bank - while the CPU sill has coherent DMA to the same memory.
+
+The allows things like GPUs to expose their memory via DAX devices or file
+descriptors, allows drivers and programs direct access to device memory
+rather than use block-transfer semantics.
+
+Type-3
+------
+
+A Type-3 CXL Device
+
+* Supports cxl.io and cxl.mem
+* Implements Host-Managed Device Memory
+* May provide either Volatile or Persistent memory capacity (or both).
+
+A basic example of a type-3 device is a simple memory expanded, whose
+local memory capacity is exposed to the CPU for access directly via
+basic coherent DMA.
+
+Switch
+------
+
+A CXL switch is a device capacity of routing any CXL (and by extension, PCIe)
+protocol between an upstream, downstream, or peer devices.  Many devices, such
+as Multi-Logical Devices, imply the presence of switching in some manner.
+
+Logical Devices and Heads
+-------------------------
+
+A CXL device may present one or more "Logical Devices" to one or more hosts
+(via physical "Heads").
+
+A Single-Logical Device (SLD) is a device which presents a single device to
+one or more heads.
+
+A Multi-Logical Device (MLD) is a device which may present multiple devices
+to one or more devices.
+
+A Single-Headed Device exposes only a single physical connection.
+
+A Multi-Headed Device exposes multiple physical connections.
+
+MHSLD
+~~~~~
+A Multi-Headed Single-Logical Device (MHSLD) exposes a single logical
+device to multiple heads which may be connected to one or more discrete
+hosts.  An example of this would be a simple memory-pool which may be
+statically configured (prior to boot) to expose portions of its memory
+to Linux via the CEDT ACPI table.
+
+MHMLD
+~~~~~
+A Multi-Headed Multi-Logical Device (MHMLD) exposes multiple logical
+devices to multiple heads which may be connected to one or more discrete
+hosts.  An example of this would be a Dynamic Capacity Device or which
+may be configured at runtime to expose portions of its memory to Linux.
+
+Example Devices
+===============
+
+Memory Expander
+---------------
+The simplest form of Type-3 device is a memory expander.  A memory expander
+exposes Host-Managed Device Memory (HDM) to Linux.  This memory may be
+Volatile or Non-Volatile (Persistent).
+
+Memory Expanders will typically be considered a form of Single-Headed,
+Single-Logical Device - as its form factor will typically be an add-in-card
+(AIC) or some other similar form-factor.
+
+The Linux CXL driver provides support for static or dynamic configuration of
+basic memory expanders.  The platform may program decoders prior to OS init
+(e.g. auto-decoders), or the user may program the fabric if the platform
+defers these operations to the OS.
+
+Multiple Memory Expanders may be added to an external chassis and exposed to
+a host via a head attached to a CXL switch.  This is a "memory pool", and
+would be considered an MHSLD or MHMLD depending on the management capabilities
+provided by the switch platform.
+
+As of v6.14, Linux does not provide a formalized interface to manage non-DCD
+MHSLD or MHMLD devices.
+
+Dynamic Capacity Device (DCD)
+-----------------------------
+
+A Dynamic Capacity Device is a Type-3 device which provides dynamic management
+of memory capacity. The basic premise of a DCD to provide an allocator-like
+interface for physical memory capacity to a "Fabric Manager" (an external,
+privileged host with privileges to change configurations for other hosts).
+
+A DCD manages "Memory Extents", which may be volatile or persistent. Extents
+may also be exclusive to a single host or shared across multiple.
+
+As of v6.14, Linux does not provide a formalized interface to manage DCD
+devices, however there is active work on LKML targeting future release.
+
+Type-2 Device
+-------------
+
+Todo
diff --git a/Documentation/driver-api/cxl/devices/uefi.rst b/Documentation/driver-api/cxl/devices/uefi.rst
new file mode 100644
index 000000000000..a431a0e3d980
--- /dev/null
+++ b/Documentation/driver-api/cxl/devices/uefi.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========
+UEFI Data
+=========
+
+Coherent Device Attribute Table (CDAT)
+======================================
+
+todo
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index fe1594dc6778..8e9d024cdfac 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -15,6 +15,13 @@ that have impacts on each other.  The docs here break up configurations steps.
    theory-of-operation
    maturity-map
 
+.. toctree::
+   :maxdepth: 2
+   :caption: Device Reference
+
+   devices/device-types
+   devices/uefi
+
 .. toctree::
    :maxdepth: 1
    :caption: Linux Kernel Configuration
-- 
2.49.0

