Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DE7318EC0;
	Wed,  7 Jan 2026 20:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767817318; cv=none; b=aoslHNunrUgfpuS5KMrpDNbfAuW25cvAm/mgXq1oQJ00RseqhSQP8oV7ssTksO1zGJXAIEQyDYAPFD7qjjSk4Y0A5YzW19Yy2ft7mms0R1XbM+THcd9h4IbbqYW6+f7bf3XPX6ojpw8hOb3AL6MM0ZmGmnitzQb8RzZ9bepdN7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767817318; c=relaxed/simple;
	bh=7F5tN/ruRFASpTjk1UyCZ3kZftqiWiuAfphfJ9gXIC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a+sgvQYkVXIhSLalCYG2L9zo6ZXKD5aD3fqPL7lDoDMLwTuw4dfXpT6ir0MoKUxAdjAs9AX81XRv8RViJcOshOUtsiXoOZuOaGsCwFEF3Tr6xgpvOHxJPaliBT/uHBtb7AxrLpiMQzD0If/WZ9qkyiKSNSME4p66x2cvVZuH5qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QntoL3rZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QntoL3rZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767817316; x=1799353316;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=7F5tN/ruRFASpTjk1UyCZ3kZftqiWiuAfphfJ9gXIC0=;
  b=QntoL3rZzswQcNwnU1lplcmHsbsDAY4Ix9CiG64buyBW4nlb/72Rf0pa
   DRsQFlWwJzk2EB7+0QSRS3ittPzUweqzeUzmo6shSfU8TmILKJxGjYr8j
   AVrts7ANwbAFLuNzsNQ4utcjJ2fvkaLcKms86gFU60jPJ4eXyerk9dFHz
   K+6pObpLTFuDNCiqJuCUJ6pfA1IuR57LeAR+M0aq8wqHBOcA0gl9rJebj
   2NqdMK0T7rkqUxzvFW+5IKdfXBfXF4aKL77IR66tCr3PiuvPckoAZUfwV
   q9CiqlU4YnUAkQeVl7lnCXX5SWIXQIAvQKJTeCcrJu1WYKlfOOGDLoeoN
   g==;
X-CSE-ConnectionGUID: ylblDhRHR5+ODcOYHCTcZA==
X-CSE-MsgGUID: 14TLc/KWSI6fCLMinj/pyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86783055"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="86783055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 12:21:56 -0800
X-CSE-ConnectionGUID: xZLceSCjSqmjQS0Rd5roqg==
X-CSE-MsgGUID: ma/BnG3iR/man7nWdORXYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="240496400"
Received: from unknown (HELO hyperion.local) ([10.243.61.29])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 12:21:56 -0800
From: Marc Herbert <marc.herbert@linux.intel.com>
Date: Wed, 07 Jan 2026 20:21:32 +0000
Subject: [PATCH v2] docs: make kptr_restrict and hash_pointers reference
 each other
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-doc-hash-ptr-v2-1-cb4c161218d7@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAEzAXmkC/1WNQQ6DIBQFr2JYFwMItrrqPRoXFL/lNxYMoLEx3
 r1q00WXk8ybt5AIASGSOltIgAkjereBOGXEWO0eQLHdmAgmFBdM0tYbanW0dEiBMgayBK5VUV3
 INhkCdDgfuVvz5Tjen2DS3tgNizH58D7+Jr57v7T6T0+ccqrORVWWptOSyWuPbpxzdAn63PgXa
 dZ1/QA6MXvhwAAAAA==
X-Change-ID: 20251204-doc-hash-ptr-00e46e1a5398
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Marc Herbert <marc.herbert@linux.intel.com>
X-Mailer: b4 0.15-dev

vsprintf.c uses a mix of the `kernel.kptr_restrict` sysctl and the
`hash_pointers` boot param to control pointer hashing. But that wasn't
possible to tell without looking at the source code.

They have a different focus and purpose. To avoid wasting the time of
users trying to use one instead of the other, simply have them reference
each other in the Documentation.

Signed-off-by: Marc Herbert <marc.herbert@linux.intel.com>
---
Please just go ahead with any minor correction(s); I mean do not ask
for my opinion.

Changes in v2:
- Rebased on today's docs-next/master to fix textual, unrelated conflict
- Stop using backquotes in kernel-parameters.txt for consistency
- Link to v1: https://patch.msgid.link/20251205-doc-hash-ptr-v1-1-573966cfa404@linux.intel.com
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 Documentation/admin-guide/sysctl/kernel.rst     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a8d0afde7f85..b189dfd60059 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1969,6 +1969,9 @@ Kernel parameters
 				 param "no_hash_pointers" is an alias for
 				 this mode.
 
+			For controlling hashing dynamically at runtime,
+			use the "kernel.kptr_restrict" sysctl instead.
+
 	hashdist=	[KNL,NUMA] Large hashes allocated during boot
 			are distributed across NUMA nodes.  Defaults on
 			for 64-bit NUMA, off otherwise.
diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 239da22c4e28..0315eb7ee6d4 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -591,6 +591,9 @@ if leaking kernel pointer values to unprivileged users is a concern.
 When ``kptr_restrict`` is set to 2, kernel pointers printed using
 %pK will be replaced with 0s regardless of privileges.
 
+For disabling these security restrictions early at boot time (and once
+for all), use the ``hash_pointers`` boot parameter instead.
+
 softlockup_sys_info & hardlockup_sys_info
 =========================================
 A comma separated list of extra system information to be dumped when

---
base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
change-id: 20251204-doc-hash-ptr-00e46e1a5398

Best regards,
--  
Marc Herbert <marc.herbert@linux.intel.com>

