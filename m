Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4630B268FF2
	for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 18:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333431; cv=none; b=RI9WcLHOD9iI0GtCyma0e7USxroekHctKWsFzs0qcqpeCDpm3xZKFIerFhw2Z7UX3rK8TDHoYfd4CtGSv1qip0yxPj2344o7A+Lc7EU4FbsOij298IH/20erxZQG3IXWmneIr+cb9+KG+fOYhMGeU+AQnZGQN23t0gLUHZlLigI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333431; c=relaxed/simple;
	bh=VRCETR/ZNMscZ4PQziAJBi6EbuBypp6uz2gXjli2EYg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqzTFuvnY/vdUKOMFAL54nle1ztYW+pT71ZSf9WKv4N7vdPaj19MKipdrq6tStYzxfIVs5CghqxEV1H7vsICllkU3lA22kMLcqoQHNbQt/fPZVvEY31e+4yfgTwM2nc/K5a2Nk1qBkPdGw6Vjg3JjftJaSnOc8lAAy+1ykxCiNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=piDK4RO+; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="piDK4RO+"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7caea4bc9e9so194320985a.1
        for <linux-doc@vger.kernel.org>; Thu, 15 May 2025 11:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333428; x=1747938228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6KJXTjc0r76p8v9NLIxG+1plF/W6x+7amHEacWowEk=;
        b=piDK4RO+9tkwg4jUhMDgPVkkjIeDkrL4nwJsbE+YHnPeOJybDtb3y7k0a4xIPCj+L7
         0LssXD3ewidk9RUsycKZWGycnqGbtF1aQFW3fzIrzhRGJhzcTauaTst3CtqPUKJhM+cn
         B32VJc1PBbpJlzgrVOi8z6HQV5MC+SVlI/B9oC574jayWmDzcNMj1n+NBvygsQn5UKMq
         87Y+vUFE/+UgixTcN8XsE+1UgdYtyyZmhvzk8H1lu/PmwuVvwzRU778POKUdcGLS+Xzj
         fLZAtOGrh4zILl1SCRbdqy9xyTr7jdp3HHynCejX5VwT/M8e2yR1TxzGh6WissHUPoFP
         konQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333428; x=1747938228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6KJXTjc0r76p8v9NLIxG+1plF/W6x+7amHEacWowEk=;
        b=ltAtxmhZluA5efbvJG2jZQIFdppuVlPk4C7zOplPtZqeDS8pE6UrEx98+ZK2tcCVJp
         yvR5m0Lcrm0RaD0yBEEroQpBXc/RHXy7ZM7fKsO0f/bKOcM3TpPYIwJpazgMcx1fVMs4
         buIRpjf/0M3NRsNKWuTmW9gdQ+I7FTjzQxBgoGIw/CjLjYbjtWzGOEj9i/c491/k3jjQ
         o2JYT6t9o7ba9CcaDQzdQQQAxcPfWMzJEM7fOBcSTN85KVScTZ1buKdKJKS5huzucVcd
         tFap8ctuGK5jmnVRrpBb5upB0H8IyIpkjXgYRR/L1i50dD9qjJ80woeNDwppRt5gAVI0
         EtTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZLpzCJcbPOO2fqsiVMCOR4/XQ0hhjROKUi1190Wvz0VtrQjB4+vuGKYXSV+e6BBJGPkx+rcooe5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2M/XUJgcDyatWCbznmkvLHdkgab6hEMraSdArVUql0L/U6ZCZ
	dTlfE5vlMkzMFwqexHuPD9QCx0zZHvPgQzf2MwdM9yd2CHDx+YqYsagb5o7jsG8+4co=
