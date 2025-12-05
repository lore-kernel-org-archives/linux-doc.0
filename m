Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BCC1D7995;
	Fri,  5 Dec 2025 01:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764896465; cv=none; b=RvKlNCQM05cH1KsPqb9fdyMJ5Ex5Osyh6OmmY6CZrDAHnpDVSU0G972xZvrrXGZfPOnstFolRyRCuxolJQxgjbE3OgXXyo1R00QFAfBD0B6lF2K2QYyn2ERlx/oYv7fhBUA/D3fkB9M5ATFEeCMcymByqYOb2vZ0jawAApaIMVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764896465; c=relaxed/simple;
	bh=ygce7zUIRYrvPm8B06PlTO5i/QU6TOFRL4KjQB5zLpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NkVd0+Fps+QaVhVKoHdb7zAxkI+YVkYm6y/xGV+A8m8MtC0oethGd548XapjNlhH44m6/gTwny2ToNLDX2FnRj9enwE1qWqlneHXpdeuw2znhNorTfi/QyPvZ/HsncY4+eI70D0cWce9R5v4+LAYuVSQlmGvG0Pf2EvvT8ZOqms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaeCV9NL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaeCV9NL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764896463; x=1796432463;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=ygce7zUIRYrvPm8B06PlTO5i/QU6TOFRL4KjQB5zLpM=;
  b=KaeCV9NL7iFseZf2pQEBP5FjAJEU/WLpqlJkLsHCRCveIezTgrTxEkbG
   ze0aq4sWH0kzvI1WccAllWBlnCXvegxd8Qd8p738hMj7SjJzggDgP7yxz
   W6WaTDMPTKeMFQ4CYhWrQsrFyUKC+YSjYOURr2n0LYORMtN5h6Dcnfr1k
   +L8uXaK6uYgwaaxnjg+tGE8s45fKWwyh4lx4KkDXPfpTR05PjXpVFmPPp
   7EDO3jrrhqLDDyOvAhUA/5l6plfdTILyWNQ2MenpEUw/O7IBVn6vLLXOW
   e1vMmlhXRQe6eedrIGlvaIXnEYEjRCZilx/1PPv7jVTm5cldkTifYn5J+
   A==;
X-CSE-ConnectionGUID: 3bCqVDEASsunzr8xMbwonA==
X-CSE-MsgGUID: ec0ET5PqR3iq4i7MvxjcRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66972534"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="66972534"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 17:01:02 -0800
X-CSE-ConnectionGUID: Ic0OemCRQ2CLvXpevF05hg==
X-CSE-MsgGUID: wdyofXOgRW6raTanCanHJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="232487175"
Received: from unknown (HELO hyperion.local) ([10.243.61.29])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 17:01:02 -0800
From: Marc Herbert <marc.herbert@linux.intel.com>
Date: Fri, 05 Dec 2025 01:00:53 +0000
Subject: [PATCH] docs: make kptr_restrict and hash_pointers reference each
 other
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-doc-hash-ptr-v1-1-573966cfa404@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAMQuMmkC/yXMPQqEMBBA4avI1A4k8Qd3ryIWMY5mtlDJRBHEu
 5vV8iveO0EoMAl8sxMC7Sy8zAk6z8B5O0+EPCSDUabSRpU4LA69FY9rDKgUlTVpWxWfBlKyBhr
 5eHZt91q2/kcu/h9wXTf/m/3PcAAAAA==
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
(please just go ahead with any minor corrections; I mean do not ask
for my opinion)
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 Documentation/admin-guide/sysctl/kernel.rst     | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6c42061ca20e..b4305fa17a19 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1867,6 +1867,9 @@
 				 param "no_hash_pointers" is an alias for
 				 this mode.
 
+			For controlling hashing dynamically at runtime,
+			use the sysctl `kernel.kptr_restrict` instead.
+
 	hashdist=	[KNL,NUMA] Large hashes allocated during boot
 			are distributed across NUMA nodes.  Defaults on
 			for 64-bit NUMA, off otherwise.
diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index f3ee807b5d8b..8833e1364ab9 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -576,6 +576,8 @@ if leaking kernel pointer values to unprivileged users is a concern.
 When ``kptr_restrict`` is set to 2, kernel pointers printed using
 %pK will be replaced with 0s regardless of privileges.
 
+For disabling these security restrictions early at boot time (and once
+for all), use the ``hash_pointers`` boot parameter instead.
 
 modprobe
 ========

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251204-doc-hash-ptr-00e46e1a5398

Best regards,
--  
Marc Herbert <marc.herbert@linux.intel.com>

