Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B048320383;
	Mon,  5 Jan 2026 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632348; cv=none; b=sGRHYEFjLYt6c/myVyGrpAfzLtwhhNz9IIGZejR3FLFZlo9QyuCSYSjmjiAbjuieVnKAvYwiLVA4nQxUxL06oRSqEi2w6LAXYApe2ygmmQRABk83avrA83Jl8jRRweW/edFsXH00XqArrLjq7lwOF5iphjmnjHvSYtmm5/GEowI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632348; c=relaxed/simple;
	bh=C6eql9p/ad94rcfI0wx8v7YVZgYVcqqRLJPOYgSXxaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgYAJfkFFIZ0x2hYpHNai9klbOxFzQebP2jVdlp9LCjioL/wnaA8u0gsk/wzatR4uuh8aJ85bg113y5LEln4bEeBnEaVqEMBCXiXyLL3YJIrhw36u5A9Ghuz3xl25lX8iYab1YGqlv4eiC4pdjL+/gAqnYBW0qJR7uR6PsDHErs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTXXkEaS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTXXkEaS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1201C116D0;
	Mon,  5 Jan 2026 16:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767632345;
	bh=C6eql9p/ad94rcfI0wx8v7YVZgYVcqqRLJPOYgSXxaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KTXXkEaSn1qSxmg3X/H4hpPTj0ClyfZ0VysM8X/evDibdhBNIEqIpqRTQiHLfPSjQ
	 O7cxUL8dwnJPNV259iK2NZZUMClYbezs/R9K+JVV2srthxxDylExf3BuBp+3F3/GgF
	 OSIAlUaW5DCi2dZ4sAijlXSrA6oEVkWVQAq/MQZwjsMjjrtQ+hMCrFbqca/GnfLPpN
	 MfJicZnI0UTrfyEtipvhHGOkYeOLG1rGZTYXneZMG8ubqf6oFNYu1ZSZmlMYraCajg
	 44v/uE4G6GkGajG4xib9kC19CZgwZSBUyC41Y8ZY1WYAtWUZYmgfHtbHep7r9zOmDt
	 L+LgHDoV0hiDg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Graf <graf@amazon.com>,
	Jason Miu <jasonmiu@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 6/6] kho/abi: add memblock ABI header
Date: Mon,  5 Jan 2026 18:58:39 +0200
Message-ID: <20260105165839.285270-7-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105165839.285270-1-rppt@kernel.org>
References: <20260105165839.285270-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Introduce KHO ABI header describing preservation ABI for memblock's
reserve_mem regions and link the relevant documentation to KHO docs.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 Documentation/core-api/kho/abi.rst            |  6 ++
 .../kho/bindings/memblock/memblock.yaml       | 39 ----------
 .../kho/bindings/memblock/reserve-mem.yaml    | 40 -----------
 include/linux/kho/abi/memblock.h              | 72 +++++++++++++++++++
 mm/memblock.c                                 |  4 +-
 5 files changed, 79 insertions(+), 82 deletions(-)
 delete mode 100644 Documentation/core-api/kho/bindings/memblock/memblock.yaml
 delete mode 100644 Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml
 create mode 100644 include/linux/kho/abi/memblock.h

diff --git a/Documentation/core-api/kho/abi.rst b/Documentation/core-api/kho/abi.rst
index 1d9916adee23..2e63be3486cf 100644
--- a/Documentation/core-api/kho/abi.rst
+++ b/Documentation/core-api/kho/abi.rst
@@ -16,6 +16,12 @@ vmalloc preservation ABI
 .. kernel-doc:: include/linux/kho/abi/kexec_handover.h
    :doc: Kexec Handover ABI for vmalloc Preservation
 
+memblock preservation ABI
+=========================
+
+.. kernel-doc:: include/linux/kho/abi/memblock.h
+   :doc: memblock kexec handover ABI
+
 See Also
 ========
 
