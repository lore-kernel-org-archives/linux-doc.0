Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F8E289E04
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746036692; cv=none; b=ahg2UmCGwE5xvgQxvEs4NCgn/+yP5Iy8TVtqRJVCuDM9xnbTfJ2aTCuZKL/UGsZ8ihuZXGNqAik1ca5M7R/n6I6lpn+0FdlVwYMpIViSwOZg4nRTHQASqMKYLAmXVhKuJ+HGbr6SI06roOUksoqzR8/k6edNqRfC9VUuAXiF6O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746036692; c=relaxed/simple;
	bh=y+zXYdm8lR81Xt8s2hy8d74VfZoLwscWMB6SycFNemM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=up/P3ItIBMku/mB7xxkQ5PlcI8d3jrf5UZ7CB6cvFFm2jnpVOqabIaFasDmJs1gxMp73gbFasIC0b0iqqtakbvffYLjKVqO60dc4pnRdRifL7jWFrZjJOOBm5vbin6VZjbig11C+kOwMHupQI+Y1Nd2srntyZrS9koLhpx6OQFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=doA73Zbz; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="doA73Zbz"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47677b77725so2254571cf.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1746036690; x=1746641490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZA/uzDtyuFWn0NODL0whOKAEDNrO7IK9AQ6WwWNv0fM=;
        b=doA73ZbzVUZrFPubkg+KlKO3AfNyAz5rQdhhQi5a6rHopWQGXMvZkoBW4TByp2uzaK
         1ighbuIXTaJdYI2BPtYP1Zqe+CpPzocB6YpJsaWADV2s/wXjQYp4/l1qmO45I2HhDLNZ
         jK5Tu/O+roAeJMzc7XvTo7PFk6mS7sjd648KSouXXZUpmsQLEcVazdqpgPMR04U4wbQX
         hWo3lH8kUMaPm+OYS9x8aatuRxIUNTv+57lsfIVneaG7dOE7hERz8yMmKqNbLllwSulk
         ywlLTeAWo6XIQoakdU145GBhwlnUFcDe0J/UgWrfDLHlZ8d7+4tNKd07+FVn7n98xa4X
         Zu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746036690; x=1746641490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZA/uzDtyuFWn0NODL0whOKAEDNrO7IK9AQ6WwWNv0fM=;
        b=B+axXDD+WolXtWQFuVk6MTNrA4Fz7nBzgRqhdPiNGB6bS3xjPe52wEPiKw8/zdE09e
         Ssesgu+c5v6Gu3t0b9VyNSThMm1cCb10Tk7fqUgNqV/ue3c7298JubBR4vF9GsZK38Vl
         02KzBqDPvRtgPe7hC2sUevw2wEzUdCNM4sFIV8EHiIComkJYiz8HOF8n14iy9QXh5t/S
         D0/hSinYD+z3mNBzfkdqGf7zLE92+k8Dah2arLy0T3Dc8VAHdy3MaaHtMykd8tA8hFWe
         kNrqd8DqxPcyzXMj8CzABrIriScJ2Ha3jhm5SEXRpYwQmmG9uNM9CBQqGnJWDkD47tsU
         5lLg==
X-Gm-Message-State: AOJu0YysvNYoN59flLTnLhPEkahIVFXQsqDMtQ8XaUQIdJl25J192Eyo
	hLMwylYiPmSt6XNQDMwUoqN1lPQtz0T8G7xzdX1imvqeT8A1AKseVBOFJJ5pQQefBa8vZTfB2Gl
	z
X-Gm-Gg: ASbGncuai1HBvz2jV9fgixG0OXablvSECKDunfgpjeRBavxmx9+UUtwL9tBkiwE+3Qc
	ZKcO+J0K4rrTn+PzLBGOgS4KPtsdxLKsA3KUYLIA8uVx0xgDRYeN/g52JDNAb5vzk9/gFjeImZe
	LF3QWXUyrpLBp/G7foXlkARIYyoC01en4T5DR9MnVriAi6IX3XVDuuggqro60w+gisNSV2lrb/O
	Th930Ayz07Ue2cWpb2q0heiUlmj8azyLyp/zK3SFOptav96S4Mw3OA6VZc7eLphG0StY9t19ZuX
	BEWLdGFuY/dOMvvnk2vfo6Vp+YkwkJqzh/T7zSaRxOaYPqgu1banTVnGXVp5R+AtLMulqaGHtgy
	7eMvHTOWViM74NMtWlEKsCRovI2u9
