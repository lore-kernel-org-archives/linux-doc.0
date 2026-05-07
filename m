Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00D6361DDC;
	Thu,  7 May 2026 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161701; cv=none; b=XJOpiIbTUoKSoOA8fbu6I1DuHYLOmS7JD1yUSyx/VVv8dTWXtp1OlfNzARf3q60jICcc4LYkh+BXQVXtYwVTFluGV8kLcVB600M49HpVPRgymAIKf5RTujXozHm9FM1YkHtjOzc5rkhJrpeoFAgrtAKM76teg/MKP0KdWqdk2LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161701; c=relaxed/simple;
	bh=0R4O5IPc386qWkclBXAtL8ZIKxVxu1D1NnvXenQSADU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oX5RcZCM8wUy/6SpP3LcMpJ8GUZPBmVl7lOjZG5WDvbuIFtY4ONM2HLd7qEa+rOVejlRA9qMLtyDq7jWFWNjnhsb6twbPdnzWiyupHbgobJdhrfuHnuRNTi/+VFmjvXKCwpgIFlnXOx9ffIH8ZitafDEz6Gx4Zt9Df08SmlfBYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cf7aaWd9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cf7aaWd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778161700; x=1809697700;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0R4O5IPc386qWkclBXAtL8ZIKxVxu1D1NnvXenQSADU=;
  b=Cf7aaWd9iseS29xmVwonRDeZyLyuUtdk1H9SFup9xZ53kq7RhUCy4JDA
   p8fBRWMz1FQq23PEqX3yJCdY1AG8L4xE4PyR8G+Y9MlfPjzrFHndUKTgZ
   +dqrEefge9oxESLfH4+uhQqu5lfKBtgS5J8d7rxY79EdqU8zS7fsnfmJl
   kX14Dgxz/Cnn6hc0SnptPVPEnz24lS3+mg6hSVYG1xhQgbE3W8HfnsiuO
   6Z9Vhd1SCHHlecRxyfJkyGEnBqw9mXaFwizisj5PEuAHWr58y0hfT71jS
   gFQ9KZSk88bXZooh+VlqgSJnkC1HxJpk4EuucQ8/qvkdaMKF6lKujcVqF
   g==;
X-CSE-ConnectionGUID: kSxy19ceRJas6plzzH2Ikw==
X-CSE-MsgGUID: JZvgCTXmRJ+ZDea0YAHCrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78827373"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="78827373"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:48:20 -0700
X-CSE-ConnectionGUID: aHFCaNvHQgSFPfikCFIgoA==
X-CSE-MsgGUID: FSs4np0HQAuelWG6xnd5Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="266844559"
Received: from jf.jf.intel.com (HELO 984fee019967.jf.intel.com) ([10.23.153.244])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:48:19 -0700
From: Chao Gao <chao.gao@intel.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Chao Gao <chao.gao@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH] Documentation: core-api/cpu_hotplug: Remove stale cpu0_hotplug docs
Date: Thu,  7 May 2026 06:47:31 -0700
Message-ID: <20260507134732.254617-1-chao.gao@intel.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit e59e74dc48a3 ("x86/topology: Remove CPU0 hotplug option")
removed the 'cpu0_hotplug' option, but its documentation remained in
cpu_hotplug.rst. Remove the stale entry.

Reported-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Chao Gao <chao.gao@intel.com>
---
 Documentation/core-api/cpu_hotplug.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index 9b4afca9fd09..6de26d1c6a9a 100644
--- a/Documentation/core-api/cpu_hotplug.rst
+++ b/Documentation/core-api/cpu_hotplug.rst
@@ -45,11 +45,6 @@ Command Line Switches
 
   This option is limited to the X86 and S390 architecture.
 
-``cpu0_hotplug``
-  Allow to shutdown CPU0.
-
-  This option is limited to the X86 architecture.
-
 CPU maps
 ========
 
-- 
2.52.0

