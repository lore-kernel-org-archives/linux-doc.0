Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D591E7C0A
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 00:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971989; cv=none; b=ZPjrH6E4Z7v479rWpbar759vXBUcr7QqCGieTOKFPx1XnAly2cROemY3F6bupQQ8ZmJtngOckwmPUI4eYvgrGOLEaGS3sjjl3S9Qph7pVv8IcGP/fYjbQdHwTzJOIhMcofIzDYdI5EFZ2QjBcEDMO27OG+sYegvKiISz/ConNNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971989; c=relaxed/simple;
	bh=BzfFAM5BhwnMp75QAL22bKF9ElQQxGopTB6tLuSsWJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lgVROkcor3GTDHKwM/8yMjmKAkD56npFP+IjHm4gBICf1FD9GHRrEvm/kKId8omUMspHrdjdqnnvrJqxSm27ThZXFsrnlnIrHeXy0OBtUkVjHk0y+gc601QuOZSnTFdwY6FiUEon5xC4liV3fgXKVkrX/W8SRR4bGy2OKC5Cib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EQAEqXJe; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EQAEqXJe"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47691d82bfbso148739061cf.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 17:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745971986; x=1746576786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3Yyi9y+v5P6bmpZgdp45DsIU9acCM/HjEvTDZbsG00=;
        b=EQAEqXJe6sjJzQYrxPBEe5xRaSbx+ib/+GvuPxwq9/h8jM4I/R8CJANbkbgTnXMO99
         9khpcaeCCb6B8eqL+/FHyYCdnX6N0wvKeXz2KXZQpQnLuyiVfIjPl7tEWtHemHq8uEID
         7wKYwjCmV8WSr7YRNcAcCZXbVhHu9Qi0mhg8YOyUayGEvTtKOJJA5C3wniEH+aIQg4q7
         mVtPixyORl006jKHhnAbv+1QojHQ7Swjdgoa+ql0IAr9UPdVPykxjDafZ8AJGaAhzC+u
         zKNCcW8P/cinfLvZuOrO6L24T6JV/sEZ/QgVYJHMm0kLWNzS+Z0+MslQumaV37KC1S/G
         i0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745971986; x=1746576786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3Yyi9y+v5P6bmpZgdp45DsIU9acCM/HjEvTDZbsG00=;
        b=lGVz5tPhK1z4VnnkkJSzo+EMqdaKZ3T8SjtRegfXwqLv5YTuCfXWRayXQe7UMtjmcF
         planJ7H8R+iqSnpiMlaz/fe02f1YBq1FfdmTuBoMDgkE2zKZrVlEmUmEyjrnlFZfWbgu
         4o1WrQbTrkcdTGtg5lnqwkPDK7p3baPCRumouml7BCBf0Jwioz2nvFe8/tK8JVlDQUt6
         lzNylc+rdkVfKod8PYa7GxtdKoxeXL0kHsiEQr706T0jTMFKePl2a82rFMmJM14+A+Cv
         Zn7os73pf95tsoIyBAR1LNZVkKiFxNrcnl1DiSWFJWXZWavuomyju9aOz4JTSM+XHGZy
         n/8g==
X-Gm-Message-State: AOJu0YwXPRcUYL3vcGus6VU6VPe9R2K+C13E3Szwi+IQzr0/wyetozxE
	QYCeilV95xdPPdiPwSvUfOWTKMcyheNR3n2SELxFQis7BtTW1yycyM/Jsn2ykMY=
X-Gm-Gg: ASbGncuCXfJ8mqMPWlf9cqWBTDV71KgWlB1b/ecXZOv5T7f4X/WF8/XXhz5T92RTldX
	YwmC6ObAExP+2UkYC58G/BDwGSfEoCQcr5boxhfNG1zf2pZ04LspJd8RrZEb8BICwqnZNLMZUDx
	nGA+qCmAniI1RyxVNHGgdtvOeQiGD0BhFLSaABn9ZSBMN5vpxBX1nCnameHQ6VQJ66a+5jNLAbv
	vPToFbg5qFO9dcmF475YsjRM50pgQ5HlNu+gvkb4A8ZFrpCsjpscdI8FHvVq1YQk8dycM+o2q02
	/NPnX+PSMz4msKxOB4oc89umijh4l0Ie1Vcy1Y1sXdXk/W5IHZznCFacxxznM7yi4mS26kezdAp
	bnZtuMLnzEn2BQd1YdSLDI1hsh7VuxQBdtITrOrY=