X-Google-Smtp-Source: AGHT+IEv91mZMPKNU0PUGx07QOnNDsFCio0WccLHM/KQVlDxKGCYzZ3aQ4Acw83pDA3zj/uh5YlXmQ==
X-Received: by 2002:a05:622a:5c1b:b0:476:71d2:61e0 with SMTP id d75a77b69052e-489c4356885mr70289341cf.23.1746036689813;
        Wed, 30 Apr 2025 11:11:29 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48a64fe04efsm5897421cf.19.2025.04.30.11.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:11:29 -0700 (PDT)
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
Subject: [RFC PATCH v2 17/18] cxl: docs/use-cases
Date: Wed, 30 Apr 2025 14:10:47 -0400
Message-ID: <20250430181048.1197475-18-gourry@gourry.net>
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

Add carve-outs for use-case documentation.  Complete open as to
what (if anything) we should explain here, and/or what the structure
should be.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/index.rst        | 10 ++++++++++
 .../cxl/use-case/dynamic-capacity.rst         | 20 +++++++++++++++++++
 .../cxl/use-case/memory-expansion.rst         | 15 ++++++++++++++
 .../driver-api/cxl/use-case/shared-memory.rst | 15 ++++++++++++++
 .../cxl/use-case/virtual-machines.rst         | 19 ++++++++++++++++++
 5 files changed, 79 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/use-case/dynamic-capacity.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/memory-expansion.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/shared-memory.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/virtual-machines.rst

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index e58d057a16e3..956434e23e41 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -49,5 +49,15 @@ that have impacts on each other.  The docs here break up configurations steps.
    allocation/page-allocator
    allocation/reclaim
    allocation/hugepages.rst
+   allocation/tiering.rst
+
+.. toctree::
+   :maxdepth: 1
+   :caption: Use Cases
+
+   use-case/memory-expansion.rst
+   use-case/dynamic-capacity.rst
+   use-case/virtual-machines.rst
+   use-case/shared-memory.rst
 
 .. only::  subproject and html
diff --git a/Documentation/driver-api/cxl/use-case/dynamic-capacity.rst b/Documentation/driver-api/cxl/use-case/dynamic-capacity.rst
new file mode 100644
index 000000000000..002f30e6eca9
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/dynamic-capacity.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================
+Dynamic Capacity
+================
+todo
+
+For Virtual Machines
+====================
+todo
+
+For Workload Orchestration
+==========================
+todo
+
+For Shared Memory
+=================
+todo
+
+
diff --git a/Documentation/driver-api/cxl/use-case/memory-expansion.rst b/Documentation/driver-api/cxl/use-case/memory-expansion.rst
new file mode 100644
index 000000000000..2ebe1d92b556
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/memory-expansion.rst
@@ -0,0 +1,15 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================
+Memory Expansion
+================
+
+todo
+
+As Page Cache
+=============
+todo
+
+As DAX Device
+=============
+todo
diff --git a/Documentation/driver-api/cxl/use-case/shared-memory.rst b/Documentation/driver-api/cxl/use-case/shared-memory.rst
new file mode 100644
index 000000000000..3b13b30ddd70
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/shared-memory.rst
@@ -0,0 +1,15 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+Shared Memory
+=============
+todo
+
+Coherence
+=========
+todo
+
+Fabric Attached Memory FileSystem (FAMFS)
+=========================================
+
+todo
diff --git a/Documentation/driver-api/cxl/use-case/virtual-machines.rst b/Documentation/driver-api/cxl/use-case/virtual-machines.rst
new file mode 100644
index 000000000000..8fdeccdd5c1c
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/virtual-machines.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================
+Virtual Machines
+================
+
+todo
+
+NUMA Passthrough
+================
+todo
+
+Flexible Shapes
+===============
+todo
+
+Datacenter Efficiency
+=====================
+todo
-- 
2.49.0

