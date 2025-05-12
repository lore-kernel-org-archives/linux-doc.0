Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5424246790
	for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 16:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066908; cv=none; b=gw16dcF6LLHeyHUHr371gkomvmgs6zVbBCfbayLA+jz5PARKGB2UVUxS4wa7O+9RKS7vp4ZbEXIaa6sqThGONxDGUuaSQ18OvDw9CIvWG95k2PDtXRLzgVwLIXDP6A8O/40PPU2fHqXXX/J3v61VuCioMJZTlCfskfI1HlGH0sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066908; c=relaxed/simple;
	bh=bc+l52lzMgg34Vw41X2Wy/FxQj+yccNEeALSbRGK27Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uu0e5mG2F5NhLYHRoNp4hGe6LJFD06ugOF4tupm57glE02YEUxWxku9JgV0XoDlmV/HLIJB0HvFogrP1sTk3PHu/tX2FwiwPJD0dm10V/xBz9F+pkzuVP4kMwUerslGcFQ7+q0xb0xMb0dUpwFD5Gps9TnuRAfZyJ481DsTo3Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=PDDmKXyj; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="PDDmKXyj"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47662449055so26188251cf.1
        for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 09:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747066903; x=1747671703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3rVHINvuxD50BlXL+fWePXRUBl5vPBCCVNAK+caSv0=;
        b=PDDmKXyjwC0Hi98kXwfZpOo9d1PQrNrP6UxGJAh5Yu4ndqilfWNNpL0rDAz0R9g1gb
         8qtgdNlydJ3GaloDRqkRX4pXQTzFfjf7kiNGka/rW2VXWKi5n94pphP2KcJPXrEvsNs7
         P2mEXZyVPyXouiH6cYRE1RQnocnbmIB865nr6S6zDQbCA+dCU7gtqutpdi2WkKwhXLl6
         FlgFgZJf34QNTU419hu922O41Gyw1l5ETplsWLyE6v/H5mM6F8bvk7MrGT8uojKtUNwA
         4e6Hx7KzouoqbHDAG6x9mdW5y3pHPzCILbRH4cDQsS+Sl8YIz0XQN0wjT0/NcmoaP+T5
         UVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066903; x=1747671703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3rVHINvuxD50BlXL+fWePXRUBl5vPBCCVNAK+caSv0=;
        b=uo3O5e37ytcIm9DxTdW/EAH1jlzq0ffU/eBsNPJBNkyW5aNj2qA+09JJ9+8M404UPj
         3WQjJ3vXmc23V+c6T4+KEVqoM1yNUwK8FdnSh9U6IsveMySTIUvdL0kH1BfbEYmj3R/Y
         S6UGUvaFQF9hG+IWIAvA1Mory8IddZqDORmwM4mYSPRzXtveQdd7Q5RVsHk+9/Wbo7zs
         knU0RtSoV32gaCLSpX6V4H71d6GX4R+ISqpfaD7jA/hW4jCcrxgfHIYAAhEuMyTkKTnO
         fckhqcB+8RO9STgEvDVuYjLqpUD69+nBADc9HFvGcvSM0x8X8qphZ6n++n+FKHyrtnFV
         HY9Q==
X-Gm-Message-State: AOJu0YxYH7kjUm6TrGLhTTLTPjoLNx0R6I5UMcIAu5jANNU8VLnaghSw
	Myq/bEpQhNg7snhDyFJgnDDnQhudd95tR+xCjiNbgibtu5J7SNqE7YzyZUcNYA0=
X-Gm-Gg: ASbGncv46ftF0WUPKTT6L2GyfEyvblT4dF4wq5sT7dgP9JRUT7q5cq72yJFl8F7dhY3
	AVPK9mWNsHPxVN51AbhpK8+qzBbwv1ID75A9E7XygWMtppCWqzAWNqKZzzQXPXL2fu5HIaK0g+X
	T9r1HUKly4HH55tAu2Ox0Pvyah/J5vpf6UW+xm+Vsjf4Jlx1+EerdsPleZVPyLz/OliVoTzRHam
	z7389fK0Y3mxP5VFbSD57m0nTNspL6PHcYq/qNPJ830umVXkV587EA4stNeo03ZkvadamzWVY7l
	9tJzDWm94lAeijGnFna+124R5n41X/unnMULO2b1+YDdHg4JNFsAYHiJ9gDvbRogXDyBW3duxYw
	DWooD62wTrYBYZNHrm9N4B4eOCfavyEYOTcbwftsl+vHYIw4=