X-Gm-Gg: ASbGncs8FfYO4ny1tXfwZ5yS5AtkyZHhhW5klrB8fcK99X6H/Bk32z5c0Jpu77LuTOy
	RxNhufaw+ehcv/Vn7y1PbcLqSAET5u/z6hgmf+DbYVHwoXqtzp89TVl0qY1tFDwHIC8lVePl62r
	ZM7nqOD1o6g2MJagm1IltgXKDybdUuwwGn5sy6iuADflslbv9jzv3CIKRmy+4yWjBGlHc3mrd3/
	/M3aH2ONQvDiea+c+EI3XjmdxTHE+Wp6pcieMttmHkcbeRAEKHgy9CyfIIqqXe7p91k6qnv3Xd4
	fbv7i5TXoLH0jYQnN2fCfZa+fZLql3oqj9GiqT2iAUF5n9d7Y33+qi2R6PgSMW8g5Ix9KIIdkl3
	dDpluut8Cq53OQZkkL95krTgFuKwm0V60pHAtQ346Ymtn
X-Google-Smtp-Source: AGHT+IEG7RwmXqR/Tm2fInhaZBiu3WtaiEVf8X1895Z0lbevuSTfErYi54kRZ9n6luWpwWWeTV+CYQ==
X-Received: by 2002:a05:620a:d89:b0:7c5:4b24:468d with SMTP id af79cd13be357-7cd46707195mr63632785a.2.1747333428187;
        Thu, 15 May 2025 11:23:48 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:47 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de
Subject: [RFC v2 15/16] docs: add luo documentation
Date: Thu, 15 May 2025 18:23:19 +0000
Message-ID: <20250515182322.117840-16-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the main documentation file for the Live Update Orchestrator
subsystem at Documentation/admin-guide/liveupdate.rst.

The new file is included in the main
Documentation/admin-guide/index.rst table of contents.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/admin-guide/index.rst      |  1 +
 Documentation/admin-guide/liveupdate.rst | 62 ++++++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 Documentation/admin-guide/liveupdate.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 259d79fbeb94..3f59ccf32760 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -95,6 +95,7 @@ likely to be of interest on almost any system.
    cgroup-v2
    cgroup-v1/index
    cpu-load
+   liveupdate
    mm/index
    module-signing
    namespaces/index
diff --git a/Documentation/admin-guide/liveupdate.rst b/Documentation/admin-guide/liveupdate.rst
new file mode 100644
index 000000000000..bff9475d2518
--- /dev/null
+++ b/Documentation/admin-guide/liveupdate.rst
@@ -0,0 +1,62 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Live Update Orchestrator (LUO)
+==============================
+:Author: Pasha Tatashin <pasha.tatashin@soleen.com>
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_core.c
+   :doc: Live Update Orchestrator (LUO)
+
+LUO Subsystems Participation
+============================
+.. kernel-doc:: drivers/misc/liveupdate/luo_subsystems.c
+   :doc: LUO Subsystems support
+
+LUO Preserving File Descriptors
+===============================
+.. kernel-doc:: drivers/misc/liveupdate/luo_files.c
+   :doc: LUO file descriptors
+
+LUO ioctl interface
+===================
+.. kernel-doc:: drivers/misc/liveupdate/luo_ioctl.c
+   :doc: LUO ioctl Interface
+
+LUO sysfs interface
+===================
+.. kernel-doc:: drivers/misc/liveupdate/luo_sysfs.c
+   :doc: LUO sysfs interface
+
+LUO selftests ioctl
+===================
+.. kernel-doc:: drivers/misc/liveupdate/luo_selftests.c
+   :doc: LUO Selftests
+
+ioctl uAPI
+===========
+.. kernel-doc:: include/uapi/linux/liveupdate.h
+
+Public API
+==========
+.. kernel-doc:: include/linux/liveupdate.h
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_core.c
+   :export:
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_subsystems.c
+   :export:
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_files.c
+   :export:
+
+Internal API
+============
+.. kernel-doc:: drivers/misc/liveupdate/luo_core.c
+   :internal:
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_subsystems.c
+   :internal:
+
+.. kernel-doc:: drivers/misc/liveupdate/luo_files.c
+   :internal:
-- 
2.49.0.1101.gccaa498523-goog

