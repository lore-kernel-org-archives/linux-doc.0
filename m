Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E908F3F0749;
	Thu, 30 Jul 2026 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416110; cv=none; b=uUmDqhzpEMxcmO2j1Gz7BECGerECF6zT/1wE1aSXziBD2xLWDl3h6k2APBxXm/q2YiodPKafld6J5u/gaX47jLG4HI/ksjpx7VAvdTFETjylbXB7At/x97JXXYNbjK178mPn87RlQSFM8kvES2EFWxKRjP/7XfylU4cfS2Bs/rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416110; c=relaxed/simple;
	bh=X5n5YfTl1yffU+8nqWzVEmVblZbXfBM1c0DNoWjf0ys=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mqy8WgEHqXcCoN9kun2m953chKyV8IjoyKYfEGrnI8m+zImu/XbY9NA27XSKlC0VfISQDTW/9n9kREd/YTOzMYDLotIr4bDlsF4X2wiw7je/Y/fZPmth2jdBKxmaWZu5Pd1rJlUEPzD1oB2DJVZUM7jVH5L9adx6d/KJnTt/TrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=owbVMsF2; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="owbVMsF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785416107; x=1816952107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PzXQCR0HNnIFyL6rR8ghS2+1v1RUkivR8qUOIx2qwEo=;
  b=owbVMsF2z+SJDSWn0gYx4nu0YFpmZTyEvJW4w4ffBt7orp3Xjq2nWJg4
   wio6C8/CC2niYsSqIOpbANsqE6AoAl7qMuE67JYO/Ld0L802rAnyLds9l
   8xVRnBKgC/qW+L9ytCHXUut8oqO4tQC33v/jTD/3A8t5KEBGZQCMTMh/l
   wdIk1+SB0MPPpwWodpBWzBqtunpizzaGJIT95SvBnVy+uuC/8dd48QBLP
   3RlkwTvduck6hSDWcN09u3lNuPVzUwZwmoygr0chyqIctez3Q5ovRBhP4
   huclv/hYe4YYBUizrAMcfVlvIibVMlEYBNvSOY5xQ8rVU5TeWXEvZH+8/
   Q==;
X-CSE-ConnectionGUID: xWT776G/Rq+zsbRvrz/D6A==
X-CSE-MsgGUID: CnF0Kg2dRL6/gtWCzlVBow==
X-IronPort-AV: E=Sophos;i="6.25,194,1779148800"; 
   d="scan'208";a="24437671"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 12:55:04 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:29378]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.31:2525] with esmtp (Farcaster)
 id 44591dac-551b-4fe3-aeff-06b70e8d1e0e; Thu, 30 Jul 2026 12:55:04 +0000 (UTC)
X-Farcaster-Flow-ID: 44591dac-551b-4fe3-aeff-06b70e8d1e0e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:55:03 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:55:01 +0000
From: Alexander Graf <graf@amazon.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
	<corbet@lwn.net>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Shuah Khan <skhan@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mancio@amazon.com>, <diapop@amazon.com>, <mknaust@amazon.com>
Subject: [PATCH 7/8] Documentation: ABI: Describe nitro_enclaves cpu_pool sysfs
Date: Thu, 30 Jul 2026 12:53:11 +0000
Message-ID: <20260730125312.71415-8-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260730125312.71415-1-graf@amazon.com>
References: <20260730125312.71415-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D042UWB002.ant.amazon.com (10.13.139.175) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

An operator or an orchestrator placing an enclave needs more than the
contents of these files: how far the partition between used and avail
goes, and which node the enclave allocates from when it does not name
one. Write both down.

Assisted-by: Kiro:claude-opus-5
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 .../sysfs-devices-virtual-misc-nitro_enclaves | 44 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-virtual-misc-nitro_enclaves

diff --git a/Documentation/ABI/testing/sysfs-devices-virtual-misc-nitro_enclaves b/Documentation/ABI/testing/sysfs-devices-virtual-misc-nitro_enclaves
new file mode 100644
index 000000000000..20b978c62244
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-virtual-misc-nitro_enclaves
@@ -0,0 +1,44 @@
+What:		/sys/devices/virtual/misc/nitro_enclaves/cpu_pool/mode
+Date:		July 2026
+KernelVersion:	7.3
+Contact:	aws-nitro-enclaves-devel@amazon.com
+Description:
+		Read-only. Mode of the Nitro Enclaves CPU pool, one of:
+
+		  none     the pool is empty (ne_cpus is unset)
+		  static   ne_cpus is a CPU list; the listed CPUs are
+		           offlined and dedicated to the pool
+
+What:		/sys/devices/virtual/misc/nitro_enclaves/cpu_pool/total
+What:		/sys/devices/virtual/misc/nitro_enclaves/cpu_pool/used
+What:		/sys/devices/virtual/misc/nitro_enclaves/cpu_pool/avail
+Date:		July 2026
+KernelVersion:	7.3
+Contact:	aws-nitro-enclaves-devel@amazon.com
+Description:
+		Read-only. CPU-list strings describing the Nitro Enclaves CPU
+		pool: total is every CPU thread dedicated to the pool, used is
+		the threads held on behalf of enclaves, and avail is the
+		threads free for allocation. A thread leaves used when the
+		enclave holding it is released; if that release fails part way
+		through, the thread stays in used until the driver is unloaded
+		or the machine reboots. used and avail partition total at any
+		instant, and each read is a consistent snapshot, so a thread
+		that changes hands between two reads can be absent from both.
+		total changes only when the pool is reconfigured, which
+		requires that no enclave exists.
+
+		These files report no error of their own. A read does take the
+		pool lock, so it can wait for a write to ne_cpus to finish.
+
+		By default, allocation for a new enclave targets the NUMA
+		node that owns the first core in total and does not spill to
+		another node. NE_SET_ALLOC_NUMA_NODE changes the target, and
+		its node-agnostic value lets one enclave take cores from
+		more than one node.
+
+		Pool threads are offline, so the threads free on a given
+		node come from intersecting avail with the nodeN/cpuM
+		symlinks under /sys/devices/system/node, which outlive a CPU
+		going offline. nodeN/cpulist is filtered against
+		cpu_online_mask and lists none of them.
diff --git a/MAINTAINERS b/MAINTAINERS
index 716acfc3d7c1..e573764d9cc2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19184,6 +19184,7 @@ R:	The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 W:	https://aws.amazon.com/ec2/nitro/nitro-enclaves/
+F:	Documentation/ABI/testing/sysfs-devices-virtual-misc-nitro_enclaves
 F:	Documentation/virt/ne_overview.rst
 F:	drivers/virt/nitro_enclaves/
 F:	include/linux/nitro_enclaves.h
-- 
2.47.1