X-Google-Smtp-Source: AGHT+IHXhc25rBNfw4eftHDjphXiDL9wvYrUeit49NMjedMVQ+FbLTR0r4T1UKzJc3WYccg/k21O/A==
X-Received: by 2002:a05:622a:553:b0:48a:2122:5047 with SMTP id d75a77b69052e-494527136f4mr201727911cf.8.1747066903326;
        Mon, 12 May 2025 09:21:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49452583961sm52461791cf.58.2025.05.12.09.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:21:43 -0700 (PDT)
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
Subject: [PATCH v3 01/17] cxl: update documentation structure in prep for new docs
Date: Mon, 12 May 2025 12:21:18 -0400
Message-ID: <20250512162134.3596150-2-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512162134.3596150-1-gourry@gourry.net>
References: <20250512162134.3596150-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restructure the cxl folder to make adding docs per-page cleaner.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/index.rst           | 16 +++++++++++++---
 .../cxl/{ => linux}/access-coordinates.rst       |  0
 ...emory-devices.rst => theory-of-operation.rst} | 10 +++++-----
 3 files changed, 18 insertions(+), 8 deletions(-)
 rename Documentation/driver-api/cxl/{ => linux}/access-coordinates.rst (100%)
 rename Documentation/driver-api/cxl/{memory-devices.rst => theory-of-operation.rst} (98%)

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index 965ba90e8fb7..fe1594dc6778 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -4,12 +4,22 @@
 Compute Express Link
 ====================
 
+CXL device configuration has a complex handoff between platform (Hardware,
+BIOS, EFI), OS (early boot, core kernel, driver), and user policy decisions
+that have impacts on each other.  The docs here break up configurations steps.
+
+.. toctree::
+   :maxdepth: 2
+   :caption: Overview
+
+   theory-of-operation
+   maturity-map
+
 .. toctree::
    :maxdepth: 1
+   :caption: Linux Kernel Configuration
 
-   memory-devices
-   access-coordinates
+   linux/access-coordinates
 
-   maturity-map
 
 .. only::  subproject and html
diff --git a/Documentation/driver-api/cxl/access-coordinates.rst b/Documentation/driver-api/cxl/linux/access-coordinates.rst
similarity index 100%
rename from Documentation/driver-api/cxl/access-coordinates.rst
rename to Documentation/driver-api/cxl/linux/access-coordinates.rst
diff --git a/Documentation/driver-api/cxl/memory-devices.rst b/Documentation/driver-api/cxl/theory-of-operation.rst
similarity index 98%
rename from Documentation/driver-api/cxl/memory-devices.rst
rename to Documentation/driver-api/cxl/theory-of-operation.rst
index d732c42526df..32739e253453 100644
--- a/Documentation/driver-api/cxl/memory-devices.rst
+++ b/Documentation/driver-api/cxl/theory-of-operation.rst
@@ -1,9 +1,9 @@
 .. SPDX-License-Identifier: GPL-2.0
 .. include:: <isonum.txt>
 
-===================================
-Compute Express Link Memory Devices
-===================================
+===============================================
+Compute Express Link Driver Theory of Operation
+===============================================
 
 A Compute Express Link Memory Device is a CXL component that implements the
 CXL.mem protocol. It contains some amount of volatile memory, persistent memory,
@@ -14,8 +14,8 @@ that optionally define a device's contribution to an interleaved address
 range across multiple devices underneath a host-bridge or interleaved
 across host-bridges.
 
-CXL Bus: Theory of Operation
-============================
+The CXL Bus
+===========
 Similar to how a RAID driver takes disk objects and assembles them into a new
 logical device, the CXL subsystem is tasked to take PCIe and ACPI objects and
 assemble them into a CXL.mem decode topology. The need for runtime configuration
-- 
2.49.0

