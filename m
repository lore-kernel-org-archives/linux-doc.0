Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E31224F6
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 02:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750905667; cv=none; b=Sj59gX884A1W6na7lSHFrhroig+L9VeOkfdBuok7SKvPpBImAS7zsBceahYkOQi9SuhEBq1laC2RHO7qPWeI5asdU6npiM9vtkyDsVrfBpxvvp6h87D/BGk9cqvMgycDAaBiuacGVDK876ywcyhs/f1hLIZDcA0at2x8zWYAWv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750905667; c=relaxed/simple;
	bh=mcNW4oFIr8rukoMKkDVgsRO0bfejc+RBMBJm5AZw4So=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tb2HU9PxN47ytJPKarnRqw9o6aIWl4Di+fCZBuIx/d3IxuMVyjr0tA9Y8j9FZ4i0tgb8FueFO5qZ+xU1EXTJYEk3CKYvwRb8nB7mWSryh2ZpAxcUNBO48ETpxiv6p+wYm8D/hDyMF9051buHH/miitlrDjhwVAtX4RnuWWiRfK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bsQsCs8w; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bsQsCs8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750905665; x=1782441665;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mcNW4oFIr8rukoMKkDVgsRO0bfejc+RBMBJm5AZw4So=;
  b=bsQsCs8wEVL1001mhEZkzwMuCEOwgU9IrGcopWWOPhtKD79l9N1egMSu
   wzsuDEnpR/TMum6GI+7KSjqaaFz8bglS9GQq6hQCbouqacNw46mvYk+eA
   V9jS96g9dR7FsQKfGYVTibT2HaO4XuqVwxRcrpwIUg9MbhOZsPKfPIpUC
   W41qvKBoVcUP1eLwgU3TKOHF8odItN6gAKfNO5hxHwdb4Ia0am1hjO+34
   Es7NWw1Fe2tm+Bjqrqxtu+84WkYVDlHDsOaCJ05Ez3KntHjrK3Eb4yBVI
   UvizgDACgTK+JOmKvyVMtEGPhC9Zc2M678gWdfGDP/Gov8YSOHt2YaVwD
   Q==;
X-CSE-ConnectionGUID: SJ/gpjwtTbqIP6JzI+le4g==
X-CSE-MsgGUID: HH6uhtwfT+2pJATryeXPrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="40808075"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="40808075"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 19:41:05 -0700
X-CSE-ConnectionGUID: +6t4ge88SGq0Lp1tIHxrmA==
X-CSE-MsgGUID: W+SAwypvTWehGd+0hK+lNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152882258"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost) ([10.124.223.253])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 19:41:04 -0700
From: alison.schofield@intel.com
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Alison Schofield <alison.schofield@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH] docs: ABI: make the KernelVersion field optional
Date: Wed, 25 Jun 2025 19:40:58 -0700
Message-ID: <20250626024101.792073-1-alison.schofield@intel.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alison Schofield <alison.schofield@intel.com>

The KernelVersion field has limited practical value. Git history
provides more accurate tracking of when features were introduced
and target kernel versions often change during development and
merge.

Label it optional.

Signed-off-by: Alison Schofield <alison.schofield@intel.com>
---

Plan B is to remove the field entirely. 


 Documentation/ABI/README | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/README b/Documentation/ABI/README
index ef0e6d11e919..315fffe1f831 100644
--- a/Documentation/ABI/README
+++ b/Documentation/ABI/README
@@ -46,7 +46,9 @@ Every file in these directories will contain the following information:
 
 What:		Short description of the interface
 Date:		Date created
-KernelVersion:	Kernel version this feature first showed up in.
+KernelVersion:	(Optional) Kernel version this feature first showed up in.
+		Note: git history often provides more accurate version
+		info, so this field may be omitted.
 Contact:	Primary contact for this interface (may be a mailing list)
 Description:	Long description of the interface and how to use it.
 Users:		All users of this interface who wish to be notified when
-- 
2.37.3