diff --git a/Documentation/core-api/kho/bindings/memblock/memblock.yaml b/Documentation/core-api/kho/bindings/memblock/memblock.yaml
deleted file mode 100644
index d388c28eb91d..000000000000
--- a/Documentation/core-api/kho/bindings/memblock/memblock.yaml
+++ /dev/null
@@ -1,39 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-title: Memblock reserved memory
-
-maintainers:
-  - Mike Rapoport <rppt@kernel.org>
-
-description: |
-  Memblock can serialize its current memory reservations created with
-  reserve_mem command line option across kexec through KHO.
-  The post-KHO kernel can then consume these reservations and they are
-  guaranteed to have the same physical address.
-
-properties:
-  compatible:
-    enum:
-      - reserve-mem-v1
-
-patternProperties:
-  "$[0-9a-f_]+^":
-    $ref: reserve-mem.yaml#
-    description: reserved memory regions
-
-required:
-  - compatible
-
-additionalProperties: false
-
-examples:
-  - |
-    memblock {
-      compatible = "memblock-v1";
-      n1 {
-        compatible = "reserve-mem-v1";
-        start = <0xc06b 0x4000000>;
-        size = <0x04 0x00>;
-      };
-    };
diff --git a/Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml b/Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml
deleted file mode 100644
index 10282d3d1bcd..000000000000
--- a/Documentation/core-api/kho/bindings/memblock/reserve-mem.yaml
+++ /dev/null
@@ -1,40 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-title: Memblock reserved memory regions
-
-maintainers:
-  - Mike Rapoport <rppt@kernel.org>
-
-description: |
-  Memblock can serialize its current memory reservations created with
-  reserve_mem command line option across kexec through KHO.
-  This object describes each such region.
-
-properties:
-  compatible:
-    enum:
-      - reserve-mem-v1
-
-  start:
-    description: |
-      physical address (u64) of the reserved memory region.
-
-  size:
-    description: |
-      size (u64) of the reserved memory region.
-
-required:
-  - compatible
-  - start
-  - size
-
-additionalProperties: false
-
-examples:
-  - |
-    n1 {
-      compatible = "reserve-mem-v1";
-      start = <0xc06b 0x4000000>;
-      size = <0x04 0x00>;
-    };
diff --git a/include/linux/kho/abi/memblock.h b/include/linux/kho/abi/memblock.h
new file mode 100644
index 000000000000..fbfb2eb1b1cf
--- /dev/null
+++ b/include/linux/kho/abi/memblock.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _LINUX_KHO_ABI_MEMBLOCK_H
+#define _LINUX_KHO_ABI_MEMBLOCK_H
+
+/**
+ * DOC: memblock kexec handover ABI
+ *
+ * Memblock can serialize its current memory reservations created with
+ * reserve_mem command line option across kexec through KHO.
+ * The post-KHO kernel can then consume these reservations and they are
+ * guaranteed to have the same physical address.
+ *
+ * The state is serialized using Flattened Device Tree (FDT) format. Any
+ * modification to the FDT structure, node properties, or the compatible
+ * strings constitutes a breaking change. Such changes require incrementing the
+ * version number in the relevant `_COMPATIBLE` string to prevent a new kernel
+ * from misinterpreting data from an old kernel.
+ *
+ * Changes are allowed provided the compatibility version is incremented.
+ * However, backward/forward compatibility is only guaranteed for kernels
+ * supporting the same ABI version.
+ *
+ * FDT Structure Overview:
+ *   The entire memblock state is encapsulated within a single KHO entry named
+ *   "memblock".
+ *   This entry contains an FDT with the following layout:
+ *
+ *   .. code-block:: none
+ *
+ *	/ {
+ *		compatible = "memblock-v1";
+ *
+ *		n1 {
+ *			compatible = "reserve-mem-v1";
+ *			start = <0xc06b 0x4000000>;
+ *			size = <0x04 0x00>;
+ *		};
+ *	};
+ *
+ * Main memblock node (/):
+ *
+ *   - compatible: "memblock-v1"
+
+ *     Identifies the overall memblock ABI version.
+ *
+ * reserved_mem node:
+ *   These nodes describe all reserve_mem regions.
+ *
+ *   - compatible: "reserve-mem-v1"
+ *
+ *     Identifies the ABI version of reserve_mem descriptions
+ *
+ *   - start: u64
+ *
+ *     Physical address of the reserved memory region.
+ *
+ *   - size: u64
+ *
+ *     size in bytes of the reserved memory region.
+ */
+
+/* Top level memblock FDT node name. */
+#define MEMBLOCK_KHO_FDT "memblock"
+
+/* The compatible string for the memblock FDT root node. */
+#define MEMBLOCK_KHO_NODE_COMPATIBLE "memblock-v1"
+
+/* The compatible string for the reserve_mem FDT nodes. */
+#define RESERVE_MEM_KHO_NODE_COMPATIBLE "reserve-mem-v1"
+
+#endif /* _LINUX_KHO_ABI_MEMBLOCK_H */
diff --git a/mm/memblock.c b/mm/memblock.c
index 905d06b16348..6cff515d82f4 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -21,6 +21,7 @@
 #ifdef CONFIG_KEXEC_HANDOVER
 #include <linux/libfdt.h>
 #include <linux/kexec_handover.h>
+#include <linux/kho/abi/memblock.h>
 #endif /* CONFIG_KEXEC_HANDOVER */
 
 #include <asm/sections.h>
@@ -2442,9 +2443,6 @@ int reserve_mem_release_by_name(const char *name)
 }
 
 #ifdef CONFIG_KEXEC_HANDOVER
-#define MEMBLOCK_KHO_FDT "memblock"
-#define MEMBLOCK_KHO_NODE_COMPATIBLE "memblock-v1"
-#define RESERVE_MEM_KHO_NODE_COMPATIBLE "reserve-mem-v1"
 
 static int __init reserved_mem_preserve(void)
 {
-- 
2.51.0