X-Google-Smtp-Source: AGHT+IHDh8J8wln5z2S1SJ1zWQwlLw93RU9T3YfEZpUHWnDL1YaDIdRHES8teoNW5qqZZtojkjVFlQ==
X-Received: by 2002:a05:622a:17cc:b0:476:bb72:f429 with SMTP id d75a77b69052e-489e63d8bbamr9206451cf.42.1745971986365;
        Tue, 29 Apr 2025 17:13:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f7a820esm87634411cf.41.2025.04.29.17.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:13:06 -0700 (PDT)
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
Subject: [RFC PATCH 17/17] cxl: docs/use-cases
Date: Tue, 29 Apr 2025 20:12:24 -0400
Message-ID: <20250430001224.1028656-18-gourry@gourry.net>
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

Add carve-outs for use-case documentation.  Complete open as to
what (if anything) we should explain here, and/or what the structure
should be.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/driver-api/cxl/index.rst        | 10 ++++++++++
 .../cxl/use-case/dynamic-capacity.rst         | 19 +++++++++++++++++++
 .../cxl/use-case/memory-expansion.rst         | 14 ++++++++++++++
 .../driver-api/cxl/use-case/shared-memory.rst | 14 ++++++++++++++
 .../cxl/use-case/virtual-machines.rst         | 18 ++++++++++++++++++
 5 files changed, 75 insertions(+)
 create mode 100644 Documentation/driver-api/cxl/use-case/dynamic-capacity.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/memory-expansion.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/shared-memory.rst
 create mode 100644 Documentation/driver-api/cxl/use-case/virtual-machines.rst

diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index 51dd0392883b..e0a86f68b6f8 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -50,5 +50,15 @@ that have impacts on each other.  The docs here break up configurations steps.
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
index 000000000000..93a24aa1edc5
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/dynamic-capacity.rst
@@ -0,0 +1,19 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Dynamic Capacity
+################
+todo
+
+For Virtual Machines
+********************
+todo
+
+For Workload Orchestration
+**************************
+todo
+
+For Shared Memory
+*****************
+todo
+
+
diff --git a/Documentation/driver-api/cxl/use-case/memory-expansion.rst b/Documentation/driver-api/cxl/use-case/memory-expansion.rst
new file mode 100644
index 000000000000..d1d25e0e4498
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/memory-expansion.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Memory Expansion
+################
+
+todo
+
+As Page Cache
+*************
+todo
+
+As DAX Device
+*************
+todo
diff --git a/Documentation/driver-api/cxl/use-case/shared-memory.rst b/Documentation/driver-api/cxl/use-case/shared-memory.rst
new file mode 100644
index 000000000000..dfdc2c419ea2
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/shared-memory.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Shared Memory
+#############
+todo
+
+Coherence
+*********
+todo
+
+Fabric Attached Memory FileSystem (FAMFS)
+*****************************************
+
+todo
diff --git a/Documentation/driver-api/cxl/use-case/virtual-machines.rst b/Documentation/driver-api/cxl/use-case/virtual-machines.rst
new file mode 100644
index 000000000000..0411d37092ce
--- /dev/null
+++ b/Documentation/driver-api/cxl/use-case/virtual-machines.rst
@@ -0,0 +1,18 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Virtual Machines
+################
+
+todo
+
+NUMA Passthrough
+****************
+todo
+
+Flexible Shapes
+***************
+todo
+
+Datacenter Efficiency
+*********************
+todo
-- 
2.49.0

